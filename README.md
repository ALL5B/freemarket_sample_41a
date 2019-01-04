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
- has_one :creditcard
- has_one :address
- has_one :personal_info
- has_many :comments


## creditcardテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key: ture|
|cardnumber|integer|null: false|
|expiration_month|integer|null: false|
|expiration_year|integer|null: false|
|security_code|integer|null: false|

### Association

- belongs_to :user

## Rateテーブル

|Column|Type|Options|
|------|----|-------|
|message|text|null: true?|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
|rate|integer|null: false|

### Association
- belongs_to :user
- belongs_to :product




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
| seller |references|null: false,foreign_key: true|
| name |string|null:false|
| detail | text | null: false|
| category_id|references| null: false, foreign_key: true|
| condition|integer| null: false|
| bland_id | references | null: true, foreign_key: true|
| area_id | references | null: false, foreign_key: true|
| shipmentday| integer | null: false|
| shipment|integer|null: false|
|price|decimal|precision: 10,scale: 0|
|size_id|references|null: true,foreign_key: true|
|  fee | integer | null: false|

### Association

- belongs_to :user,foreign_key => "seller"
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
| sizetype_id|refereces|null: true,foreign_key: true|



### Association

- has_ancestry
- has_many products
- belongs_to sizetype
- has_many :blands




## Sizetypeテーブル

|Column|type|option|
|------|----|------|
| name | string|null: false|

### Association

- has_many :sizes
- has_many :categories



## Sizeテーブル

|Column|type|option|
|------|----|------|
| name |string|null: false|
| sizetype_id|references|null: false,foreign_key: true|

### Association

- has_many :products
- belongs_to :sizetype






## Blandテーブル

|Column|type|option|
|------|----|------|
| name | string|null: false|
| category_id| references|null:false, foreign_key|


### Association

- has_many products
- belongs_to category

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

## addressテーブル

|Column|type|option|
|------|----|------|
| user_id|references|foreign_key: true|
| first_name | string | null: false|
| last_name | string | null: false|
|first_name_kana| string | null: false|
| last_name_kana| string | null:false |
| zip-code | integer | null: false |
| prefecture | string | null: false |
| city | string | null: false |
| address1 | string | null: false |
| address2 | string | null: true |
| telephone | integer | null: true |


### Association

- belongs_to :user



## Personal_infoテーブル

|Column|type|option|
|------|----|------|
| user_id | references |foreign_key: true|
| first_name | string | null: false|
| last_name | string | null: false|
|first_name_kana| string | null: false|
| last_name_kana| string | null:false |
| zip-code | integer | null: true |
| prefecture | string | null: false |
| city | string | null: false |
| address1 | string | null: false |
| address2 | string | null: true |
|birthday | integer | null: false |


### Association

- belongs_to :user


## comment
|Column|type|option|
|------|----|------|
| text | text | null: dalse|
| user_id | references | foreign_key:true |
| product_id | references | foreign_key |


### Assosiation

- belongs_to :product
- belongs_to :user

