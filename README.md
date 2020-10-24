# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| nickname  | string | null: false |
| email     | string | null: false |
| name      | string | null: false |
| kana_name | string | null: false |
| birthday  | string | null: false |


### Association

- has_many :products
- has_many :purchases

## products テーブル

| Column     | Type       | Options                        |
| ------     | ------     | -----------                    |
| image      | string     | null: false                    |
| name       | string     | null: false                    |
| content    | string     | null: false                    |
| category   | string     | null: false                    |
| status     | string     | null: false                    |
| ship_cost  | string     | null: false                    |
| from_area  | string     | null: false                    |
| day_to_get | string     | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

purchases テーブル

| Column      | Type       | Options                        |
| ------      | ---------- | ------------------------------ |
| number      | string     | null: false                    |
| valid_date  | string     | null: false                    |
| CSV         | string     | null: false                    |
| postal_code | string     | null: false                    |
| address     | string     | null: false                    |
| tel_number  | string     | null: false                    |
| user        | references | null: false, foreign_key: true |
| product     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product

