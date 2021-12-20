# テーブル設計

## usersテーブル
| Column             | Type    | Options             |
| ------------------ | ------- | ------------------- |
| nickname           | string  | null: false         |
| email              | string  | null: false, unique |
| encrypted_password | string  | null: false         |
| zenkaku_first_name | string  | null: false         |
| zenkaku_last_name  | string  | null: false         |
| kana_first_name    | string  | null: false         |
| kana_last_name     | string  | null: false         |
| birth_day          | date    | null: false         |

### Association
- has_many :items
- has_many :orders

## itemsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| product            | string     | null: false                    |
| instruction        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| postage_id         | integer    | null: false                    |
| ship_source_id     | integer    | null: false                    |
| ship_period_id     | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## ordersテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :residence


## residencesテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | integer    | null: false                    |
| prefecture         | string     | null: false                    |
| municipality       | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     |                                |
| phone_number       | integer    | null: false                    |
| order              | references | null: false, foreign_key: true |

### Association
- belongs_to :order