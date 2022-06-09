# README

## ER

### users_table

| column                         | type      | options                  |
|--------------------------------|-----------|--------------------------|
|nickname                        |string     |null: false               |
|email                           |string     |null: false, unique: true |
|encrypted_password              |string     |null: false               |
|last_name                       |string     |null: false               |
|first_name                      |string     |null: false               |
|last_name_katakana              |string     |null: false               |
|first_name_katakana             |string     |null: false               |
|birthday                        |date       |null: false               |

#### association

has_many :items,     dependent: :destroy
has_many :purchases, dependent: :destroy


### items_table

|column            |type       |options                       |
|------------------|-----------|------------------------------|
|item_name         |string     |null: false                   |
|explanation       |text       |null: false                   |
|category_id       |integer    |null: false                   |
|condition_id      |integer    |null: false                   |
|shipping_cost_id  |integer    |null: false                   |
|prefecture_id     |integer    |null: false                   |
|days_to_ship_id   |integer    |null: false                   |
|price             |integer    |null: false                   |
|user              |references |null: false, foreign_key; true|

#### association

belongs_to :user
has_one :purchase

### purchases_table

|column   |type      |options                                       |
|---------|----------|----------------------------------------------|
|user     |references|null: false, foreign_key: true                |
|item     |references|null: false, foreign_key: true, unique: true  |

#### association

belongs_to :user
belongs_to :item
has_one :shipping_address

### shipping_addresses_table

|column           |type            |options                       |
|-----------------|----------------|------------------------------|
|postal_code      |string          |null: false                   |
|prefecture_id    |integer         |null: false                   |
|city             |string          |null: false                   |
|address          |string          |null: false                   |
|building_name    |string          |                              |
|phone_number     |string          |null: false                   |
|purchase         |references      |null: false, foreign_key; true|

#### association

belongs_to :purchase