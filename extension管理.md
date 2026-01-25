# Neovim 拡張パッケージ管理

このドキュメントには、現在インストールされているNeovimプラグインとその概要が記載されています。

## プラグインマネージャー

- **lazy.nvim** - プラグインマネージャー
  - プラグインの遅延読み込み、自動更新、依存関係管理を提供
  - 設定ファイル: `init.lua` (248行目)
  - プラグイン設定フォルダ: `lua/plugins/`

---

## インストール済みプラグイン

### 1. blink.cmp
- **リポジトリ**: `saghen/blink.cmp`
- **バージョン**: `1.*`
- **概要**: 高性能な自動補完エンジン。LSP、パス、スニペット、lazydevからの補完を提供
- **主な機能**:
  - LSPベースのインテリジェント補完
  - スニペット展開サポート
  - シグネチャヘルプ表示
  - ファジーマッチング（Lua実装）
- **依存関係**:
  - `L3MON4D3/LuaSnip` - スニペットエンジン
  - `folke/lazydev.nvim` - Neovim設定用のLSP補完
- **キーマップ**:
  - `<c-space>`: 補完メニューを開く/ドキュメントを表示
  - `<c-n>/<c-p>`: 次/前の項目を選択
  - `<c-y>`: 補完を受け入れる
  - `<c-e>`: メニューを隠す
  - `<c-k>`: シグネチャヘルプの切り替え

### 2. conform.nvim
- **リポジトリ**: `stevearc/conform.nvim`
- **概要**: コード自動フォーマットプラグイン
- **主な機能**:
  - 保存時の自動フォーマット
  - 複数のフォーマッタサポート
  - LSPフォーマットへのフォールバック
- **設定済みフォーマッタ**:
  - Lua: `stylua`
- **キーマップ**:
  - `<leader>f`: バッファをフォーマット
- **自動フォーマット**: 保存時に自動実行（C/C++を除く）

### 3. gitsigns.nvim
- **リポジトリ**: `lewis6991/gitsigns.nvim`
- **概要**: Git関連のサインをガターに表示し、変更を管理するユーティリティ
- **主な機能**:
  - 変更行の視覚的表示（追加、変更、削除）
  - Git操作の統合
- **表示サイン**:
  - `+`: 追加
  - `~`: 変更
  - `_`: 削除
  - `‾`: トップ削除

### 4. guess-indent.nvim
- **リポジトリ**: `NMAC427/guess-indent.nvim`
- **概要**: ファイルのtabstopとshiftwidthを自動的に検出
- **主な機能**:
  - ファイルを開いたときにインデント設定を自動検出
  - プロジェクトごとのインデント設定に対応

### 5. nvim-lspconfig (LSP設定)
- **リポジトリ**: `neovim/nvim-lspconfig`
- **概要**: Language Server Protocol (LSP) の設定と統合
- **主な機能**:
  - 定義へ移動 (`grd`)
  - 参照の検索 (`grr`)
  - 実装へ移動 (`gri`)
  - 名前変更 (`grn`)
  - コードアクション (`gra`)
  - シンボル検索 (`gO`, `gW`)
  - 型定義へ移動 (`grt`)
  - インレイヒント表示 (`<leader>th`)
- **設定済みLSPサーバー**:
  - `lua_ls` - Lua言語サーバー
- **依存関係**:
  - `mason-org/mason.nvim` - LSPサーバーとツールの自動インストール
  - `mason-org/mason-lspconfig.nvim` - MasonとLSPconfigの統合
  - `WhoIsSethDaniel/mason-tool-installer.nvim` - ツールの自動インストール
  - `j-hui/fidget.nvim` - LSPステータス更新表示
  - `folke/lazydev.nvim` - Neovim設定用LSP
  - `saghen/blink.cmp` - 補完機能統合
- **自動インストールツール**:
  - `stylua` - Luaフォーマッタ

### 6. mini.nvim
- **リポジトリ**: `echasnovski/mini.nvim`
- **概要**: 小さな独立したプラグイン/モジュールのコレクション
- **使用モジュール**:
  - **mini.ai**: より良いAround/Insideテキストオブジェクト
    - `va)`: 括弧の周囲を視覚的に選択
    - `yinq`: 次の引用符の内側をヤンク
    - `ci'`: 引用符の内側を変更
  - **mini.surround**: 囲み文字の追加/削除/置換
    - `saiw)`: 単語の内側に括弧を追加
    - `sd'`: 引用符の囲みを削除
    - `sr)'`: 括弧を引用符に置換
  - **mini.statusline**: シンプルなステータスライン
    - カーソル位置を `LINE:COLUMN` 形式で表示

