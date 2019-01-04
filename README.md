# データベース設計

## Userテーブル

|Column|Type|Options|
|------|----|-------|
| name |string|null: false,unique: true|
| password |string |null: false,unique: true|
| region | string | null: false,unique: true |
| mailadress | string | null: false,unique: true|


### Association
- has_many :rates
- has_many :products
- has_many :likes
- has_many :transactions
- has_many :comments



## Rateテーブル

|Column|Type|Options|
|------|----|-------|
|message|text|null: true?|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
|rate|integer|null: false|

### Association
- belongs_to :user
- has_one :product




## Likeテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key: true|
|product_id|references|null: false,foreign_key: true|

### Association

- belongs_to :user
- belongs_to :product



## Transactionテーブル

|Column|type|option|
|------|----|------|
|user_id|references|null: true,foreign_key: true|
|product_id|references|null: false|foreign_key:true|
|deal|boolean|default: false|


### Association

- belongs_to :user
- belongs_to product




## productテーブル

|Column|type|option|
|------|----|------|
| user_id |references|null: false,foreign_key: true|
| name |string|null:false|
| detail | text | null: false|
| category_id|references| null: false, foreign_key: true|
| condition|integer| null: false|
| bland_id | references | null: true, foreign_key: true|
| area_id | references | null: false, foreign_key: true|
| shipmentday| integer | null: false|
| shipment|integer|null: false|
|price|decimal|precision: 10,scale: 0|
|size_id|references|null: true,foreign_key|
|  fee | integer | null: false|

### Association

- belongs_to :user
- has_one :rate
- has_many :likes
- belongs_to :category
- belongs_to :bland
- belongs_to :area
- belongs_to :size
- has_one :transaction
- has_many :product_images
- has_many :comments

## Categoryテーブル

|Column|type|option|
|------|----|------|
| name | string | null: false|
| ancestry|string|index: true|



### Association

-  has_ancestry
-  has_many products




## Blandテーブル

|Column|type|option|
|------|----|------|
| name | string|null: false|


### Association

- has_many products


## Areaテーブル

|Column|type|option|
|------|----|------|
| name | string | null: false|

### Association

- has_many products


## product_image　テーブル

|Column|type|option|
|------|----|------|
| image | text| ----|
|product_id|references|null: false, foreign_key: true|

### Association

- belongs_to :product


## Sizeテーブル

|Column|type|option|
|------|----|------|
| name |string|null: false|

### Association
- has_one :product


## comment
|Column|type|option|
|------|----|------|
| text | text | null: dalse|
| user_id | references | foreign_key:true |
| product_id | references | foreign_key |


### Assosiation

- belongs_to :product
- belongs_to :user

