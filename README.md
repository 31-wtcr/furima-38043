# README

## ER

### users_table

| column               | type      | options                  |
|----------------------|-----------|--------------------------|
|nickname              |string     |null: false               |
|e-mail_address        |string     |null: false, unique: true |
|password              |string     |null: false               |
|password_confirmation |string     |null: false               |
|last_name             |string     |null: false               |
|first_name            |string     |null: false               |
|last_name_katakana    |string     |null: false               |
|first_name_katakana   |string     |null: false               |
|birthday              |date       |null: false               |

#### association

has_many :items,     dependent: :destroy
has_many :purchases, dependent: :destroy


### items_table

|column         |type       |options                       |
|---------------|-----------|------------------------------|
|item_name      |string     |null: false                   |
|explanation    |text       |null: false                   |
|category       |string     |null: false                   |
|condition      |string     |null: false                   |
|shipping_cost  |string     |null: false                   |
|shipment_source|string     |null: false                   |
|days_to_ship   |string     |null: false                   |
|price          |integer    |null: false                   |
|user_id        |references |null: false, foreign_key; true|

#### association

belongs_to :user
has_one :purchase

### purchases_table

|column   |type      |options                    |
|---------|----------|---------------------------|
|user_id  |references|null: false                |
|item_id  |references|null: false, unique: true  |

#### association

belongs_to :user
belongs_to :item
has_one :shipping_address

### shipping_addresses_table

|column           |type            |options                       |
|-----------------|----------------|------------------------------|
|postal_code      |string          |null: false                   |
|prefecture       |string          |null: false                   |
|city             |string          |null: false                   |
|address          |string          |null: false                   |
|building_name    |string          |                              |
|phone_number     |string          |null: false                   |
|purchase_id      |references      |null: false, foreign_key; true|

#### association

belongs_to :purchase