--[[

=====================================================================
==================== 続きを見る前にこれを読んでください ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ マウスは   \     ========
========       /:::========|  |==hjkl==:::\  \ 不要です   \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

Kickstart とは？

  Kickstart.nvim はディストリビューションでは「ありません」。

  Kickstart.nvim は、あなた自身の設定の出発点となるものです。
    目標は、コードを最初から最後まで読み、設定が何をしているかを理解し、
    自分のニーズに合わせて変更できるようにすることです。

    それができたら、Neovim を自分だけのものにするために、探索や設定、
    いじくり回すことを始められます！ しばらくの間 Kickstart をそのまま使うのもよし、
    すぐにモジュール化して分解するのもよし。あなた次第です！

    もし Lua について何も知らない場合は、時間を取ってガイドを読むことをお勧めします。
    10〜15分で読める例として以下があります:
      - https://learnxinyminutes.com/docs/lua/

    Lua について少し理解したら、Neovim がどのように Lua を統合しているかのリファレンスとして
    `:help lua-guide` を使用できます。
    - :help lua-guide
    - (または HTML 版): https://neovim.io/doc/user/lua-guide.html

Kickstart ガイド:

  TODO: 最初にすべきことは、Neovim で `:Tutor` コマンドを実行することです。

    どういう意味かわからない場合は、以下のように入力してください:
      - <Esc キー>
      - :
      - Tutor
      - <Enter キー>

    (すでに Neovim の基本を知っている場合は、このステップをスキップできます。)

  それが完了したら、残りの kickstart init.lua を読み進めながら作業を続けてください。
  「読み進める」ことが重要です。

  次に、`:help` を実行して「読んで」ください。
    これにより、組み込みのヘルプドキュメントの読み方、ナビゲーション、
    検索に関する基本情報が表示されたヘルプウィンドウが開きます。

    何かに行き詰まったり混乱したりしたときは、まずここを見るべきです。
    これは私のお気に入りの Neovim 機能の一つです。

    最も重要なこととして、ヘルプドキュメントを検索するためのキーマップ "<space>sh" ([s]earch [h]elp)
    を提供しています。これは、何を探しているのか正確にわからない場合に非常に便利です。

  init.lua 全体にいくつかの `:help X` コメントを残しています。
    これらは、Kickstart で使用されている関連設定、プラグイン、
    または Neovim 機能に関する詳細情報を見つけるためのヒントです。

   注意: このような行を探してください

    ファイル全体にあります。これらは読者であるあなたのために、何が起きているかを理解するのを助けるためのものです。
    何をしているか理解したら自由に削除して構いませんが、Neovim 設定のいくつかの異なる構造に
    初めて遭遇したときのガイドとして役立つはずです。

Kickstart のインストール中にエラーが発生した場合は、`:checkhealth` を実行して詳細を確認してください。

あなたの Neovim の旅が楽しいものになりますように、
- TJ

追伸: 完了したらこれも削除して構いません。これはもうあなたの設定ですから！ :)
--]]

-- <space> をリーダーキーに設定
-- `:help mapleader` を参照
--  注意: プラグインが読み込まれる前に設定する必要があります（そうしないと間違ったリーダーが使用されます）
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Nerd Font をインストールし、ターミナルで選択している場合は true に設定してください
vim.g.have_nerd_font = false

-- [[ オプションの設定 ]]
-- `:help vim.o` を参照
-- 注意: これらのオプションは自由に変更できます！
--  その他のオプションについては、`:help option-list` を参照してください

-- 行番号をデフォルトで表示
vim.o.number = true
-- ジャンプを助けるために相対行番号を追加することもできます。
--  気に入るかどうか自分で試してみてください！
-- vim.o.relativenumber = true

-- マウスモードを有効にする。分割のサイズ変更などに便利です！
vim.o.mouse = 'a'

-- モードを表示しない（ステータスラインにすでに表示されているため）
vim.o.showmode = false

-- OS と Neovim のクリップボードを同期します。
--  起動時間が長くなる可能性があるため、`UiEnter` の後に設定をスケジュールします。
--  OS のクリップボードを独立させたい場合は、このオプションを削除してください。
--  `:help 'clipboard'` を参照
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- ブレイクインデントを有効にする
vim.o.breakindent = true

