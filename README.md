# テーブル設計

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password_digest    | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthdate          | date   | null: false |


## items テーブル
| Column                 | Type      | Options                       |
| ---------------------- | --------- | ----------------------------- |
| image                  | string    | null: false                   |
| user_id                | reference | null: false foreign_key: true |
| item_name              | string    | null: false                   |
| description            | text      | null: false                   |
| category_id            | reference | null: false foreign_key: true |
| condition              | string    | null: false                   |
| shipping_fee_burden_id | reference | null: false foreign_key: true |
| shipping_from_id       | reference | null: false foreign_key: true |
| shipping_duration_id   | reference | null: false foreign_key: true |
| price                  | integer   | null: false                   |


## shipping_addresses テーブル
| Column                 | Type      | Options                       |
| ---------------------- | --------- | ----------------------------- |
| user_id                | reference | null: false foreign_key: true |
| postal_code            | integer   | null: false                   |
| prefecture_id          | reference | null: false foreign_key: true |
| city                   | string    | null: false                   |
| house_number           | integer   | null: false                   |
| building_name          | string    | null: false                   |
| phone_number           | integer   | null: false                   |


## purchases
| Column                 | Type      | Options                       |
| ---------------------- | --------- | ----------------------------- |
| user_id                | reference | null: false foreign_key: true |
| item_id                | reference | null: false foreign_key: true |
| shipping_addresses_id  | reference | null: false foreign_key: true |


## shipping_from
| Column                 | Type      | Options     |
| ---------------------- | --------- | ----------- |
| shipping_origin        | string    | null: false |


## categories
| Column                 | Type      | Options     |
| ---------------------- | --------- | ----------- |
| category_name          | string    | null: false |


## shipping_fee_burden
| Column                 | Type      | Options     |
| ---------------------- | --------- | ----------- |
| shipping_charge_bearer | string    | null: false |


## shipping_duration
| Column                 | Type      | Options     |
| ---------------------- | --------- | ----------- |
| dispatch_period        | string    | null: false |


## conditions
| Column                 | Type      | Options     |
| ---------------------- | --------- | ----------- |
| product_condition      | string    | null: false |


## prefectures
| Column                 | Type      | Options     |
| ---------------------- | --------- | ----------- |
| delivery_prefecture    | string    | null: false |


## credit_cards
| Column                 | Type      | Options                       |
| ---------------------- | --------- | ----------------------------- |
| user_id                | reference | null: false foreign_key: true |
| card_number            | integer   | null: false                   |
| expiration_date        | bigint    | null: false                   |
| security_code          | bigint    | null: false                   |