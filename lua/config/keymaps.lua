---@diagnostic disable: undefined-global

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
vim.keymap.set('n', '<leader>mi', '<cmd>vsplit | terminal gemini<CR>', { desc = '[G]emini CLI' })
--  右側にCursor Agentを開く
vim.keymap.set('n', '<leader>cu', '<cmd>vsplit | terminal agent<CR>', { desc = '[C]ursor Agent' })
--  右側にClaude Codeを開く
vim.keymap.set('n', '<leader>cc', '<cmd>vsplit | terminal claude<CR>', { desc = '[C]laude [C]ode' })

-- 注意: 一部のターミナルではキーマップが衝突したり、異なるキーコードを送信できなかったりします
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
