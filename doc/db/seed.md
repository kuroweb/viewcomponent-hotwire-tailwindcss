# db / seed

## 関連コマンド

- 全てのseedファイルのデータを投入
  - `bundle exec rails db:seed`
- 特定のseedファイルのデータを投入
  - `bundle exec rails db:seed:{seed_file_name}`

---

## 関連ファイル

rake taskなどを追加しているため、関連ファイルを記述しておく.

```shell
todo-app/
  ├─ ...
  └─ db/
      ├─ seeds.rb # 全てのseedを登録するときに使用するファイル
      ├─ seeds/   # ユースケースごとに分割したseedファイル
      │   └─ *.rb
      └─ lib/
          ├─ ...
          └─ tasks/
              ├─ ...
              └─ seed.rake # 特定のseedだけ登録できるrakeコマンドを追加.
```
