# テーブル設計

## users テーブル

| Column   | Type   | Options                   |
| -------- | ------ | ------------------------- |
| nickname | string | null: false               |
| email    | string | null: false, unique: true |
| password | string | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| category      | string     | null: false                    | 
| summary       | text       | null: false                    |
| condition     | string     | null: false                    |
| shipping      | integer    | null: false                    |
| ship_from     | string     | null: false                    |
| delivery_time | integer    | null: false                    |
| price         | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

##  purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination

## destinations テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | integer    | null: false                    |
| prefectures    | string     | null: false                    |
| municipalities | string     | null: false                    |
| block_number   | integer    | null: false                    |
| building_name  | string     | null: false                    |
| phone_number   | integer    | null: false                    |
| purchase_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase