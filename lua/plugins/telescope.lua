return {
  { -- ファジーファインダー (ファイル、LSP など)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- エラーが発生した場合は、インストール手順について telescope-fzf-native の README を参照してください
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` は、プラグインのインストール/更新時にコマンドを実行するために使用されます。
        -- これは Neovim が起動するたびではなく、その時だけ実行されます。
        build = 'make',

        -- `cond` は、このプラグインをインストールして読み込むかどうかを
        -- 決定するために使用される条件です。
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- きれいなアイコンを表示するのに便利ですが、Nerd Font が必要です。
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope は、ファジー検索できる多くの機能を備えたファジーファインダーです！
      -- 単なる「ファイル検索」ではなく、Neovim、ワークスペース、LSP などの
      -- さまざまな側面を検索できます！
      --
      -- Telescope を使う最も簡単な方法は、次のようなことから始めることです:
      --  :Telescope help_tags
      --
      -- このコマンドを実行するとウィンドウが開き、
      -- プロンプトウィンドウに入力できるようになります。`help_tags` オプションのリストと
      -- 対応するヘルプのプレビューが表示されます。
      --
      -- Telescope 中に使用する2つの重要なキーマップは次のとおりです:
      --  - インサートモード: <c-/>
      --  - ノーマルモード: ?
      --
      -- これにより、現在の Telescope ピッカーのすべてのキーマップを表示するウィンドウが開きます。
      -- これは、Telescope で何ができるか、そして実際にどうやるかを発見するのに
      -- 本当に役立ちます！

      -- [[ Telescope の設定 ]]
      -- `:help telescope` および `:help telescope.setup()` を参照
      require('telescope').setup {
        -- ここにデフォルトのマッピング / 更新 / などを配置できます
        --  探しているすべての情報は `:help telescope.setup()` にあります
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- インストールされている場合、Telescope 拡張機能を有効にする
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- `:help telescope.builtin` を参照
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      -- デフォルトの動作とテーマを上書きする少し高度な例
      vim.keymap.set('n', '<leader>/', function()
        -- テーマ、レイアウトなどを変更するために、追加の設定を Telescope に渡すことができます。
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- 追加の設定オプションを渡すことも可能です。
      --  特定のキーに関する情報については `:help telescope.builtin.live_grep()` を参照してください
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Neovim 設定ファイルを検索するためのショートカット
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },
}