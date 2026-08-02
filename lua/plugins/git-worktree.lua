return {
  { -- Git worktree の作成・切り替え・削除を Telescope から行えるようにする
    'polarmutex/git-worktree.nvim',
    version = '^2',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    init = function()
      ---@type GitWorktreeConfig
      vim.g.git_worktree = {
        change_directory_command = 'cd',
        update_on_change = true,
        update_on_change_command = 'e .', -- worktree切り替え後にカレントバッファを再読み込み
        clearjumps_on_change = true,
        confirm_telescope_deletions = true,
        autopush = false,
      }
    end,
    config = function()
      require('telescope').load_extension 'git_worktree'

      local Hooks = require 'git-worktree.hooks'
      Hooks.register(Hooks.type.SWITCH, function(path, prev_path)
        vim.notify('Worktree切り替え: ' .. prev_path .. ' -> ' .. path)
      end)
    end,
    keys = {
      {
        '<leader>gw',
        function()
          require('telescope').extensions.git_worktree.git_worktree()
        end,
        desc = '[G]it [W]orktree一覧',
      },
      {
        '<leader>gW',
        function()
          require('telescope').extensions.git_worktree.create_git_worktree()
        end,
        desc = '[G]it [W]orktree作成',
      },
    },
  },
}
