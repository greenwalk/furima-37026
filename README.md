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
| birth_year         | integer | null: false         |
| birth_month        | integer | null: false         |
| birth_day          | integer | null: false         |

### Association
- has_many :items
- has_many :orders

## itemsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| product            | string     | null: false                    |
| instruction        | text       | null: false                    |
| category           | string     | null: false                    |
| condition          | string     | null: false                    |
| postage            | integer    | null: false                    |
| category           | string     | null: false                    |
| ship_source        | string     | null: false                    |
| ship_period        | string     | null: false                    |
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