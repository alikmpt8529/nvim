-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    {
      '\\',
      function()
        local neo_tree = require('neo-tree.command')
        neo_tree.execute({ toggle = true, dir = vim.loop.cwd() })
      end,
      desc = 'NeoTree toggle (file tree)',
    },
    {
      '<leader>e',
      function()
        local neo_tree = require('neo-tree.command')
        neo_tree.execute({ toggle = true, dir = vim.loop.cwd() })
      end,
      desc = '[E]xplorer (file tree)',
    },
    {
      '<leader>E',
      function()
        local neo_tree = require('neo-tree.command')
        neo_tree.execute({ focus = true })
      end,
      desc = '[E]xplorer focus',
    },
  },
  config = function()
    require('neo-tree').setup({
      filesystem = {
        window = {
          mappings = {
            ['\\'] = 'close_window',
            ['q'] = 'close_window',
          },
        },
      },
    })
  end,
}
