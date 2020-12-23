## usersテーブル


| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| nickname     | string | null: false |
| email        | string | null: false |
| password     | string | null: false |
| style        | string | null: false |

# association
-has_many :debates, through: user_debate
-has_many :comments


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
-belongs_to :bulletin_board


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


## bulletin_boardsテーブル


| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| time          | string     | null: false                    |
| date          | string     | null: false                    |
| coach         | references | null: false, foreign_key: true |

# association
-has_many :coach


## user_debatesテーブル


| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| debate        | references | null: false, foreign_key: true |

# association
-belongs_to :user
-belongs_to :debate


## coach_debateテーブル


| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| coach         | references | null: false, foreign_key: true |
| debate        | references | null: false, foreign_key: true |

# association
-belongs_to :coach
-belongs_to :debate