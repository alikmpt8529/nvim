# Neovim 拡張パッケージ管理

このドキュメントには、現在インストールされているNeovimプラグインとその概要が記載されています。

## プラグインマネージャー

- **lazy.nvim** - プラグインマネージャー
  - プラグインの遅延読み込み、自動更新、依存関係管理を提供
  - 設定ファイル: `init.lua` (248行目)
  - プラグイン設定フォルダ: `lua/plugins/`

---

## インストール済みプラグイン

> **注意**: 全てのプラグイン設定ファイルは `lua/plugins/` ディレクトリで管理されています。  
> `init.lua` の `require("lazy").setup("plugins")` により、このディレクトリ内の `.lua` ファイルが自動的に読み込まれます。

### 1. blink.cmp
- **リポジトリ**: `saghen/blink.cmp`
- **バージョン**: `1.*`
- **設定ファイル**: `lua/plugins/blink-cmp.lua`
- **概要**: 高性能な自動補完エンジン。LSP、パス、スニペット、lazydevからの補完を提供
- **主な機能**:
  - LSPベースのインテリジェント補完
  - スニペット展開サポート
  - シグネチャヘルプ表示
  - ファジーマッチング（Lua実装）
- **依存関係**:
  - `L3MON4D3/LuaSnip` - スニペットエンジン（バージョン 2.*）
  - `folke/lazydev.nvim` - Neovim設定用のLSP補完
- **キーマップ**:
  - `<c-space>`: 補完メニューを開く/ドキュメントを表示
  - `<c-n>/<c-p>`: 次/前の項目を選択
  - `<c-y>`: 補完を受け入れる
  - `<c-e>`: メニューを隠す
  - `<c-k>`: シグネチャヘルプの切り替え
- **設定詳細**:
  - プリセット: `default`
  - ソース: `lsp`, `path`, `snippets`, `lazydev`
  - ファジーマッチング: Lua実装を使用

### 2. conform.nvim
- **リポジトリ**: `stevearc/conform.nvim`
- **設定ファイル**: `lua/plugins/conform.lua`
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
- **設定詳細**:
  - タイムアウト: 500ms
  - エラー通知: 無効
  - 無効化ファイルタイプ: `c`, `cpp`

### 3. gitgraph.nvim
- **リポジトリ**: `isakbm/gitgraph.nvim`
- **設定ファイル**: `lua/plugins/gitgraph.lua`
- **概要**: Gitのコミットグラフをビジュアル表示
- **主な機能**:
  - ブランチの視覚的表示
  - マージコミットの識別
  - 時系列順の表示
  - Diffviewとの連携
- **依存関係**:
  - `sindrets/diffview.nvim` - 差分表示
- **キーマップ**:
  - `<leader>gl`: Git Graphを表示
- **グラフ内操作**:
  - `Enter`: 選択したコミットの差分をDiffviewで表示
  - ビジュアルモードで範囲選択: 選択範囲の差分を表示

### 4. vim-fugitive
- **リポジトリ**: `tpope/vim-fugitive`
- **設定ファイル**: `lua/plugins/fugitive.lua`
- **概要**: Neovim 内で Git 操作（コミット含む）を実行
- **主な機能**:
  - コミットメッセージの編集
  - Git ステータス表示
  - 差分表示（分割ウィンドウ）
  - push / pull
- **キーマップ**:
  - `<leader>gc`: コミット（メッセージ編集を開く）
  - `<leader>gC`: コミット amend
  - `<leader>gs`: Git ステータス
  - `<leader>gd`: 差分表示（分割）
  - `<leader>gp`: push
  - `<leader>gP`: pull
- **補足**: ターミナルから `git commit` 実行時に Neovim を開くには、`git config --global core.editor "nvim"` を実行してください。

### 5. gitsigns.nvim
- **リポジトリ**: `lewis6991/gitsigns.nvim`
- **設定ファイル**: `lua/plugins/gitsigns.lua`
- **概要**: Git関連のサインをガターに表示し、変更を管理するユーティリティ
- **主な機能**:
  - 変更行の視覚的表示（追加、変更、削除）
  - Git操作の統合
- **表示サイン**:
  - `+`: 追加
  - `~`: 変更
  - `_`: 削除
  - `‾`: トップ削除
  - `~`: 変更削除

### 6. guess-indent.nvim
- **リポジトリ**: `NMAC427/guess-indent.nvim`
- **設定ファイル**: `lua/plugins/guess-indent.lua`
- **概要**: ファイルのtabstopとshiftwidthを自動的に検出
- **主な機能**:
  - ファイルを開いたときにインデント設定を自動検出
  - プロジェクトごとのインデント設定に対応

### 7. nvim-lspconfig (LSP設定)
- **リポジトリ**: `neovim/nvim-lspconfig`
- **設定ファイル**: `lua/plugins/lsp.lua`
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

