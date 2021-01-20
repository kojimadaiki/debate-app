## user
![debate-app-user](https://user-images.githubusercontent.com/74892623/105145544-421b8100-5b42-11eb-8e78-89626c233655.gif)

## coach
![debate-app-coach](https://user-images.githubusercontent.com/74892623/105145627-58294180-5b42-11eb-9f90-bacef2b5a94b.gif)


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