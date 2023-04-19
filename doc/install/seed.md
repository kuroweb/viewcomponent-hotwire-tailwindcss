# install / seed

## 概要

seedを用いた初期データの登録方法や規約について記述.

---

## seedの登録手順

### 全てのseedを登録する場合

seedコマンドを実行してください.

```shell
bundle exec rails db:seed
```

### 特定のseedファイルのみ登録する場合

スネークケースでファイル名を指定してseedコマンドを実行してください.

```shell
bundle exec rails db:seed:{seed_file_name}

# example
#  bundle exec rails db:seed:current_user
```

---

## 関連ファイル

rake taskなどを追加しているため、関連ファイルを記述しておく.

```shell
todo-app/
  ├─ ...
  └─ db/
      ├─ seeds.rb (全てのseedを登録するときに使用するファイル)
      ├─ seeds/   (ユースケースごとに分割したseedファイル. 分割ルールは暫定)
      │   └─ *.rb
      └─ lib/
          ├─ ...
          └─ tasks/
              ├─ ...
              └─ seed.rake (rakeコマンドを追加するファイル. 特定のseedだけ登録できるコマンドを追加している)
```
