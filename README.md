# TODO App<!-- omit in toc -->

## Categories<!-- omit in toc -->

- [概要](#概要)
- [使用技術とバージョン](#使用技術とバージョン)
- [セットアップ手順](#セットアップ手順)
- [関連コマンド](#関連コマンド)
- [工夫ポイント](#工夫ポイント)
  - [1. Rails7の新機能を利用した開発](#1-rails7の新機能を利用した開発)
  - [2. ViewComponetとHotwireを組み合わせたコンポーネント指向なフロントエンド開発](#2-viewcomponetとhotwireを組み合わせたコンポーネント指向なフロントエンド開発)
  - [3. Tailwind CSSの導入](#3-tailwind-cssの導入)
  - [4. Docker, Docker Composeによるローカル開発環境の構築](#4-docker-docker-composeによるローカル開発環境の構築)
  - [5. ドキュメントの整備](#5-ドキュメントの整備)
  - [6. Decoratorクラスの導入](#6-decoratorクラスの導入)
  - [7. Finderクラスの導入](#7-finderクラスの導入)
  - [8. Serviceクラスの導入](#8-serviceクラスの導入)
  - [9. ServiceResponseクラスの導入](#9-serviceresponseクラスの導入)

---

## 概要

TODO Appに関するドキュメントを記述.

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
  - Docker
  - Docker Compose
  - MySQL

---

## セットアップ手順

セットアップ手順は[ここ]('../../doc/install/index.md)から確認することができます.

---

## 関連コマンド

- [Hotwire, ViewComponent]('../../doc/hotwire/index.md)

---

## 工夫ポイント

### 1. Rails7の新機能を利用した開発

- Rails7のプロジェクトとしてそのまま利用できることを目標とした.
- また、Rails7系は経験がないため、学習しながら実装を行なった.
- バンドラを利用した環境構築(JavaScript Bundling, CSS Bundling)や、HotwireとViewComponentを整合させられるアーキテクチャ構築に向けた試行錯誤で苦労した.

### 2. ViewComponetとHotwireを組み合わせたコンポーネント指向なフロントエンド開発

- Hotwireでは、DOM要素のidやclassに依存しない方法で、DOM要素を参照できるようになった.
- 下記のようなディレクトリ構造にすることで、HTMLファイルとJavaScriptファイルの対応関係や、データフローを理解しやすいアーキテクチャに改善した.

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

### 3. Tailwind CSSの導入

- HTML要素に直接スタイリングできるため、ViewComponentとの相性が良いと考えて採用.
- モーダルなどの一般的なUI表現については、preline(Tailwind CSSフレームワーク)を導入して対応.

### 4. Docker, Docker Composeによるローカル開発環境の構築

- 開発メンバーが増えたときにもスケールするような開発環境を構築した.

### 5. ドキュメントの整備

- セットアップ手順書や初期データ投入手順など、機能開発に必要な手順をドキュメント化した.

### 6. Decoratorクラスの導入

- モデルの振る舞いとして実装するのが正解だが、フロントエンドでしか利用しない振る舞いを記述するクラスとして採用した.

### 7. Finderクラスの導入

- 検索ロジックをまとめるクラスとして導入.
- 検索フォームに名前付けを行い、strong_parameterとfinderクラスに関連させることで、コードの保守性を高めるのが狙い.

### 8. Serviceクラスの導入

- モデルに対するCRUD操作をServiceクラスとして実装した.
- モデルを更新する前の事前処理がある場合に、ActiveRecordのコールバックで実装してしまうとコールバック地獄になり保守性が低下していまう.
- UpdateServiceクラスとして実装し、クラス内で事前処理を行うことで保守性を向上させるのが狙い.
- そのほか、モデルの振る舞いとして実装するには不適切なビジネスロジックなどを、Serviceクラスとして実装する予定.

### 9. ServiceResponseクラスの導入

- GitLabで採用されているServiceResponseクラスを導入し、煩雑になりがちがService層の戻り値にルールを定義した.
