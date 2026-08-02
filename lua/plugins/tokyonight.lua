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

      -- [[ Wezterm と同じ背景を適用 ]]
      -- 背景色 #000000 で Wezterm と統一（Wezterm 内で nvim を起動したとき同じ見た目に）
      local function apply_wezterm_background()
        vim.api.nvim_set_hl(0, 'Normal', { bg = '#000000' })
        vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#000000' })
        vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#000000', fg = '#3b4261' })
      end

      vim.api.nvim_create_autocmd('ColorScheme', {
        group = vim.api.nvim_create_augroup('wezterm-background', { clear = true }),
        callback = apply_wezterm_background,
      })
      apply_wezterm_background()
    end,
  },
}