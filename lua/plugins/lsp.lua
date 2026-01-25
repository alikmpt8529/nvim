return {
  {
    -- `lazydev` は、Neovim の設定、ランタイム、プラグイン用の Lua LSP を設定します
    -- Neovim API の補完、注釈、シグネチャに使用されます
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- `vim.uv` という単語が見つかったときに luvit 型を読み込む
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    -- メインの LSP 設定
    'neovim/nvim-lspconfig',
    dependencies = {
      -- LSP と関連ツールを Neovim の stdpath に自動的にインストールする
      -- Mason は依存関係の前に読み込む必要があるため、ここで設定する必要があります。
      -- 注意: `opts = {}` は `require('mason').setup({})` を呼び出すのと同じです
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- LSP の便利なステータス更新。
      { 'j-hui/fidget.nvim', opts = {} },

      -- blink.cmp によって提供される追加機能を許可する
      'saghen/blink.cmp',
    },
    config = function()
      -- 少し余談: **LSP とは？**
      --
      -- LSP はおそらく聞いたことがある略語ですが、何なのか理解していないかもしれません。
      --
      -- LSP は Language Server Protocol の略です。これは、エディタと言語ツールが
      -- 標準化された方法で通信するのを助けるプロトコルです。
      --
      -- 一般的に、特定の言語（`gopls`、`lua_ls`、`rust_analyzer` など）を理解するために
      -- 構築されたツールである「サーバー」があります。これらの言語サーバー
      -- （LSP サーバーと呼ばれることもありますが、それは「ATM マシン」と言うようなものです）は、
      -- 何らかの「クライアント」（この場合は Neovim！）と通信するスタンドアロンプロセスです。
      --
      -- LSP は Neovim に次のような機能を提供します:
      --  - 定義へ移動
      --  - 参照の検索
      --  - 自動補完
      --  - シンボル検索
      --  - などなど！
      --
      -- したがって、言語サーバーは Neovim とは別にインストールする必要がある外部ツールです。
      -- ここで `mason` と関連プラグインが登場します。
      --
      -- lsp と treesitter の違いについて疑問に思っている場合は、
      -- 素晴らしくエレガントに構成されたヘルプセクション `:help lsp-vs-treesitter` を確認できます。

      --  この関数は、LSP が特定のバッファにアタッチされたときに実行されます。
      --    つまり、lsp に関連付けられた新しいファイルが開かれるたびに
      --    （たとえば、`main.rs` を開くと `rust_analyzer` に関連付けられます）、
      --    この関数が実行され、現在のバッファが設定されます。
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- 注意: Lua は本物のプログラミング言語であり、そのため
          -- 小さなヘルパー関数やユーティリティ関数を定義して、繰り返しを避けることができます。
          --
          -- この場合、LSP 関連アイテムに固有のマッピングをより簡単に定義できる関数を作成します。
          -- これは毎回モード、バッファ、説明を設定してくれます。
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- カーソル下の変数の名前を変更します。
          --  ほとんどの言語サーバーは、ファイル間での名前変更などをサポートしています。
          map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- コードアクションを実行します。通常、これを有効にするには、
          -- カーソルがエラーまたは LSP からの提案の上にある必要があります。
          map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

          -- カーソル下の単語の参照を検索します。
          map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- カーソル下の単語の実装にジャンプします。
          --  実際の装なしで型を宣言する方法がある言語で便利です。
          map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- カーソル下の単語の定義にジャンプします。
          --  これは、変数が最初に宣言された場所、または関数が定義された場所などです。
          --  戻るには <C-t> を押します。
          map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- 警告: これは定義へ移動ではなく、宣言へ移動です。
          --  たとえば、C 言語ではヘッダーに移動します。
          map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- 現在のドキュメント内のすべてのシンボルをファジー検索します。
          --  シンボルとは、変数、関数、型などのことです。
          map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')

          -- 現在のワークスペース内のすべてのシンボルをファジー検索します。
          --  ドキュメントシンボルと似ていますが、プロジェクト全体を検索します。
          map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')

          -- カーソル下の単語の型にジャンプします。
          --  変数の型がわからず、定義された場所ではなく
          --  その *型* の定義を見たい場合に便利です。
          map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

          -- この関数は、neovim nightly (バージョン 0.11) と stable (バージョン 0.10) の違いを解決します
          ---@param client vim.lsp.Client
          ---@param method vim.lsp.protocol.Method
          ---@param bufnr? integer some lsp support methods only in specific files
          ---@return boolean
          local function client_supports_method(client, method, bufnr)
            if vim.fn.has 'nvim-0.11' == 1 then
              return client:supports_method(method, bufnr)
            else
              return client.supports_method(method, { bufnr = bufnr })
            end
          end

          -- 以下の2つの自動コマンドは、カーソルがしばらくそこにあるときに
          -- カーソル下の単語の参照をハイライトするために使用されます。
          --    これがいつ実行されるかについては `:help CursorHold` を参照してください
          --
          -- カーソルを移動すると、ハイライトは消去されます（2番目の自動コマンド）。
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          -- 以下のコードは、使用している言語サーバーがサポートしている場合、
          -- コード内のインレイヒントを切り替えるキーマップを作成します。
          --
          -- コードの一部がずれるため、これは望ましくない場合があります。
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      -- 診断設定
      -- :help vim.diagnostic.Opts を参照
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = {
          source = 'if_many',
          spacing = 2,
          format = function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end,
        },
      }

      -- LSP サーバーとクライアントは、サポートする機能を互いに通信できます。
      --  デフォルトでは、Neovim は LSP 仕様にあるすべてをサポートしているわけではありません。
      --  blink.cmp や luasnip などを追加すると、Neovim は *より多くの* 機能を持つようになります。
      --  そこで、blink.cmp で新しい機能を作成し、それをサーバーにブロードキャストします。
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- 以下の言語サーバーを有効にする
      --  ここで必要な LSP を自由に追加/削除してください。それらは自動的にインストールされます。
      --
      --  以下のテーブルに追加の上書き設定を追加してください。利用可能なキーは次のとおりです:
      --  - cmd (table): サーバーの起動に使用されるデフォルトコマンドを上書き
      --  - filetypes (table): サーバーに関連付けられたファイルタイプのデフォルトリストを上書き
      --  - capabilities (table): capabilities のフィールドを上書き。特定の LSP 機能を無効にするために使用できます。
      --  - settings (table): サーバーの初期化時に渡されるデフォルト設定を上書き。
      --        たとえば、`lua_ls` のオプションを確認するには、https://luals.github.io/wiki/settings/ を参照してください
      local servers = {
        -- clangd = {},
        -- gopls = {},
        -- pyright = {},
        -- rust_analyzer = {},
        -- ... など。事前に設定されたすべての LSP のリストについては `:help lspconfig-all` を参照してください
        --
        -- 一部の言語（typescript など）には、便利な言語プラグイン全体があります:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- しかし、多くのセットアップでは、LSP (`ts_ls`) で十分機能します
        -- ts_ls = {},
        --

        lua_ls = {
          -- cmd = { ... },
          -- filetypes = { ... },
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              -- 以下を切り替えて、Lua_LS のうるさい `missing-fields` 警告を無視できます
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      -- 上記のサーバーとツールがインストールされていることを確認する
      --
      -- インストールされているツールの現在のステータスを確認したり、
      -- 他のツールを手動でインストールしたりするには、以下を実行します
      --    :Mason
      --
      -- このメニューで `g?` を押すとヘルプが表示されます。
      --
      -- `mason` はもっと早く設定する必要がありました: オプションを設定するには
      -- 上記の `nvim-lspconfig` の `dependencies` テーブルを参照してください。
      --
      -- Mason にインストールさせたい他のツールをここに追加して、
      -- Neovim 内から利用できるようにすることができます。
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Lua コードのフォーマットに使用
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        ensure_installed = {}, -- 明示的に空のテーブルに設定（Kickstart は mason-tool-installer を介してインストールを行います）
        automatic_installation = false,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- これは、上記でサーバー設定によって明示的に渡された
            -- 値のみの上書きを処理します。LSP の特定の機能を無効にする場合
            -- （たとえば、ts_ls のフォーマットをオフにするなど）に便利です
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
}