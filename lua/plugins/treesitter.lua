return {
  { -- コードのハイライト、編集、ナビゲーション
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Treesitter の設定 ]] `:help nvim-treesitter` を参照
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      -- インストールされていない言語を自動インストール
      auto_install = true,
      highlight = {
        enable = true,
        -- 一部の言語（Ruby など）は、インデントルールに vim の正規表現ハイライトシステムに依存しています。
        --  奇妙なインデントの問題が発生している場合は、その言語を
        --  additional_vim_regex_highlighting のリストと、インデントの無効化言語リストに追加してください。
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    -- nvim-treesitter と対話するために使用できる追加の nvim-treesitter モジュールがあります。
    -- いくつか探索して、興味のあるものを確認してください:
    --
    --    - インクリメンタル選択: 含まれています。`:help nvim-treesitter-incremental-selection-mod` を参照
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },
}