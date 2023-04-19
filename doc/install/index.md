# install / index

## セットアップ手順

### 1. node_modulesフォルダを作成

Docker Componseでnode_modulesボリュームをバインドするために必要.

```shell
todo-app/
  ├─ app
  ├─ ...
  ├─ node_modules // <- このフォルダを作成
  └─ ...
```

### 2. envファイルを作成

`.env`に記述したクレデンシャルは、`docker-compose.yml`経由でプロジェクト内に環境変数として登録される.(※本プロジェクトでは未使用)

```shell
todo-app/
  ├─ app
  ├─ ...
  ├─ .env // <- このファイルを作成
  └─ ...
```

### 3. Dockerイメージを作成

```shell
docker compose build
```

### 4. databaseを作成

```shell
docker compose run web rails db:create && rails db:migrate
```

### 4. seedデータを投入

詳細は[ここ](seed.md)から確認できます.

```shell
docker compose run web rails db:seed
```

### 5. プロジェクトを起動

バックグラウンドでプロジェクトを起動する場合

```shell
docker compose up -d
```

フォアグラウンドでプロジェクトを起動する場合

```shell
docker compose up
```

webコンテナにアタッチする場合(例: binding.pryしたいとき)

```shell
docker compose up -d
docker attach $(docker-compose ps -q web)
```

### 6. 完了

ブラウザから各画面にアクセスして表示されることを確認.

| 画面名         | URL                           |
| -------------- | ----------------------------- |
| タスク一覧画面 | http://localhost:3000/tasks   |
| ログイン画面   | http://localhost:3000/sign_in |
