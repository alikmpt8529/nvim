return {
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
}