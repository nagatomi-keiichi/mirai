# アプリケーション情報

### アプリケーション名

#### mirai

### アプリ紹介
トップページ
![トップページ](https://user-images.githubusercontent.com/76541309/116854819-46703380-ac33-11eb-88db-37e999b371de.jpeg)

画像クリックで日記詳細ページに行きます

<img width="1433" alt="詳細ページ" src="https://user-images.githubusercontent.com/76541309/116776715-05e2af80-aaa5-11eb-846a-e3e96be466b4.png">
ユーザー詳細ページです。

<img width="244" alt="検索画面" src="https://user-images.githubusercontent.com/76541309/116776749-362a4e00-aaa5-11eb-86fe-3474fc907391.png">
検索結果画面です。

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
