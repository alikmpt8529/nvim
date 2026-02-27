return {
  {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'G', 'Gread', 'Gwrite', 'Gdiffsplit', 'Gvdiffsplit' },
    keys = {
      -- コミット関連
      { '<leader>gc', '<cmd>Git commit<CR>', desc = '[G]it [C]ommit' },
      { '<leader>gC', '<cmd>Git commit --amend<CR>', desc = '[G]it [C]ommit amend' },
      -- ステータス・差分
      { '<leader>gs', '<cmd>Git<CR>', desc = '[G]it [S]tatus' },
      { '<leader>gd', '<cmd>Gdiffsplit<CR>', desc = '[G]it [D]iff' },
      -- その他
      { '<leader>gp', '<cmd>Git push<CR>', desc = '[G]it [P]ush' },
      { '<leader>gP', '<cmd>Git pull<CR>', desc = '[G]it [P]ull' },
    },
  },
}
