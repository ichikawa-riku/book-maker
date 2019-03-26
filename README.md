## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index:true|
|email|string|null: false, unique: true|
|password|string|null: false|
|avater|integer|null:fales|

### Association
- has_many :games
- has_many :owners
- has_many :games, through:members
- has_many :members
- has_many :bets, through:games

## gamesテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|detail|text|null: true|
|closed_at|datetime|null:false|
|is_closed|boolean|default: false, null: false|
|finised_at|datetime|null:false|
|is_finished|boolean|default: false, null: false|

### Association
- has_one :owners
- has_many :players
- has_many :bets
- has_many :users, through:members
- has_many :members

## ownersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|game_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :game

## betsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|game_id|references|null: false, foreign_key: true|
|player_id|references|null: false, foreign_key: true|
|point|integer|null:false|
|is_added|boolean|default: false, null: false|

### Association
- belongs_to :user
- belongs_to :game
- belongs_to :player

## playerテーブル

|Column|Type|Options|
|------|----|-------|
|game_id|references|null: false, foreign_key: true|
|name|string|null: false|
|image|string|null: true|
|odds|integer|null: false|

### Association
- belongs_to :game
- has_many :bets
- has_one :wins

## winsテーブル

|Column|Type|Options|
|------|----|-------|
|player_id|references|null: false, foreign_key: true|
|wined|boolean|default: false, null: false|

### Association
- belongs_to :player

## memberテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|game_id|references|null: false, foreign_key: true|

### Association
- belongs_to :game
- belongs_to :user