### 8. mini.nvim
- **リポジトリ**: `echasnovski/mini.nvim`
- **設定ファイル**: `lua/plugins/mini.lua`
- **概要**: 小さな独立したプラグイン/モジュールのコレクション
- **使用モジュール**:
  - **mini.ai**: より良いAround/Insideテキストオブジェクト
    - `va)`: 括弧の周囲を視覚的に選択
    - `yinq`: 次の引用符の内側をヤンク
    - `ci'`: 引用符の内側を変更
    - 設定: `n_lines = 500`
  - **mini.surround**: 囲み文字の追加/削除/置換
    - `saiw)`: 単語の内側に括弧を追加
    - `sd'`: 引用符の囲みを削除
    - `sr)'`: 括弧を引用符に置換
  - **mini.statusline**: シンプルなステータスライン
    - カーソル位置を `LINE:COLUMN` 形式で表示
    - Nerd Font使用時はアイコンを表示

### 9. neo-tree.nvim
- **リポジトリ**: `nvim-neo-tree/neo-tree.nvim`
- **設定ファイル**: `lua/plugins/neo-tree.lua`
- **概要**: ファイルシステムブラウザー（ファイルエクスプローラー）
- **主な機能**:
  - ファイルツリーの表示
  - ファイルの開閉・作成・削除
  - ディレクトリのナビゲーション
- **依存関係**:
  - `nvim-lua/plenary.nvim` - 必須ライブラリ
  - `nvim-tree/nvim-web-devicons` - アイコン表示（推奨）
  - `MunifTanjim/nui.nvim` - UIコンポーネント
- **キーマップ**:
  - `\`: ファイルツリーをトグル
  - `<leader>e`: ファイルツリーをトグル
  - `<leader>E`: ファイルツリーにフォーカス
  - `\` (ファイルツリー内): ウィンドウを閉じる
  - `q` (ファイルツリー内): ウィンドウを閉じる
- **設定詳細**:
  - 遅延読み込み: 無効（起動時に読み込み）
  - バージョン: `*` (最新版)

### 10. telescope.nvim
- **リポジトリ**: `nvim-telescope/telescope.nvim`
- **設定ファイル**: `lua/plugins/telescope.lua`
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

### 11. todo-comments.nvim
- **リポジトリ**: `folke/todo-comments.nvim`
- **設定ファイル**: `lua/plugins/todo-comments.lua`
- **概要**: コメント内のTODO、NOTE、FIXMEなどをハイライト表示
- **主な機能**:
  - コメント内の特殊キーワードの検出とハイライト
  - プロジェクト全体のTODO検索
- **依存関係**:
  - `nvim-lua/plenary.nvim`
- **設定詳細**:
  - イベント: `VimEnter`（起動時に読み込み）
  - サイン表示: 無効

### 12. tokyonight.nvim
- **リポジトリ**: `folke/tokyonight.nvim`
- **設定ファイル**: `lua/plugins/tokyonight.lua`
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

### 13. nvim-treesitter
- **リポジトリ**: `nvim-treesitter/nvim-treesitter`
- **設定ファイル**: `lua/plugins/treesitter.lua`
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

### 14. which-key.nvim
- **リポジトリ**: `folke/which-key.nvim`
- **設定ファイル**: `lua/plugins/which-key.lua`
- **概要**: 保留中のキーバインドを表示する便利なプラグイン
- **主な機能**:
  - キー入力中に利用可能なキーマップを表示
  - キーバインドのドキュメント化
- **設定**:
  - イベント: `VimEnter`（起動時に読み込み）
  - 遅延: 0ms
  - アイコン: Nerd Font使用時は有効
  - ドキュメント化済みキーグループ:
    - `<leader>s`: [S]earch
    - `<leader>t`: [T]ab
    - `<leader>h`: Git [H]unk
    - `<leader>g`: [G]it
    - `<leader>w`: [W]indow
    - `<leader>e`: [E]xplorer

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

## プラグイン設定ファイル一覧

`lua/plugins/` ディレクトリ内の全プラグイン設定ファイル：

1. `blink-cmp.lua` - 自動補完エンジン
2. `conform.lua` - コード自動フォーマット
3. `fugitive.lua` - Git操作（コミット含む）
4. `gitgraph.lua` - Gitコミットグラフ表示
5. `gitsigns.lua` - Gitサイン表示
6. `guess-indent.lua` - インデント自動検出
7. `lsp.lua` - LSP設定（lazydev.nvim と nvim-lspconfig を含む）
8. `mini.lua` - ミニプラグインコレクション（ai, surround, statusline）
9. `neo-tree.lua` - ファイルエクスプローラー
10. `telescope.lua` - ファジーファインダー
11. `todo-comments.lua` - TODOコメントハイライト
12. `tokyonight.lua` - カラースキーム
13. `treesitter.lua` - シンタックスハイライト
14. `which-key.lua` - キーバインド表示

---

最終更新: 2026年2月
