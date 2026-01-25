return {
  { -- 自動補完
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
      -- スニペットエンジン
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          -- スニペットでの正規表現サポートにはビルドステップが必要です。
          -- このステップは多くの Windows 環境ではサポートされていません。
          -- Windows で再度有効にするには、以下の条件を削除してください。
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` には、さまざまな既製スニペットが含まれています。
          --    個々の言語/フレームワーク/プラグインのスニペットについては README を参照してください:
          --    https://github.com/rafamadriz/friendly-snippets
          -- {
          --   'rafamadriz/friendly-snippets',
          --   config = function()
          --     require('luasnip.loaders.from_vscode').lazy_load()
          --   end,
          -- },
        },
        opts = {},
      },
      'folke/lazydev.nvim',
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      keymap = {
        -- 組み込みの補完と同様のマッピングには 'default' (推奨)
        --   <c-y> で補完を受け入れ ([y]es) ます。
        --    LSP がサポートしている場合、自動インポートされます。
        --    LSP がスニペットを送信した場合、スニペットが展開されます。
        -- タブで受け入れるには 'super-tab'
        -- エンターで受け入れるには 'enter'
        -- マッピングなしには 'none'
        --
        -- なぜ 'default' プリセットが推奨されるのかを理解するには、
        -- `:help ins-completion` を読む必要があります。
        --
        -- いや、本当に。`:help ins-completion` を読んでください、本当に良いですよ！
        --
        -- すべてのプリセットには以下のマッピングがあります:
        -- <tab>/<s-tab>: スニペット展開の右/左に移動
        -- <c-space>: メニューを開く、またはすでに開いている場合はドキュメントを開く
        -- <c-n>/<c-p> または <up>/<down>: 次/前の項目を選択
        -- <c-e>: メニューを隠す
        -- <c-k>: シグネチャヘルプの切り替え
        --
        -- 独自のキーマップを定義するには :h blink-cmp-config-keymap を参照
        preset = 'default',

        -- より高度な Luasnip キーマップ（選択ノードの選択、展開など）については、以下を参照してください:
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      },

      appearance = {
        -- 'Nerd Font Mono' の場合は 'mono' (デフォルト)、'Nerd Font' の場合は 'normal'
        -- アイコンが整列するように間隔を調整します
        nerd_font_variant = 'mono',
      },

      completion = {
        -- デフォルトでは、`<c-space>` を押してドキュメントを表示できます。
        -- オプションで、`auto_show = true` に設定すると、遅延後にドキュメントを表示できます。
        documentation = { auto_show = false, auto_show_delay_ms = 500 },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        },
      },

      snippets = { preset = 'luasnip' },

      -- Blink.cmp には、オプションの推奨 Rust ファジーマッチャーが含まれており、
      -- 有効にするとビルド済みのバイナリが自動的にダウンロードされます。
      --
      -- デフォルトでは代わりに Lua 実装を使用しますが、
      -- `'prefer_rust_with_warning'` を介して Rust 実装を有効にすることができます
      --
      -- 詳細については :h blink-cmp-config-fuzzy を参照してください
      fuzzy = { implementation = 'lua' },

      -- 関数の引数を入力中にシグネチャヘルプウィンドウを表示します
      signature = { enabled = true },
    },
  },
}