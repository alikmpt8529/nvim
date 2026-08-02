return {
  -- Markdown ファイルを Neovim 内でリッチ表示（見出し・リスト・コードブロックなどを装飾）
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown' },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
    opts = {
      heading = {
        -- 見出しレベルごとの派手な背景色(DiffText等)をオフにし、アイコンと文字色のみで区別する
        backgrounds = {},
      },
    },
  },
}
