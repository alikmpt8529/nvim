return {
  { -- さまざまな小さな独立したプラグイン/モジュールのコレクション
    'echasnovski/mini.nvim',
    config = function()
      -- より良い Around/Inside テキストオブジェクト
      --
      -- 例:
      --  - va)  - [)]括弧の [A]round（周囲）を [V]isually（視覚的に）選択
      --  - yinq - [N]ext（次の）[Q]uote（引用符）の [I]nside（内側）を [Y]ank（ヤンク）
      --  - ci'  - [']引用符の [I]nside（内側）を [C]hange（変更）
      require('mini.ai').setup { n_lines = 500 }

      -- 囲み（括弧、引用符など）の追加/削除/置換
      --
      -- - saiw) - [I]nner [W]ord（単語の内側）に [)]括弧の [S]urround（囲み）を [A]dd（追加）
      -- - sd'   - [']引用符の [S]urround（囲み）を [D]elete（削除）
      -- - sr)'  - [)] を ['] に [S]urround [R]eplace（囲み置換）
      require('mini.surround').setup()

      -- シンプルで簡単なステータスライン。
      --  気に入らない場合はこの設定呼び出しを削除して、
      --  他のステータスラインプラグインを試すことができます
      local statusline = require 'mini.statusline'
      -- Nerd Font を持っている場合は use_icons を true に設定
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- デフォルトの動作を上書きすることで、ステータスラインのセクションを設定できます。
      -- たとえば、ここではカーソル位置のセクションを
      -- LINE:COLUMN に設定しています
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... 他にもあります！
      --  https://github.com/echasnovski/mini.nvim をチェックしてください
    end,
  },
}