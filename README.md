## ![logo](https://user-images.githubusercontent.com/74892623/105153631-01286a00-5b4c-11eb-8e72-6a3a4f8899ae.png)
水泳の技術についてコーチと討論できるアプリです。<br>
画像や動画を投稿できるので、視覚的に動作の改善を指導していただけます。<br>
また、1対1なのでご自身の聞きたいことについて気兼ねなく聞くことができます。<br>
ログイン方法はユーザーとコーチの二つがあります。<br>
<img width="2500px" alt="top" src="https://user-images.githubusercontent.com/74892623/105152351-65e2c500-5b4a-11eb-9181-77d8209eb9f7.png">

 



## usersテーブル


| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| nickname     | string | null: false |
| email        | string | null: false |
| password     | string | null: false |
| style        | string | null: false |

# association
-has_many :comments
-has_many :boards


## coachesテーブル


| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| teach_style        | string | null: false |

# association
-has_many :debates, through: coach_debate
-has_many :comments
-has_many :boards


## debatesテーブル


| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |

# association
-has_many :comments
-belongs_to :user
-belongs_to :coach


## commentsテーブル


| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| text          | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| coach         | references | null: false, foreign_key: true |

# association
-belongs_to :user
-belongs_to :coach
-has_one_attached :image


## boardsテーブル


| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| time          | string     | null: false                    |
| date          | string     | null: false                    |
| coach         | references | null: false, foreign_key: true |

# association
-has_many :coaches
-has_many :users


## coach_debateテーブル


| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| coach         | references | null: false, foreign_key: true |
| debate        | references | null: false, foreign_key: true |

# association
-belongs_to :coach
-belongs_to :debate