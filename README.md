# アプリケーション情報

### アプリケーション名

#### mirai

![トップページ](https://user-images.githubusercontent.com/76541309/116776473-8f917d80-aaa3-11eb-8c96-294563be32d1.jpeg)


### アプリケーション概要(コンセプト)
カレンダーを使った日記と言う名目の予定表です。

予定を立ててより日常を快適により濃くする為に作りました。
InstagramやFacebookでは訪れた場所を書き留める事が多いですがその前にしっかりと計画をたててより濃い時間を過ごせるようにするのが狙いです。

### 工夫した点
投稿内容を見やすくする為に工夫しました。
後は相互フォローで
いく事をしないといけないという現実を感じました。
今までは指示通り、見た目も同じものを作る、ビューファイルもある程度は用意して
くれていましたが今回からそうではなかったからです。
結果としては見た目に違和感もなく見やすい仕上がりになりました。完成するともっと機能の実装をしたい欲求も得られた事が追加で実装した大きな成果だと感じています。

### 課題今後実装したい機能
予定の文章がまだまだ見辛いです。
改行が上手くいってなったり見やすさの点です。
今後はフォロー機能や画像プレビュー機能や画像複数枚投稿機能の実装をして見やすさに追求していきたいと感じています。
又、予定と言うことからセキュリティー面での強化も実装したいと考えています。

### URL
http://3.139.2.242:3000/


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
## relationships テーブル

| Column       | Type   | Options    |      
| -------------|--------|------------|
| user         | references |  null: false, foreign_key: true |
| friend       | references |  null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many   :comments
