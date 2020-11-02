# README

### usersテーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false |
| encrypted_password  | string  | null: false |
| family_name         | string  | null: false |
| first_name          | string  | null: false |
| family_name_frigana | string  | null: false |
| first_name_frigana  | string  | null: false |
| birthday            | date    | null: false |

### Association
- has_many :items
- has_many :orders

### itemsテーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | ------------------------------|
| title            | string     | null: false                   |
| explanation      | text       | null: false                   |
| category_id      | integer    | null: false                   |
| status_id        | integer    | null: false                   |
| shipping_fee_id  | integer    | null: false                   |
| location_id      | integer    | null: false                   |
| delivery_time_id | integer    | null: false                   |
| selling_price    | integer    | null: false                   |
| user             | references | null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :order

### ordersテーブル

| Column | Type        | Options                        |
| -------| ----------- | ------------------------------ |
| user   | references  | null: false, foreign_key: true |
| item   | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :adress

### addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association
- belongs_to :order