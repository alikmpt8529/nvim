-- /Users/user/.config/nvim/lua/custom/plugins/cursor-cli.lua
-- This file adds a keymap to open the cursor-cli in a terminal window.
-- It's structured as a lazy.nvim plugin spec to be automatically loaded.

return {
  -- This is not a real plugin, but a way to organize the keymap configuration
  -- so that lazy.nvim can load it automatically.
  {
    "cursor/cli-integration", -- A unique name for this custom configuration
    event = "VeryLazy",       -- Load this configuration after startup
    config = function()
      -- Define the keymap for Normal mode
      -- <leader>cu -> Cursor CLI
      vim.keymap.set("n", "<leader>cu", function()
        -- This command opens a new vertical split, creates a terminal inside it,
        -- and runs the 'cursor-cli' command.
        -- The '++close' argument makes the window close automatically when the
        -- cursor-cli session ends.
        vim.cmd("vsplit | terminal ++close agent")
      end, { desc = "Cursor: Open CLI in Terminal" })
    end,
  },
}
