---@diagnostic disable: undefined-global

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
