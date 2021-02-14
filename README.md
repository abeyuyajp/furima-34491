# テーブル設計

## users テーブル
| column              | Type    | Options                   |
| --------------------| ------- | ------------------------- |
| nickname            | string  | null: false               |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| family_name         | string  | null: false               |
| first_name          | string  | null: false               |
| family_name_kana    | string  | null: false               |
| first_name_kana     | string  | null: false               |
| birth_day           | date    | null: false               |

### Association

- has_many :items
- has_many :purchases


## items テーブル
| column           | Type       | Options                        |
| ---------------- | -----------|------------------------------- |
| name             | string     | null: false                    |
| text             | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| delivery_fee_id  | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| shipping_day_id  | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase



## purchases テーブル
| column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :delivery_address



## delivery_addresses テーブル
| column        | Type       | Options                        |
| --------------| ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| purchases     | references | null: false, foreign_key:true  |

### Association

- belongs_to :purchase