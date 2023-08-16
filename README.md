## **サービス名**
League Highlight

## **サービスURL**
https://www.leaguehighlight.com

## **トップ画面**
[![Image from Gyazo](https://i.gyazo.com/b06b48b1efaf7dcd9b412d112cb9975a.png)](https://gyazo.com/b06b48b1efaf7dcd9b412d112cb9975a)

## **動画再生画面**
[![Image from Gyazo](https://i.gyazo.com/1e76ed8cf5069baae4f02158a73786ed.png)](https://gyazo.com/1e76ed8cf5069baae4f02158a73786ed)

## **レスポンシブ対応**
[![Image from Gyazo](https://i.gyazo.com/ffb9c6189fc8f1b0fedd99b2c68b26b2.gif)](https://gyazo.com/ffb9c6189fc8f1b0fedd99b2c68b26b2)

## **サービス概要**
自分が好きなサッカーチームのハイライトをまとめて視聴できるサービスです。
ユーザー登録をすればハイライトをお気に入りに登録することができ、気軽に視聴することができるようになります。

### **メインのターゲットユーザー**
- サッカーが好きだが、なかなか全試合を見る時間がない人。
- 試合のハイライトでも十分に楽しめる人。
- 好きなチームのハイライトを気軽に楽しみたい。

### **ユーザーが抱える課題**
- youtubeにハイライトの動画が上がっているが、様々なチームやリーグが出てくるので探す時間がかかる。
- ハイライト動画をお気に入りとして管理できるようにしたい。

### **解決方法**
- チームごとにハイライト動画をまとめることで、自分が見たいハイライトを検索しやすくする。
- 好きな動画をお気に入りとして登録することでいつでもマイページから確認できるようにする。

### **実装の機能**
1. ハイライト動画の検索・詳細表示機能

2. チームカテゴリー毎の動画検索機能

3. ユーザー登録・編集・削除機能

4. 動画のお気に入り登録・削除機能

5. 動画のコメント機能

6. 動画のいいね機能

1〜2はユーザー登録不要

3〜6はユーザー登録後に利用可能

### **YouTube DataAPIの通信について**
YouTube DataAPIから動画を取得する際には、Search: listメソッドを使い検索キーワードを「チーム名 + ハイライト」として関連の動画を取得。
また動画情報の更新については週に3回、YouTube APIと通信を行い最新の情報をDBに保存をするように実装。
また、gem 'whenever'を使い上記の更新は自動で実行。

## **使用技術**
バックエンド
- Ruby 3.2.2
- Ruby on Rails 7.0.4

フロントエンド
- JavaScript
- Tailwind CSS
- daisyUI

データベース
- MySQL

コンテナ管理
- Docker

CI
- GitHub Actions

コード解析
- RuboCop
- Erblint

テスト
- Rspec

外部API
- YouTube Data API

ユーザー認証
- Sorcery

バックグラウンド処理
- Whenever

画像アップロード
- carrierwave

画像ストレージ
- Amazon S3

デプロイ
- Heroku

## **なぜこのサービスを作りたいのか？**
私自身、サッカーが好きですがフルで試合を見ることが少なく、基本的にハイライトを見て楽しんでいます。
好きなチームのハイライトをまとめて視聴できるような環境があれば、もっと快適に楽しむことができるのではないかと考え、このサービスを開発しようと思いました。

## 画面遷移図
https://www.figma.com/file/CvWxmTqXPFfmhnKmZbOves/League-Highlight-%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?type=design&node-id=0%3A1&mode=design&t=IiLA9bB7JTn0b3Ba-1

## ER図
[![Image from Gyazo](https://i.gyazo.com/957275be81a4b72d33347a8319bda6df.png)](https://gyazo.com/957275be81a4b72d33347a8319bda6df)