### 7. telescope.nvim
- **リポジトリ**: `nvim-telescope/telescope.nvim`
- **概要**: ファジーファインダー（ファイル、LSP、ヘルプなど）
- **主な機能**:
  - ファイル検索
  - テキスト検索（grep）
  - LSP統合検索
  - ヘルプ検索
  - バッファ検索
- **依存関係**:
  - `nvim-lua/plenary.nvim` - 必須ライブラリ
  - `nvim-telescope/telescope-fzf-native.nvim` - 高速ファジー検索（makeが必要）
  - `nvim-telescope/telescope-ui-select.nvim` - UI選択統合
  - `nvim-tree/nvim-web-devicons` - アイコン表示（Nerd Fontが必要）
- **キーマップ**:
  - `<leader>sh`: ヘルプを検索
  - `<leader>sk`: キーマップを検索
  - `<leader>sf`: ファイルを検索
  - `<leader>ss`: Telescope選択メニュー
  - `<leader>sw`: 現在の単語を検索
  - `<leader>sg`: ライブgrep検索
  - `<leader>sd`: 診断を検索
  - `<leader>sr`: 前回の検索を再開
  - `<leader>s.`: 最近開いたファイル
  - `<leader><leader>`: 既存のバッファを検索
  - `<leader>/`: 現在のバッファ内をファジー検索
  - `<leader>s/`: 開いているファイル内をgrep検索
  - `<leader>sn`: Neovim設定ファイルを検索

### 8. todo-comments.nvim
- **リポジトリ**: `folke/todo-comments.nvim`
- **概要**: コメント内のTODO、NOTE、FIXMEなどをハイライト表示
- **主な機能**:
  - コメント内の特殊キーワードの検出とハイライト
  - プロジェクト全体のTODO検索
- **依存関係**:
  - `nvim-lua/plenary.nvim`

### 9. tokyonight.nvim
- **リポジトリ**: `folke/tokyonight.nvim`
- **概要**: カラースキーム
- **優先度**: 1000（最優先読み込み）
- **設定**:
  - スタイル: `tokyonight-night`
  - コメントのイタリック体を無効化
- **利用可能なスタイル**:
  - `tokyonight-night` (現在使用中)
  - `tokyonight-storm`
  - `tokyonight-moon`
  - `tokyonight-day`

### 10. nvim-treesitter
- **リポジトリ**: `nvim-treesitter/nvim-treesitter`
- **概要**: コードのハイライト、編集、ナビゲーション
- **主な機能**:
  - シンタックスハイライト
  - インデント管理
  - コード構造の理解
- **自動インストール言語**:
  - bash, c, diff, html, lua, luadoc, markdown, markdown_inline, query, vim, vimdoc
- **設定**:
  - 自動インストール: 有効
  - ハイライト: 有効
  - インデント: 有効（Rubyを除く）

### 11. which-key.nvim
- **リポジトリ**: `folke/which-key.nvim`
- **概要**: 保留中のキーバインドを表示する便利なプラグイン
- **主な機能**:
  - キー入力中に利用可能なキーマップを表示
  - キーバインドのドキュメント化
- **設定**:
  - 遅延: 0ms
  - ドキュメント化済みキーグループ:
    - `<leader>s`: [S]earch
    - `<leader>t`: [T]oggle
    - `<leader>h`: Git [H]unk

---

## プラグインの管理

### プラグインの状態確認
```vim
:Lazy
```

### プラグインの更新
```vim
:Lazy update
```

### プラグインのインストール
プラグインを追加する場合は、`lua/plugins/`フォルダ内に新しい`.lua`ファイルを作成し、以下の形式で記述します：

```lua
return {
  {
    'author/plugin-name',
    -- 設定オプション
  },
}
```

### プラグインの削除
`lua/plugins/`フォルダ内の該当する`.lua`ファイルを削除します。

---

## 補足情報

### LSPサーバーの管理
LSPサーバーはMasonを通じて自動インストールされます。手動で管理する場合は：

```vim
:Mason
```

### フォーマッタの追加
`lua/plugins/conform.lua`の`formatters_by_ft`テーブルに追加します。

### カラースキームの変更
`lua/plugins/tokyonight.lua`の`vim.cmd.colorscheme`行を変更するか、別のカラースキームプラグインに置き換えます。

---

最終更新: 2024年
