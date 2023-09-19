## **サービス名**
League Highlight

## **サービスURL**
https://www.leaguehighlight.com

## **基本機能**
<table>
  <tr>
     <th style="text-align: center">チーム名で検索</th>
    <th style="text-align: center">動画のいいね・お気に入り</th>
    <th style="text-align: center">お気に入り動画一覧</th>
  </tr>
  <tr>
    <td><img src="https://i.gyazo.com/c9b9dc4dbea67fe8e86050d48d4d398a.gif" alt="チーム名で検索" />ハイライトを見たいチーム名を選択。</td>
    <td><img src="https://i.gyazo.com/5958c5a2817ffff69144478bc2b73dca.gif" alt="動画のいいね・お気に入り" />動画をいいねやお気に入りに登録。</td>
    <td><img src="https://i.gyazo.com/779ea3b678d422f0fdb48546a663e9f8.gif" alt="お気に入り動画一覧" />お気に入りの動画を一覧で表示。</td>
  </tr>
</table>

## **サービス概要**
自分が好きなサッカーチームのハイライトをまとめて視聴できるサービスです。
ユーザー登録をすればハイライトをお気に入りに登録することができ、気軽に視聴できます。

### **メインのターゲットユーザー**
- サッカーが好きだが、なかなか全試合を見る時間がない人。
- 試合のハイライトでも十分に楽しめる人。
- 好きなチームのハイライトを気軽に楽しみたい。

### **ユーザーが抱える課題**
- YouTubeにハイライトの動画が上がっているが、様々なチームやリーグが出てくるので探す時間がかかる。
- ハイライト動画をお気に入りとして管理できるようにしたい。

### **解決方法**
- チームごとにハイライト動画をまとめることで、自分が見たいハイライトを検索しやすくする。
- 好きな動画をお気に入りとして登録することでいつでもマイページで確認できるようにする。

### **実装の機能**
1. ハイライト動画の検索・詳細表示機能(ユーザー登録不要)

2. チーム毎の動画検索機能(ユーザー登録不要)

3. ユーザー登録・編集・削除機能(ユーザー登録後)

4. 動画のお気に入り登録・削除機能(ユーザー登録後)

5. 動画のコメント機能(ユーザー登録後)

6. 動画のいいね機能(ユーザー登録後)

### **YouTube DataAPIの通信について**
YouTube DataAPIから動画を取得する際には、Search: listメソッドを使って、「チーム名 + ハイライト」という検索キーワードで関連動画を取得。
また動画情報の更新については週に3回、YouTube APIと通信を行い最新の情報をDBに保存をするように実装。
本番環境ではHeroku Schedulerを利用、開発環境では gem 'whenever'を使用して、上記の更新を自動で実行します。

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
私自身サッカーが好きですが、フルでの試合視聴は少なく、ハイライトを見ることが多いです。
好きなチームのハイライトをまとめて視聴できるような環境があれば、もっと快適に楽しむことができるのではないかと考え、このサービスを開発しようと思いました。

## 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/70d161db949192b41c7af00b1cc2b714.png)](https://gyazo.com/70d161db949192b41c7af00b1cc2b714)

## ER図
[![Image from Gyazo](https://i.gyazo.com/957275be81a4b72d33347a8319bda6df.png)](https://gyazo.com/957275be81a4b72d33347a8319bda6df)
