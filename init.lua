---@diagnostic disable: undefined-global, undefined-field
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

-- ; (セミコロン) をリーダーキーに設定
-- `:help mapleader` を参照
--  注意: プラグインが読み込まれる前に設定する必要があります（そうしないと間違ったリーダーが使用されます）
vim.g.mapleader = ';'
vim.g.maplocalleader = ';'

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

-- インデント（modeline の代わりにここで設定）
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

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

-- ウィンドウ分割のキーマップ
--  水平分割（上下に分割）
vim.keymap.set('n', '<leader>ws', '<C-w>s', { desc = '[W]indow [S]plit horizontally' })
--  垂直分割（左右に分割）
vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = '[W]indow [V]ertical split' })
--  現在のウィンドウを閉じる（分割を元に戻す）
vim.keymap.set('n', '<leader>wc', '<C-w>c', { desc = '[W]indow [C]lose (undo split)' })
--  現在のウィンドウを閉じる（別の方法）
vim.keymap.set('n', '<leader>wq', '<C-w>q', { desc = '[W]indow [Q]uit (close)' })
--  他のウィンドウをすべて閉じる（最大化）
vim.keymap.set('n', '<leader>wo', '<C-w>o', { desc = '[W]indow [O]nly (maximize)' })

-- タブページのキーマップ
--  新しいタブを開く
vim.keymap.set('n', '<leader>tn', '<cmd>tabnew<CR>', { desc = '[T]ab [N]ew' })
--  現在のタブを閉じる
vim.keymap.set('n', '<leader>tc', '<cmd>tabclose<CR>', { desc = '[T]ab [C]lose' })
--  他のタブをすべて閉じる
vim.keymap.set('n', '<leader>to', '<cmd>tabonly<CR>', { desc = '[T]ab [O]nly' })
--  次のタブに移動
vim.keymap.set('n', '<leader>t]', 'gt', { desc = '[T]ab next' })
--  前のタブに移動
vim.keymap.set('n', '<leader>t[', 'gT', { desc = '[T]ab previous' })

-- ターミナルのキーマップ
--  右側にターミナルを開く（垂直分割）
vim.keymap.set('n', '<leader>tt', '<cmd>vsplit | terminal<CR>', { desc = '[T]erminal (right split)' })
--  下側にターミナルを開く（水平分割）
vim.keymap.set('n', '<leader>tT', '<cmd>split | terminal<CR>', { desc = '[T]erminal (bottom split)' })
--  右側にGemini CLIを開く
vim.keymap.set('n', '<leader>tg', '<cmd>vsplit | terminal gemini<CR>', { desc = '[T]erminal [G]emini CLI' })
--  右側にCursor CLIを開く
vim.keymap.set('n', '<leader>tu', '<cmd>vsplit | terminal cursor-agent<CR>', { desc = '[T]erminal c[U]rsor agent' })

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
require("lazy").setup("plugins") -- lua/plugins フォルダ内のファイルを自動で読み込む

-- [[ Wezterm と同じ背景を適用 ]]
-- 背景色 #000000 で Wezterm と統一（Wezterm 内で nvim を起動したとき同じ見た目に）
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("wezterm-background", { clear = true }),
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#000000", fg = "#3b4261" })
  end,
})
vim.defer_fn(function()
  vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#000000", fg = "#3b4261" })
end, 0)

-- インデント設定は上記の vim.o.tabstop / shiftwidth / softtabstop / expandtab で行っています