-- アンドゥ履歴を保存する
vim.o.undofile = true

-- 検索語に \C や大文字が含まれていない限り、大文字と小文字を区別せずに検索します
vim.o.ignorecase = true
vim.o.smartcase = true

-- サインカラムをデフォルトでオンにする
vim.o.signcolumn = 'yes'

-- 更新時間を短縮
vim.o.updatetime = 250

-- マッピングされたシーケンスの待機時間を短縮
vim.o.timeoutlen = 300

-- 新しい分割ウィンドウの開き方を設定
vim.o.splitright = true
vim.o.splitbelow = true

-- Neovim がエディタ内で特定の空白文字をどのように表示するかを設定します。
--  `:help 'list'`
--  および `:help 'listchars'` を参照
--
--  listchars は vim.o ではなく vim.opt を使用して設定されていることに注意してください。
--  vim.o と非常によく似ていますが、テーブルを便利に操作するためのインターフェースを提供します。
--   `:help lua-options`
--   および `:help lua-options-guide` を参照
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- 入力中に置換をライブプレビュー！
vim.o.inccommand = 'split'

-- カーソルがある行を表示
vim.o.cursorline = true

-- カーソルの上下に保持する最小スクリーン行数。
vim.o.scrolloff = 10

-- バッファ内の未保存の変更が原因で失敗する操作（`:q` など）を実行した場合、
-- 代わりに現在のファイルを保存するかどうかを尋ねるダイアログを表示します
-- `:help 'confirm'` を参照
vim.o.confirm = true

-- [[ 基本的なキーマップ ]]
--  `:help vim.keymap.set()` を参照

-- ノーマルモードで <Esc> を押したときに検索のハイライトを消去する
--  `:help hlsearch` を参照
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- 診断（Diagnostic）のキーマップ
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- 組み込みターミナルのターミナルモードを、もう少し発見しやすいショートカットで終了します。
-- 通常は <C-\><C-n> を押す必要がありますが、これは
-- 少し経験がないと推測できないものです。
--
-- 注意: これはすべてのターミナルエミュレータ/tmux/etc で動作するわけではありません。独自のマッピングを試すか、
-- 単に <C-\><C-n> を使用してターミナルモードを終了してください
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- ヒント: ノーマルモードで矢印キーを無効にする
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- 分割ウィンドウのナビゲーションを簡単にするキーバインド。
--  CTRL+<hjkl> を使用してウィンドウを切り替えます
--
--  すべてのウィンドウコマンドのリストについては `:help wincmd` を参照してください
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- 注意: 一部のターミナルではキーマップが衝突したり、異なるキーコードを送信できなかったりします
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ 基本的な自動コマンド ]]
--  `:help lua-guide-autocommands` を参照

