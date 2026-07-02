-- /Users/user/.config/nvim/lua/custom/plugins/gemini-cli.lua
-- This file adds a keymap to open the Gemini CLI in a terminal window.
-- It's structured as a lazy.nvim plugin spec to be automatically loaded.

return {
  -- This is not a real plugin, but a way to organize the keymap configuration
  -- so that lazy.nvim can load it automatically.
  {
    "gemini/cli-integration", -- A unique name for this custom configuration
    event = "VeryLazy",       -- Load this configuration after startup
    config = function()
      -- Define the keymap for Normal mode
      -- <leader>mi -> Gemini Chat
      vim.keymap.set("n", "<leader>mi", function()
        -- This command opens a new vertical split, creates a terminal inside it,
        -- and runs the 'gemini' command.
        -- The '++close' argument makes the window close automatically when the
        -- gemini CLI session ends.
        vim.cmd("vsplit | terminal ++close gemini")
      end, { desc = "Gemini: Open Chat in Terminal" })
    end,
  },
}
