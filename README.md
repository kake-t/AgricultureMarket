# AglicultureMarket アグリマ  
![2018-09-13 1 06 13](https://user-images.githubusercontent.com/36560265/45438253-a4058980-b6f1-11e8-8f58-036914687d95.png)
## 概要
農産物のフリマアプリ

### デプロイ
https://agriculturemarket.herokuapp.com/

## 説明
専業農家ではないけど、自分で作った野菜を食べてほしい。
家庭菜園で野菜を育てたけど、食べきれない。
そんな人達がフリーマーケットで気軽に野菜の販売ができたらいいなと思って作成しました。

#### ER図
![ER図](https://user-images.githubusercontent.com/36560265/45362176-19e4f480-b60f-11e8-9d30-451d380a6cec.png)

#### 画面遷移図
![画面遷移図](https://user-images.githubusercontent.com/36560265/45362213-3c770d80-b60f-11e8-8844-33f4375fb99b.png)

## 開発環境
言語・ミドルウェアなど

- ローカル開発PC（Mac）
- Ruby 2.3.1
- Ruby on Rails 5.1.6
- PostgreSQL 10.2
- Bootstrap v4.1.1

## 使い方
トップページからサインアップボタンを押してアカウントを作成したください。
![サインアップボタン](https://user-images.githubusercontent.com/36560265/45438291-b8498680-b6f1-11e8-8815-5c2d5ec637c5.png)

ユーザー登録画面に必要事項を入力してユーザー登録ボタンを押してください。

アカウント有効確認メールが届くのでアカウントを有効にするリンクを押してください。
メールのリンクをクリックしたらログインできるようになります。

### 商品を購入したいとき
商品一覧画面から購入したい商品を選択してください。

商品の詳細画面に移動すると、購入申請ボタンがあるのでそれを押してください。

購入申請ボタンを押すとお知らせのメールが届きます。

送られてきたメールのリンクをクリックすると出品者とのチャットページに移動することができます。
（マイページの購入申請中の商品リンクからも移動できます）

チャットページで出品者と商品の受け渡し方法などをやり取りしてください。

出品者から商品が届いたら受け取り完了ボタンを押してください。

購入をキャンセルしたい場合は購入キャンセルボタンをおしてください。

以上で取引終了です。

### 出品したいとき
最初に、マイページに移動して生産者情報登録リンクをクリックして生産者情報を登録してください。

登録できると商品を出品することができるようになります。

新規出品ボタンを押して商品を出品しましょう。

フォームに情報を入力して登録してください。

登録が完了すると商品一覧画面に出品した商品が表示されます。誰かが購入申請をしてくれるのを待ちましょう。

#### 購入申請がきたら
誰かがあなたの出品した商品に購入申請すると、あなたにお知らせメールが送信されます。

送られてきたメールのリンクをクリックすると購入希望者とのチャットページに移動することができます。（商品の詳細ページからも移動できます）

チャットページで購入希望者と商品の受け渡し方法などをやり取りしてください。

商品が相手に届くと、受け取り完了メールが来ます。

以上で取引終了です。

## インストール

1. `cd [ダウンロードしたいディレクトリ名]`
2. `git clone git@github.com:kakeyatomo/AgricultureMarket.git`
3. `cd Agriculturemarket/`
4. `bundle install`
5. Yarnを使って Bootstrap, jqueryの導入
  Yarnをインストールしてなければ下記サイトからインストールしてください
  https://yarnpkg.com/lang/en/
  `yarn add jquery`
  `yarn add bootstrap@4`
6. config/initializers/carrierwave.rb 内の
  `config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
      region:                'ap-northeast-1',
      path_style:            true
  }`
  上記のコードをコメントアウト
7. `rails db:create`
8. `rails db:migrate`
9. http://localhost:3000/ にアクセス
