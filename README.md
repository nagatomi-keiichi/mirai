# アプリケーション情報

### アプリケーション名

#### mirai


### アプリケーション概要(コンセプト)
カレンダーを使った日記と言う名目の予定表です。

予定を立ててより日常を快適により濃くする為に作りました。
InstagramやFacebookでは訪れた場所を書き留める事が多いですがその前にしっかりと計画をたててより濃い時間を過ごせるようにするのが狙いです。

### URL(まとめ)
https://anipho-app.com/


# テーブル設計 


## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| hobby          |  string | null: false |
| friend        | references|  null: false, foreign_key: true |

### Association

- has_many :friends
- has_many :diaries

## diaries テーブル

| Column       | Type     | Options     |
| ------------ | ------   | ----------- |
| title        | string   | null: false |
| information  | text     | null: false |
| user         | references|  null: false, foreign_key: true |
### Association

- has_many      :comments
- belongs_to   :user
## comments テーブル
| Colum   | Type  |Option      |
| ------- | ----- | -----------|
| user      | references |  null: false, foreign_key: true |
| diary      | references |  null: false, foreign_key: true |
| comment   | text     | null: false |
| friend   | references |  null: false, foreign_key: true |
### Association

- belongs_to :diary
- belongs_to :friend
## friends テーブル

| Column       | Type   | Options    |      
| -------------|--------|------------|
| user         | references |  null: false, foreign_key: true |
| friend       | references |  null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many   :comments
