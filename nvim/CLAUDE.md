# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## プロジェクト概要

このリポジトリは、LazyVimをベースとしたNeovim設定です。lazy.nvimをプラグインマネージャーとして使用し、モジュール化された構成で管理されています。

## ディレクトリ構造

- `init.lua`: エントリーポイント（config.lazyを読み込む）
- `lua/config/`: 基本設定（autocmds、keymaps、lazy、options）
- `lua/plugins/`: プラグイン設定（カテゴリ別サブディレクトリで管理）
  - `ai/`: AI関連（copilot、copilot-chat、claude-code）
  - `coding/`: コーディング支援（blink-cmp、lspconfig、luasnip、mason）
  - `editor/`: エディタ機能（fzf-lua、toggleterm、treesitter-context、bqf、scrollbar）
  - `git/`: Git連携（gitlinker、gitsigns）
  - `ui/`: UI（bufferline、cursorline、lualine、noice）
- `lazy-lock.json`: プラグインバージョンのロックファイル
- `stylua.toml`: Luaコードのフォーマッター設定

## プラグイン管理

### 新しいプラグインの追加方法

1. `lua/plugins/`の適切なサブディレクトリに新しい`.lua`ファイルを作成
2. Luaテーブル形式でプラグイン設定を記述
3. Neovimを再起動すると自動的にインストールされる

**注意**: 新しいサブディレクトリを作成した場合、`lua/config/lazy.lua`に`{ import = "plugins.新カテゴリ" }`を追加する必要がある

### プラグインの更新

- `:Lazy update`でプラグインを更新
- `lazy-lock.json`は自動的に更新される
- 定期的にコミットすることで安定性を保つ

## 開発環境別の設定

### Ruby開発

- LSP: ruby_lsp（solargraphから移行済み）
- リンター: rubocop
- テスト実行: `<leader>tf`（ファイル全体）、`<leader>tn`（カーソル位置）

### TypeScript/JavaScript開発

- LSP: tsserver
- リンター: eslint
- フォーマッター: prettier

## 重要な設定

### フォーマッター

- Luaファイル: stylua（設定ファイルあり）
- 他の言語: conform.nvim経由で各種フォーマッター使用

### 主要なカスタマイズ

- ピッカー: fzf-lua使用（telescope非使用）
- カラースキーム: tokyonight（moonスタイル、透過背景）
- アニメーション: 無効化（パフォーマンス重視）
- VS Code検出時: スペルチェック自動無効化
- mise: shimsをPATHに追加（`options.lua`で設定）

## コードスタイル

- Luaファイル: stylua（spaces、indent: 2、column_width: 120）
- Rubyファイル: 保存時にLSPフォーマット自動実行（autocmds.lua）
- rubocop: bundler経由で実行（`bundle exec rubocop --lsp`）

## 設定変更時の注意点

1. `lua/plugins/`内のファイルは単一のLuaテーブルを返す必要がある
2. lazy-lock.jsonは手動で編集しない
3. プラグイン無効化は`enabled = false`を設定
4. キーマッピング変更は`lua/config/keymaps.lua`に集約
