return {
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
        { '<leader>t', group = '[T]ab' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
        { '<leader>w', group = '[W]indow' },
        { '<leader>e', group = '[E]xplorer' },
      },
    },
  },
}