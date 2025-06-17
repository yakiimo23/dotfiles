# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## プロジェクト概要

このリポジトリは、LazyVimをベースとしたNeovim設定です。lazy.nvimをプラグインマネージャーとして使用し、モジュール化された構成で管理されています。

## ディレクトリ構造

- `init.lua`: エントリーポイント（config.lazyを読み込む）
- `lua/config/`: 基本設定（autocmds、keymaps、lazy、options）
- `lua/plugins/`: プラグイン設定（個別ファイルで管理）
- `lazy-lock.json`: プラグインバージョンのロックファイル
- `stylua.toml`: Luaコードのフォーマッター設定

## プラグイン管理

### 新しいプラグインの追加方法

1. `lua/plugins/`ディレクトリに新しい`.lua`ファイルを作成
2. Luaテーブル形式でプラグイン設定を記述（`example.lua`参照）
3. Neovimを再起動すると自動的にインストールされる

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
- カラースキーム: everforest
- アニメーション: 無効化（パフォーマンス重視）
- VS Code検出時: スペルチェック自動無効化

## 設定変更時の注意点

1. `lua/plugins/`内のファイルは単一のLuaテーブルを返す必要がある
2. lazy-lock.jsonは手動で編集しない
3. プラグイン無効化は`enabled = false`を設定
4. キーマッピング変更は`lua/config/keymaps.lua`に集約
