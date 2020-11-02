# README

### usersテーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| nickname | string  | null: false |
| email    | string  | null: false |
| password | string  | null: false |
| name     | string  | null: false |
| birthday | date    | null: false |

### Association
- has_many :items
- belongs to :orders

### itemsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | text       | null: false                    |
| explanation   | text       | null: false                    |
| category      | string     | null: false                    |
| status        | string     | null: false                    |
| shipping_fee  | integer    | null: false                    |
| location      | string     | null: false                    |
| delivery_time | integer    | null: false                    |
| selling_price | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association
- belongs to :users
- has_one :orders

### ordersテーブル

| Column  | Type        | Options                        |
| ------- | ----------- | ------------------------------ |
| user_id | references  | null: false, foreign_key: true |
| item_id | references  | null: false, foreign_key: true |

### Association
- belongs to :users
- belongs to :items
- has_one :adresses

### addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | integer    | null: false                    |
| order_id      | references | null: false, foreign_key: true |

### Association
- belongs to :orders