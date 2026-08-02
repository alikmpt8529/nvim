---@diagnostic disable: undefined-global

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
