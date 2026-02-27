# kickstart.nvim

> この設定は [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)（[nvim-lua](https://github.com/nvim-lua) 作）をベースにした Neovim 設定です。  
> ライセンス: [MIT License](LICENSE.md)

## はじめに

この Neovim 設定は次のような出発点です：

* **小さい** - 必要最小限
* **単一ファイル** - `init.lua` を中心に構成
* **解説付き** - コメントで使い方を説明

Neovim の「ディストリビューション」ではなく、**あなた専用の設定のたたき台**として使えます。

## インストール

### Neovim のインストール

Kickstart.nvim が対象にしているのは、Neovim の最新
[安定版](https://github.com/neovim/neovim/releases/tag/stable) と最新
[ナイトリー](https://github.com/neovim/neovim/releases/tag/nightly) だけです。
不具合があるときは、どちらか最新版を使っているか確認してください。

### 外部依存関係のインストール

必要なもの：

- 基本ツール: `git`, `make`, `unzip`, C コンパイラ（`gcc`）
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)、
  [fd-find](https://github.com/sharkdp/fd#installation)
- クリップボード用ツール（xclip / xsel / win32yank など、OS に応じて）
- [Nerd Font](https://www.nerdfonts.com/)（任意・アイコン表示用）
  - 使う場合は `init.lua` で `vim.g.have_nerd_font` を `true` に
- 絵文字フォント（Ubuntu のみ、絵文字を使う場合）  
  `sudo apt install fonts-noto-color-emoji`
- 言語ごとの環境:
  - TypeScript を書くなら `npm`
  - Go を書くなら `go`
  - その他も同様

> [!NOTE]
> OS 別の詳細やコマンド例は [インストールレシピ](#インストールレシピ) を参照

### Kickstart のインストール

> [!NOTE]
> 既存の Neovim 設定がある場合は、先に [FAQ](#FAQ) を読んでバックアップを取ってください。

Neovim の設定フォルダは OS により次のパスです：

| OS | パス |
| :- | :--- |
| Linux, MacOS | `$XDG_CONFIG_HOME/nvim`、`~/.config/nvim` |
| Windows (cmd) | `%localappdata%\nvim\` |
| Windows (powershell) | `$env:LOCALAPPDATA\nvim\` |

#### 推奨手順

このリポジトリを [Fork](https://docs.github.com/ja/get-started/quickstart/fork-a-repo) して、
自分用に編集できるようにしてから、下のいずれかのコマンドでクローンします。

> [!NOTE]
> Fork 先の URL は次のような形になります：  
> `https://github.com/<あなたのGitHubユーザー名>/kickstart.nvim.git`

Fork したリポジトリでは、`.gitignore` から `lazy-lock.json` を外すことをおすすめします。
本家ではメンテの都合で無視していますが、
[版管理に含めることが推奨されています](https://lazy.folke.io/usage/lockfile)。

#### クローン

> [!NOTE]
> 上で Fork した場合、次のコマンドの `nvim-lua` は**あなたの GitHub ユーザー名**に置き換えてください。

<details><summary> Linux / Mac </summary>

```sh
git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

</details>

<details><summary> Windows </summary>

**cmd.exe** の場合：

```
git clone https://github.com/nvim-lua/kickstart.nvim.git "%localappdata%\nvim"
```

**powershell.exe** の場合：

```
git clone https://github.com/nvim-lua/kickstart.nvim.git "${env:LOCALAPPDATA}\nvim"
```

</details>

### Git コミット用の設定（任意）

Neovim 内で git commit を行うには [vim-fugitive](https://github.com/tpope/vim-fugitive) が使われています。
ターミナルから `git commit` を実行したときに Neovim を開くには、次を実行してください：

```sh
git config --global core.editor "nvim"
```

### インストール後

Neovim を起動します。

```sh
nvim
```

起動すると Lazy がプラグインを自動でインストールします。
`:Lazy` でプラグイン一覧を確認できます。終了は `q` です。

#### 設定の解説を読む

設定フォルダ内の `init.lua` には、Neovim の拡張のしかたや、
よく使うプラグインの追加例がコメントで書かれています。

> [!NOTE]
> 各プラグインのくわしい使い方は、それぞれのリポジトリのドキュメントを参照してください。

### 使い始め

[Neovim をはじめるための動画（英語）](https://youtu.be/m8C0Cq9Uv9o)

### FAQ

* **すでに Neovim の設定がある場合は？**
  * バックアップを取ったうえで、既存の設定と関連ファイルを削除してください。
  * `init.lua` や `~/.local` 以下の Neovim 用ファイル（`rm -rf ~/.local/share/nvim/` で削除可能）も含みます。
* **既存の設定と並べて使いたい**
  * [NVIM_APPNAME](https://neovim.io/doc/user/starting.html#%24NVIM_APPNAME)`=nvim-NAME` で複数設定を切り替えられます。
    例：`~/.config/nvim-kickstart` に Kickstart を入れ、エイリアスを張る：
    ```
    alias nvim-kickstart='NVIM_APPNAME="nvim-kickstart" nvim'
    ```
    `nvim-kickstart` と打つと、`~/.config/nvim-kickstart` と
    `~/.local/share/nvim-kickstart` が使われます。他のディストリビューションを試すときも同じ要領です。
* **「アンインストール」したい**
  * [lazy.nvim のアンインストール](https://lazy.folke.io/usage#-uninstalling) を参照してください。
* **なぜ `init.lua` が 1 ファイルなのか？分割した方がよくない？**
  * Kickstart の目的は「学びの材料」と「参照用の設定」であり、
    `git clone` してそのまま自分のベースにしやすい形にしています。
    Neovim と Lua に慣れてきたら、`init.lua` を分割してかまいません。
    同じ動きを保ったまま分割した例はこちら：
    * [kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim)
  * 議論のログ：
    * [Restructure the configuration](https://github.com/nvim-lua/kickstart.nvim/issues/218)
    * [Reorganize init.lua into a multi-file setup](https://github.com/nvim-lua/kickstart.nvim/pull/473)

### インストールレシピ

Neovim と依存関係の、OS 別のインストール手順です。

必要なものを入れたあと、[Kickstart のインストール](#kickstart-のインストール) の手順に戻ってください。

#### Windows

<details><summary>Microsoft C++ Build Tools と CMake を使う場合</summary>

`telescope-fzf-native` のビルドに、ビルドツールのインストールやコマンドの変更が必要になることがあります。

くわしくは [telescope-fzf-native のドキュメント](https://github.com/nvim-telescope/telescope-fzf-native.nvim#installation) を参照してください。

必要なもの：

- Windows 用の CMake と Microsoft C++ Build Tools

```lua
{'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
```
</details>

<details><summary>Chocolatey で gcc/make を入れる場合</summary>

設定を変えずに済む gcc と make を入れたい場合は、Chocolatey が手軽です。

1. [Chocolatey](https://chocolatey.org/install) をインストール
   - 公式の手順どおりか、**管理者の** cmd で winget を使う：
   ```
   winget install --accept-source-agreements chocolatey.chocolatey
   ```

2. 依存関係をまとめて入れる（一度 cmd を閉じて開き直してから、**管理者の** cmd で）：
   ```
   choco install -y neovim git ripgrep wget fd unzip gzip mingw make
   ```
</details>

<details><summary>WSL (Windows Subsystem for Linux)</summary>

```
wsl --install
wsl
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim
```
</details>

#### Linux

<details><summary>Ubuntu</summary>

```
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim
```
</details>

<details><summary>Debian</summary>

```
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip curl

# Neovim のインストール
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo mkdir -p /opt/nvim-linux-x86_64
sudo chmod a+rX /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# /usr/local/bin から使えるようにする（ディストロ版は /usr/bin）
sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/
```
</details>

<details><summary>Fedora</summary>

```
sudo dnf install -y gcc make git ripgrep fd-find unzip neovim
```
</details>

<details><summary>Arch Linux</summary>

```
sudo pacman -S --noconfirm --needed gcc make git ripgrep fd unzip neovim
```
</details>
