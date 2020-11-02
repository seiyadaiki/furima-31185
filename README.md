# README

### usersテーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| name               | string  | null: false |
| birthday           | date    | null: false |

### Association
- has_many :items
- has_one :order

### itemsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| explanation   | text       | null: false                    |
| category      | integer    | null: false                    |
| status        | integer    | null: false                    |
| shipping_fee  | integer    | null: false                    |
| location      | integer    | null: false                    |
| delivery_time | integer    | null: false                    |
| selling_price | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belongs to :user
- has_one :order

### ordersテーブル

| Column | Type        | Options                        |
| -------| ----------- | ------------------------------ |
| user   | references  | null: false, foreign_key: true |
| item   | references  | null: false, foreign_key: true |

### Association
- belongs to :user
- belongs to :item
- has_one :adress

### addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association
- belongs to :order