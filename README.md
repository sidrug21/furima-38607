# テーブル設計

## users テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| password_digest    | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthdate          | date   | null: false               |

### Association
- has_many: item
- has_one: purchase


## items テーブル
| Column                    | Type      | Options                       |
| ------------------------- | --------- | ----------------------------- |
| user                      | reference | null: false foreign_key: true |
| item_name                 | string    | null: false                   |
| description               | text      | null: false                   |
| category_id               | integer   | null: false foreign_key: true |
| condition_id              | integer   | null: false                   |
| shipping_fee_burden_id    | integer   | null: false foreign_key: true |
| prefecture_id             | integer   | null: false foreign_key: true |
| shipping_duration_id      | integer   | null: false foreign_key: true |
| price                     | integer   | null: false                   |

### Association
- belongs_to: user
- has_one: purchase
- has_many: shipping_address
- has_many: condition
- has_many: shipping_duration
- has_many: shipping_fee_burden
- has_many: category


## shipping_addresses テーブル
| Column                 | Type      | Options                       |
| ---------------------- | --------- | ----------------------------- |
| purchase               | reference | null: false foreign_key: true |
| postal_code            | integer   | null: false                   |
| prefecture_id          | integer   | null: false foreign_key: true |
| city                   | string    | null: false                   |
| house_number           | integer   | null: false                   |
| building_name          | string    |                               |
| phone_number           | string    | null: false                   |

### Association
- has_one: purchase
- belongs_to: items
- has_many: prefecture


## purchases
| Column                 | Type      | Options                       |
| ---------------------- | --------- | ----------------------------- |
| user                   | reference | null: false foreign_key: true |
| item                   | reference | null: false foreign_key: true |

### Association
- belongs_to: user
- belongs_to: item
- belongs_to: shipping_address


## categories
| Column                 | Type      | Options     |
| ---------------------- | --------- | ----------- |
| category_name          | string    | null: false |

### Association
- belongs_to: item


## shipping_fee_burden
| Column                 | Type      | Options     |
| ---------------------- | --------- | ----------- |
| shipping_charge_bearer | string    | null: false |

### Association
- belongs_to: item


## shipping_duration
| Column                 | Type      | Options     |
| ---------------------- | --------- | ----------- |
| dispatch_period        | string    | null: false |

### Association
- belongs_to: item


## conditions
| Column                 | Type      | Options     |
| ---------------------- | --------- | ----------- |
| product_condition      | string    | null: false |

### Association
- belongs_to: item


## prefectures
| Column                 | Type      | Options     |
| ---------------------- | --------- | ----------- |
| prefecture_id          | integer   | null: false |

### Association
- belongs_to: shipping_address
- has_one: credit_cards


## credit_cards
| Column                 | Type      | Options                       |
| ---------------------- | --------- | ----------------------------- |
| user                   | string    | null: false                   |
| card                   | string    | null: false                   |

### Association
- belongs_to: purchase
