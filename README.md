## Connecting
水泳の技術についてコーチと討論できるアプリです。
画像や動画を投稿できるので、視覚的に動作の改善を指導していただけます。
また、1対1なのでご自身の聞きたいことについて気兼ねなく聞くことができます。
ログイン方法はユーザーとコーチの二つがあります。
<img width="1920" alt="top" src="https://user-images.githubusercontent.com/74892623/105152351-65e2c500-5b4a-11eb-9181-77d8209eb9f7.png">

 コーチログインでできること
 ![debate-app-user](https://user-images.githubusercontent.com/74892623/105152742-ee616580-5b4a-11eb-91ad-d9334f10a9c3.gif)

 ユーザーログインでできること
  ![debate-app-user](https://user-images.githubusercontent.com/74892623/105152797-00430880-5b4b-11eb-951d-381327f2c0f2.gif)



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