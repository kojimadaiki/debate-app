# ![logo](https://user-images.githubusercontent.com/74892623/105153631-01286a00-5b4c-11eb-8e72-6a3a4f8899ae.png)
水泳の技術についてコーチと討論できる**Connecting**というアプリです。<br>
画像や動画を投稿できるので、視覚的に動作の改善を指導していただけます。<br>
また、1対1なのでご自身の聞きたいことについて気兼ねなく聞くことができます。<br>
ログイン方法はユーザーとコーチの二つがあります。<br>
<img width="2500px" alt="top" src="https://user-images.githubusercontent.com/74892623/105152351-65e2c500-5b4a-11eb-9181-77d8209eb9f7.png">

 以下がアプリの挙動です。<br>
 ![debate-app-coach](https://user-images.githubusercontent.com/74892623/105154254-b5c28b80-5b4c-11eb-90ba-54c91a30c95b.gif)


## URL
http://18.225.12.27/
画面右上のHeader部から、ユーザーとコーチの1人ずつを新規登録していただければ討論することができます。

## アプリケーションの概要
  このアプリケーションは地方に住んでいるスイマーをターゲットにしました。<br>
新型コロナウィルスの影響により、遠方から都会に出てきて気軽にレッスンを受けることができなくなりました。<br>
アプリ上ではありますがそのような熱意ある方々に利用して頂き、コーチの方から知識を吸収してもらえればと思います。


## 使用技術
•Ruby 2.6.5<br>
•Ruby on Rails 6.0.3.4<br>
•MySQL 5.6.50<br>
•Nginx<br>
•AWS<br>
  ◦EC2<br>
  ◦S3<br>
•RSpec<br>
•Active Storage<br>
•Simple_calendar<br>
•Mini_magick<br>
•Image_processing<br>
•Rails_i18n<br>

## 機能一覧
•ユーザー登録、ログイン機能(devise)<br>
•投稿機能<br>
  ◦画像投稿(Active Storage, Ajax)<br>
  ◦動画投稿(Active Storage, Ajax)<br>
  ◦コメント投稿(Ajax)<br>
•スムーズスクロール機能(Jquery)<br>
•掲示板機能(Simple_calendar)<br>
•日本語化表示<br>