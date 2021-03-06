# 簡易仕様書

## アプリ名

シンプルカレンダー

| カレンダー画面 | 予定一覧画面 | 予定登録画面 |
| :-------: | :----------: | :-------: |
| ![カレンダー画面](https://user-images.githubusercontent.com/40765910/135780974-a21f631a-6089-4e3d-8d2b-0e91dd4c63f2.gif)　| ![予定一覧画面](https://user-images.githubusercontent.com/40765910/135780981-dbc656e8-45a1-4387-b3ee-da862dd115d2.gif) | ![予定登録画面](https://user-images.githubusercontent.com/40765910/135780964-9e89a42f-b230-4ee6-be63-7a1750e755f3.gif) |

## 公開したアプリの URL

<https://apps.apple.com/us/app/simple-calendar-schedule-app/id1558989799>

## 該当プロジェクトのリポジトリ URL

リリースしてるリポジトリには公開したくない情報も含まれてるので、別でコピーしたものを用意しました。  
gitの履歴も削除してあります。ご了承ください。  
<https://github.com/aaazlkm/simple-calendar-app-public>

## 対象OS

iOS 10以上  
android 21以上  

## 開発環境/言語

開発環境  
Android Studio 4.1.1  
Xcode 12.3  

開発言語   
dart 2.14.2  

## 機能概要

- 予定表示機能: 予定をカレンダー形式で表示する  
- 予定登録機能: 予定をローカルDBに保存する  
- 設定機能: アプリ内の設定を行う  
- バックアップ機能: Google driveにバックアップ/復元する  
- 通知機能: 指定した時間に一日の予定の通知を行う  

## 画面概要

- カレンダー画面 : 予定をカレンダー形式で表示する。
- 予定一覧画面 ：一日の予定を一覧表示する。
- 予定登録画面 ：予定を登録する。
- 設定画面 : アプリ内の設定をする。
- 通知設定画面 : 一日のお知らせの設定をする。
- バックアップ画面 : バックアップされたデータを一覧表示する。

## 使用しているAPI,SDK,ライブラリなど

API  

- google drive api

SDK  

- flutter v2.5

ライブラリ  

量が多いため主要なライブラリだけ記載します。  
詳細は[こちら](https://github.com/aaazlkm/simple-calendar-app-public/blob/main/pubspec.yaml#L11-L89)に全て記載されてます。  

- [provider](https://pub.dev/packages/provider)
- [rxdart](https://pub.dev/packages/rxdart)
- [get_it](https://pub.dev/packages/get_it)
- [firebase_core](https://pub.dev/packages/firebase_core)
- [firebase_analytics](https://pub.dev/packages/firebase_analytics)
- [firebase_crashlytics](https://pub.dev/packages/firebase_crashlytics)
- [google_sign_in](https://pub.dev/packages/google_sign_in)
- [googleapis](https://pub.dev/packages/googleapis)
- [sembast](https://pub.dev/packages/sembast)
- [shared_preferences](https://pub.dev/packages/shared_preferences)

## コンセプト

シンプルで使いやすいカレンダーアプリ  

## こだわったポイント

保守しやすいように設計にこだわって開発しました。  
このアプリではクリーンアーキテクチャとDDDの考えを元に開発をしています。  
これにより、可読性が高く、重複がない、保守性のあるコードを書けていることを実感しています。  

## デザイン的にこだわったポイント

デザイン的にこだわったポイントは、カレンダーの登録画面のデザインです。  
この画面はアプリの中で一番使う画面なので、ここの使いやすさがアプリの使いやすさに直結すると考えました。  
そのため、具体的に以下の工夫をしました。  

**1.ユーザが今選択してる物だけを表示する**    
ユーザが今選択してる物だけを表示することで、入力してるものに集中できるようにしました。  
例えば下のgifだと分かりやすいのですが、日付項目を選択してる状態で色項目を選択すると、自動的に日付項目が閉じ色項目が表示されるようになっています。  
このようにユーザが今選択してるものだけを表示することで、入力に集中でき使いやすくなりました。  

<img src="https://user-images.githubusercontent.com/40765910/135576000-38adef3d-4cd0-4983-abb5-0ce9c72489d8.gif" width="300">

**2.必須項目はダイアログなどで登録せず、画面内で登録できるようにする**    
ダイアログでの値の登録は使いにくいと考え、画面内で値を登録出来るようにしました。  
理由としては、ダイアログを使用すると値を登録する時に毎回ダイアログの開く/閉じる動作が必要であり、この一連の動作は負担が大きいと考えたからです。  
特に必須項目のような、頻繁に値の変更があるものに対しては、影響が大きいと感じました。  
そのため、ダイアログを使用せずに画面内で値の登録を出来るようにしました。  
これにより、ダイアログを使用する手間も省け、使いやすくなりました。  

**3.オプションの項目は最初は画面に表示せずに、後から追加するようにする**    
画面に表示する項目が多いと、認識する情報量が増えるために使いづらくなると考えました。  
それを解決するために、オプションの項目は最初から表示するのではなく後から追加するようにしました。  
これにより、何を登録し何を登録しなくていいのかが明確になり、使いやすくなりました。   

## 自己評価

コンセプト通り、シンプルで使いやすいアプリになったと思います。  
ダウンロード数はまだまだですが、評価も良かったり、仕事効率のランキングでは107位を取ったりなど、伸び代はありそうです。  
一方で機能面ではまだまだ実装したいものがあるので、これからも開発してよりユーザに喜んでもらえるアプリにしていきたいです。  
