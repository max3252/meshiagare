# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
#テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| prefecture_id    | integer| null: false |
| gender_id        | integer| null: false |
| age_id           | integer| null: false |
| allergies        | text   | null: false |


### Association

- has_many :posts
- has_many :comments

## posts テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| image            | string | null: false |
| name             | string | null: false |
| genre_id         | integer| null: false |
| allergies        | text   | null: false |
| store_name       | string | null: false |
| price            | integer| null: false |
| address          | string | null: false |
| text             | text   | null: false |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| post    | references | null: false, foreign_key: true |
| text    | text       | null: false                    |


### Association

- belongs_to :user
- belongs_to :post


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