-- テキストをヤンク（コピー）したときにハイライトする
--  ノーマルモードで `yap` を試してみてください
--  `:help vim.hl.on_yank()` を参照
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- [[ `lazy.nvim` プラグインマネージャーのインストール ]]
--    詳細については `:help lazy.nvim.txt` または https://github.com/folke/lazy.nvim を参照してください
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ プラグインの設定とインストール ]]
--
--  プラグインの現在のステータスを確認するには、以下を実行します
--    :Lazy
--
--  このメニューで `?` を押すとヘルプが表示されます。ウィンドウを閉じるには `:q` を使用します
--
--  プラグインを更新するには、以下を実行します
--    :Lazy update
--
-- 注意: ここでプラグインをインストールします。
require('lazy').setup({
  -- 注意: プラグインはリンク（または GitHub リポジトリの場合: 'owner/repo' リンク）で追加できます。
  'NMAC427/guess-indent.nvim', -- tabstop と shiftwidth を自動的に検出

  -- 注意: プラグインはテーブルを使用して追加することもできます。
  -- 最初の引数をリンクとし、続くキーを使用して
  -- プラグインの動作/読み込み/などを設定できます。
  --
  -- `opts = {}` を使用すると、オプションが自動的にプラグインの `setup()` 関数に渡され、プラグインが強制的に読み込まれます。
  --

  -- あるいは、設定を完全に制御するには `config = function() ... end` を使用します。
  -- `setup` を明示的に呼び出したい場合は、次のようにします:
  --    {
  --        'lewis6991/gitsigns.nvim',
  --        config = function()
  --            require('gitsigns').setup({
  --                -- Your gitsigns configuration here
  --            })
  --        end,
  --    }
  --
  -- ここでは、設定オプションを `gitsigns.nvim` に渡す
  -- より高度な例を示します。
  --
  -- 設定キーの機能については `:help gitsigns` を参照してください
  { -- Git 関連のサインをガターに追加し、変更を管理するユーティリティも提供します
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- 注意: プラグインが読み込まれたときに Lua コードを実行するように設定することもできます。
  --
  -- これは、設定をグループ化したり、
  -- 起動時にすぐに読み込む必要のないプラグインの遅延読み込みを処理したりするのに非常に便利です。
  --
  -- たとえば、以下の設定では次を使用しています:
  --  event = 'VimEnter'
  --
  -- これにより、すべての UI 要素が読み込まれる前に which-key が読み込まれます。イベントは
  -- 通常の自動コマンドイベント (`:help autocmd-events`) を使用できます。
  --
  -- そして、`opts` キー（推奨）を使用しているため、プラグインが読み込まれた後に
  -- `require(MODULE).setup(opts)` として設定が実行されます。

  { -- 保留中のキーバインドを表示する便利なプラグイン。
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      -- キーを押してから which-key が開くまでの遅延（ミリ秒）
      -- この設定は vim.o.timeoutlen とは独立しています
      delay = 0,
      icons = {
        -- Nerd Font を持っている場合はアイコンマッピングを true に設定
        mappings = vim.g.have_nerd_font,
        -- Nerd Font を使用している場合: icons.keys を空のテーブルに設定すると、
        -- デフォルトの which-key.nvim 定義の Nerd Font アイコンが使用されます。それ以外の場合は文字列テーブルを定義します
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      -- 既存のキーチェーンをドキュメント化
      spec = {
        { '<leader>s', group = '[S]earch' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
  },

  -- 注意: プラグインは依存関係を指定できます。
  --
  -- 依存関係も適切なプラグイン仕様です。
  -- トップレベルのプラグインに対して行うことはすべて、依存関係に対しても行うことができます。
  --
  -- 特定のプラグインの依存関係を指定するには `dependencies` キーを使用します

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

  -- LSP プラグイン
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

  { -- 自動フォーマット
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- 標準化されたコーディングスタイルを持たない言語に対して
        -- "format_on_save lsp_fallback" を無効にします。
        -- ここに追加の言語を追加したり、無効になっている言語を再度有効にしたりできます。
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform は複数のフォーマッタを順番に実行することもできます
        -- python = { "isort", "black" },
        --
        -- 'stop_after_first' を使用して、リストから最初に利用可能なフォーマッタを実行できます
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },

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

  { -- カラースキームは簡単に変更できます。
    -- 以下のカラースキームプラグインの名前を変更し、
    -- 設定内のコマンドをそのカラースキームの名前に変更してください。
    --
    -- すでにインストールされているカラースキームを確認するには、`:Telescope colorscheme` を使用できます。
    'folke/tokyonight.nvim',
    priority = 1000, -- 他のすべての開始プラグインの前にこれを読み込むようにしてください。
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = false }, -- コメントのイタリック体を無効にする
        },
      }

      -- ここでカラースキームを読み込みます。
      -- 他の多くのテーマと同様に、これにもさまざまなスタイルがあり、
      -- 'tokyonight-storm'、'tokyonight-moon'、'tokyonight-day' などを読み込むことができます。
      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },

  -- コメント内の todo、notes などをハイライト
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- さまざまな小さな独立したプラグイン/モジュールのコレクション
    'echasnovski/mini.nvim',
    config = function()
      -- より良い Around/Inside テキストオブジェクト
      --
      -- 例:
      --  - va)  - [)]括弧の [A]round（周囲）を [V]isually（視覚的に）選択
      --  - yinq - [N]ext（次の）[Q]uote（引用符）の [I]nside（内側）を [Y]ank（ヤンク）
      --  - ci'  - [']引用符の [I]nside（内側）を [C]hange（変更）
      require('mini.ai').setup { n_lines = 500 }

      -- 囲み（括弧、引用符など）の追加/削除/置換
      --
      -- - saiw) - [I]nner [W]ord（単語の内側）に [)]括弧の [S]urround（囲み）を [A]dd（追加）
      -- - sd'   - [']引用符の [S]urround（囲み）を [D]elete（削除）
      -- - sr)'  - [)] を ['] に [S]urround [R]eplace（囲み置換）
      require('mini.surround').setup()

      -- シンプルで簡単なステータスライン。
      --  気に入らない場合はこの設定呼び出しを削除して、
      --  他のステータスラインプラグインを試すことができます
      local statusline = require 'mini.statusline'
      -- Nerd Font を持っている場合は use_icons を true に設定
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- デフォルトの動作を上書きすることで、ステータスラインのセクションを設定できます。
      -- たとえば、ここではカーソル位置のセクションを
      -- LINE:COLUMN に設定しています
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... 他にもあります！
      --  https://github.com/echasnovski/mini.nvim をチェックしてください
    end,
  },
  { -- コードのハイライト、編集、ナビゲーション
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Treesitter の設定 ]] `:help nvim-treesitter` を参照
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      -- インストールされていない言語を自動インストール
      auto_install = true,
      highlight = {
        enable = true,
        -- 一部の言語（Ruby など）は、インデントルールに vim の正規表現ハイライトシステムに依存しています。
        --  奇妙なインデントの問題が発生している場合は、その言語を
        --  additional_vim_regex_highlighting のリストと、インデントの無効化言語リストに追加してください。
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    -- nvim-treesitter と対話するために使用できる追加の nvim-treesitter モジュールがあります。
    -- いくつか探索して、興味のあるものを確認してください:
    --
    --    - インクリメンタル選択: 含まれています。`:help nvim-treesitter-incremental-selection-mod` を参照
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },

  -- 以下のコメントは、init.lua をコピー＆ペーストしただけでなく、kickstart リポジトリをダウンロードした場合にのみ機能します。
  -- これらのファイルが必要な場合は、リポジトリにあるので、ダウンロードして
  -- 正しい場所に配置してください。

  -- 注意: Neovim の旅の次のステップ: Kickstart に追加のプラグインを追加/設定する
  --
  --  Kickstart リポジトリに含まれているプラグインの例をいくつか紹介します。
  --  以下の行のコメントを外して有効にしてください（nvim の再起動が必要です）。
  --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.autopairs',
  -- require 'kickstart.plugins.neo-tree',
  -- require 'kickstart.plugins.gitsigns', -- gitsigns 推奨のキーマップを追加

  -- 注意: 以下のインポートは、`lua/custom/plugins/*.lua` から独自のプラグイン、設定などを自動的に追加できます。
  --    これは設定をモジュール化する最も簡単な方法です。
  --
  --  以下の行のコメントを外し、`lua/custom/plugins/*.lua` にプラグインを追加して始めてください。
  -- { import = 'custom.plugins' },
  --
  -- 読み込み、ソース、例に関する追加情報については、`:help lazy.nvim-🔌-plugin-spec` を参照してください
  -- または Telescope を使用してください！
  -- ノーマルモードで `<space>sh` と入力し、`lazy.nvim-plugin` と書いてください
  -- `<space>sr` で同じウィンドウを継続でき、最後の telescope 検索を再開します
}, {
  ui = {
    -- Nerd Font を使用している場合: icons を空のテーブルに設定すると、
    -- デフォルトの lazy.nvim 定義の Nerd Font アイコンが使用されます。それ以外の場合は Unicode アイコンテーブルを定義します
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- この下の行は `modeline` と呼ばれます。`:help modeline` を参照してください
-- vim: ts=2 sts=2 sw=2 et
