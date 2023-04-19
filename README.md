# TODO App<!-- omit in toc -->

## Categories<!-- omit in toc -->

- [概要](#概要)
- [使用技術とバージョン](#使用技術とバージョン)
- [セットアップ手順](#セットアップ手順)
- [工夫ポイント](#工夫ポイント)
  - [1. Rails7 の新機能を利用した開発](#1-rails7-の新機能を利用した開発)
  - [2. ViewComponet と Hotwire を組み合わせたコンポーネント指向なフロントエンド開発](#2-viewcomponet-と-hotwire-を組み合わせたコンポーネント指向なフロントエンド開発)
  - [3. Tailwind CSS の導入](#3-tailwind-css-の導入)
  - [4. Docker, Docker Compose によるローカル開発環境の構築](#4-docker-docker-compose-によるローカル開発環境の構築)
  - [5. ドキュメントの整備](#5-ドキュメントの整備)
  - [6. ServiceResponse クラスの導入](#6-serviceresponse-クラスの導入)
  - [7. Decorator クラスの導入](#7-decorator-クラスの導入)
  - [8. Finder クラスの導入](#8-finder-クラスの導入)
  - [9. Service クラスの導入](#9-service-クラスの導入)

---

## 概要

TODO App に関するドキュメントを記述.

---

## 使用技術とバージョン

- 言語
  - Ruby 3.2.2
  - JavaScript
- フレームワーク
  - Rails 7.0.4
- その他
  - Tailwind CSS
  - RSpec
  - Hotwire(stimulus)
  - ViewComponent(view_component gem)
  - Decorator(draper gem)
  - Docker
  - Docker Compose
  - MySQL

---

## セットアップ手順

セットアップ手順は[ここ]('../../doc/install/index.md)から確認することができます.

---

## 工夫ポイント

### 1. Rails7 の新機能を利用した開発

- Rails7 での開発方法を学びながら実装することを目標とした.

### 2. ViewComponet と Hotwire を組み合わせたコンポーネント指向なフロントエンド開発

- Hotwire では、DOM 要素の id や class に依存しない方法で、DOM 要素を初期化したりイベントリスナーを登録できるようになった.
- 下記のようなディレクトリ構造にすることで、HTML ファイルと JavaScript ファイルの対応関係や、データフローを理解しやすいアーキテクチャに改善した.

  - ディレクトリ構造

    ```shell
    todo-app/
      └─ components
          ├─ layouts
          │   ├─ header_component.html.erb
          │   ├─ header_component.rb
          │   ├─ header_controller.js
          │   ├─ breadcrumb_component.html.erb
          │   ├─ breadcrumb_component.rb
          │   └─ breadcrumb_controller.js
          ├─ tasks
          │   └─ index
          │       ├─ task_list_card_component.html.erb
          │       ├─ task_list_card_component.rb
          │       ├─ task_list_card_controller.js
          │       ├─ create_task_modal_component.html.erb
          │       ├─ create_task_modal_component.rb
          │       └─ create_task_modal_controller.js
          └─ index.js
    ```

  - データフロー

    ```mermaid
    graph
      A["/controllers/tasks_controller.rb #index"]
      B["/views/tasks/index.html.erb"]
      C["/components/index/task_list_card_component.rb"]
      D["/components/index/task_list_card_component.html.erb"]
      E["/components/index/task_list_card_controller.js"]

      A --> B --> C --> D --> E
    ```

### 3. Tailwind CSS の導入

- HTML 要素に直接スタイリングできるため、ViewComponent との相性が良いと考えて採用.
- タブ切り替えなどの一般的な UI 表現については、「preline」と呼ばれる Tailwind CSS フレームワークを導入して対応.

### 4. Docker, Docker Compose によるローカル開発環境の構築

- 開発メンバーが増えたときにもスケールするような開発環境を構築した.

### 5. ドキュメントの整備

- セットアップ手順書や初期データ投入手順など、機能開発に必要な手順をドキュメント化した.

### 6. ServiceResponse クラスの導入

- GitLab で採用されている ServiceResponse クラスを導入し、煩雑になりがちが Service 層の戻り値にルールを定義した.

### 7. Decorator クラスの導入

- モデルの振る舞いとして実装するのが正解だが、フロントエンドでしか利用しない振る舞いを記述するクラスとして採用した.

### 8. Finder クラスの導入

- 検索ロジックをまとめるクラスとして導入.
- 検索フォームに名前付けを行い、strong_parameter と finder クラスに関連させることで、コードの保守性を高めるのが狙い.

### 9. Service クラスの導入

- モデルに対する CRUD 操作を Service クラスとして実装した.
- モデルを更新する前の事前処理がある場合に、ActiveRecord のコールバックで実装してしまうとコールバック地獄になる保守性が低下していまう.
- UpdateService クラスとして実装し、クラス内で事前処理を行うことで保守性を向上させるのが狙い.
- そのほか、モデルの振る舞いとして不適切なビジネスロジックなどを、Service クラスとして実装する予定.
