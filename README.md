# ViewComponent + Hotwire + TailwindCSS<!-- omit in toc -->

Rails7, Hotwire, ViewComponent, TailwindCSS でのサンプルプロジェクト.

Hotwire + ViewComponent + TailwindCSS の組み合わせにより、`/components`でコンポーネント指向な実装を目指す.

---

## Categories<!-- omit in toc -->

- [Version](#version)
- [Install](#install)
  - [1. node\_modules フォルダを作成](#1-node_modules-フォルダを作成)
  - [2. env ファイルを作成](#2-env-ファイルを作成)
  - [3. Docker イメージを作成](#3-docker-イメージを作成)
  - [4. database を作成](#4-database-を作成)
  - [4. seed データを投入](#4-seed-データを投入)
  - [5. プロジェクトを起動](#5-プロジェクトを起動)
  - [6. seed ファイルに定義したアカウントでログイン](#6-seed-ファイルに定義したアカウントでログイン)
  - [7. 画面にアクセス](#7-画面にアクセス)
  - [8. 完了](#8-完了)
- [Command](#command)

---

## Version

- Ruby 3.2.2
- Rails 7.0.4
- Tailwind CSS

---

## Install

### 1. node_modules フォルダを作成

Docker Componse で node_modules ボリュームをバインドするために必要.

```shell
viewcomponent-hotwire-tailwindcss/
  ├─ app
  ├─ ...
  ├─ node_modules // このフォルダを作成
  └─ ...
```

### 2. env ファイルを作成

`.env`に記述したクレデンシャルは、`docker-compose.yml`経由でプロジェクト内に環境変数として登録される.(※本プロジェクトでは未使用)

```shell
todo-app/
  ├─ app
  ├─ ...
  ├─ .env // このファイルを作成
  └─ ...
```

### 3. Docker イメージを作成

```shell
docker compose build
```

### 4. database を作成

```shell
docker compose run web rails db:create && rails db:migrate
```

### 4. seed データを投入

```shell
docker compose run web rails db:seed
```

### 5. プロジェクトを起動

```shell
docker compose up
```

### 6. seed ファイルに定義したアカウントでログイン

| id                       | pass    |
| ------------------------ | ------- |
| current_user@example.com | example |
| other_user@example.com   | example |

### 7. 画面にアクセス

ブラウザから各画面にアクセスして表示されることを確認.

| 画面名         | URL                           |
| -------------- | ----------------------------- |
| タスク一覧画面 | http://localhost:3000/tasks   |
| ログイン画面   | http://localhost:3000/sign_in |

### 8. 完了

## Command

- view_component と stimulus コントローラをジェネレート
  - `rails generate component Hoge::Fuga --stimulus`
- stimulus コントローラを index.js に登録(rake コマンドで拡張したもの)
  - `rails view_component:stimulus_manifest:update`
