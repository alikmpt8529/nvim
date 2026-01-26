return {
  { -- 自動フォーマット
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- 標準化されたコーディングスタイルを持たない言語に対して
        -- "format_on_save lsp_fallback" を無効にします。
        -- ここに追加の言語を追加したり、無効になっている言語を再度有効にしたりできます。
        local disable_filetypes = { c = true, cpp = true }
        local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')
        if disable_filetypes[filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform は複数のフォーマッタを順番に実行することもできます
        -- python = { "isort", "black" },
        --
        -- 'stop_after_first' を使用して、リストから最初に利用可能なフォーマッタを実行できます
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },
}