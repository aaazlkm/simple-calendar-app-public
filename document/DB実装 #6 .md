# DB実装 #6

- todo
  - [x] ScreenWidget データどこから取得するの問題
  - [x] timezoneの扱いについて調べる
  - [x] dbどれにするか
  - [x] 異なるTimeZoneの扱い方
  - [x] repeatUnitのいい名前探し
  - [x] RFC5545とは
  - [x] RecurrenceRuleどこまでやるか
  - [x] テーブル設計する
  - [x] api実装する

## RecurrenceRuleどこまでやるか

- 俺のアプリでは簡単に日・月・年を繰り返すだけにしようと思っていたが、これだとデバイスのカレンダーと統合する時に困る
- どうすべきか
- デバイスのやつを無視する
  - メリット
    - シンプルに保てる
  - 問題点
    - 大変そう
      - ルールを適用したDateTimeを生み出すのが大変そう
      - やれないことはないだろうが
    - デバイスのカレンダーと統合できない
      - いざやろうとすると、DBのプロパティをかなり買えないといけなくなってしまう
      - いやDBは別に買えなくていいのか
      - デバイスのカレンダーのイベントを表示するだけなので、イベントをモデルにできてしまえば問題がない
      - つまり統合する時に変更が必要になるのは、modelの方
        - でも、デバイスイベントとモデルの構成が同じな方がやりやすいとは思う
- 考えること
  - 正直アプリ内では簡単にしか使わない予定
    - 毎月、毎週、毎日 etc
    - でも将来もっとカスタムできるように登録したという時に、
      - シンプルな実装だと対応することができなくなる
      - なので最初から、大体のパターンを受け入れることができるようした方が、拡張性は高い
    - 実装自体はそんなに難しくはない
      - DBTableがちょっと変わるくらい
- 結論
  - device calendarを参考に実装しよう
    - 今のところカスタムで繰り返しを実装する予定はないが、拡張性のため
      - ここを考慮しないで実装しない場合、将来やりたい時に大変になる
    - 実装もそんなに複雑にはならない

## RFC5545とは

- RFCとは Request For Comment
  - IETF（インターネット関連の基準を決めている組織）が発行している文書
  - インターネットで用いられる様々な技術の標準や運用に関する事項など幅広い情報共有をおこ会うために公開させる文書シリーず
  - インターネット関連の技術に関する仕様をまとめた文書
- RFC5545で
  - iCalendar data formatを定義したもの
  - フォーマットを定義することでカレンダーサービスのプロトコルに関係なく、イベントやTOdoなどのカレンダーの情報をやりとりすることができる
  - プレーンテキストでUTG-8が使用させる
  - 拡張子は.ics
  - 詳しくは
    - <https://ja.wikipedia.org/wiki/ICalendar>
    - <http://www.asahi-net.or.jp/~CI5M-NMR/iCal/ref.html>
    - <https://tools.ietf.org/html/rfc5545>

## repeatUnitのいい名前探し

- どのように使う
  - day, month, yearを選択できる
  - intervalと組み合わせて以下のようなことを表現する
    - interval dayごとにイベントを表示
- 考察
  - interval の unitとして働いているよな
  - 何のunit何だ？
  - 間隔の単位？
    - 一年ごと
    - 一日ごと
    - 一週間ごと
  - 日付単位？
    - 日付ではないな
  - 繰り返しの単位？
    - 1年ごとに繰り返す
    - 1日ごとに繰り返す
  - cmは何の単位
    - 長さの単位
- 案
  - 1 dateUnit
    - dateの意味は日付
    - これはないな
  - 2 intervalUnit
  - 3 repeatUnit

## テーブル設計する

- テーブル
  - CalendarTable
    - id
    - name
  - eventTable
    - id
    - calendarId
    - name
    - note
    - color
    - allDay
    - start
    - end
    - timeZoneName
    - reeatTables
    - notifcations
  - RepeatTable
    - id
    - unitType
    - repeatInterval
  - NotificationTable
    - id
    - date
    - timeZoneName
- 考えること
  - Timerangeなくすかどうか
    - 何に使うつもりなのか
      - 時間設定を使うため
      - DateTimeに時間の情報を任せればいい気がするが
        - if allDay
          - if (isSameDay)
            - from or to
          - else
            - from, to
        - else
          - fromWithTime, endWithTime
      - 分ける必要がないな
        - 十分わかる

## 異なるTimeZoneの扱い方

- アプリ内に異なるタイムゾーンのイベントが複数個あった場合にどのようにカレンダーに表示すればいいのか考える
  - 具体例
    - アプリのTimeZoneが日本 +9:00
      - イベント: TimeZone 日本 +9:00　開始9:00
        - 10時表示
      - イベント: TimeZone イギリス +0:00 開始9:00
        - 18:00時表示
      - イベント: TimeZone アメリカ -4:00 開始9:00
        - 21:00
    - アプリのTimeZoneがイギリス +0:00
      - イベント: TimeZone 日本 +9:00　開始9:00
        - 0表示
      - イベント: TimeZone イギリス +0:00 開始9:00
        - 9表示
      - イベント: TimeZone アメリカ -4:00 開始9:00
        - 14表示
    - アプリのTimeZoneがアメリカ -4:00
      - イベント: TimeZone 日本 +9:00　開始9:00
        - 20
      - イベント: TimeZone イギリス +0:00 開始9:00
        - 5:00
      - イベント: TimeZone アメリカ -4:00 開始9:00
        - 9:00
  - 考えること
    - デバイスのTimeZoneを基準に考えれば良さそう
    - やること
      - 全てのイベントを`toLocal`によってデバイスのタイムゾーンに変換する
      - これを単純にカレンダーで表示すればいい

## dbどれにするか

- sembastにする
  - 使いやすい
  - Timestampの考慮もされてる
  - 今回は、dbよりdomainの方に集中したい
    - DDDの知識を使いたい
  - あまり変化はなさそう
    - isarが生まれてるくらい
    - これもまだリリースで使うのはちょっと怖い感じがする

## timezoneの扱いについて調べる

- Datetimeではtimezoneのことを気にしていないように見える
  - flutterではtimezoneをどのように扱うのか調べる
- dateTimeインスタンス化の時に、operating systemから取得してるぽい
  - dateTimeのプロパティに生えている
  - つまりflutterのdatetimeのtimezonの状態は2値
    - utc
    - local
      - こちらはosから自動で取得されている
- そもそもDBでdateを扱う場合のベストは？
  - OffsetDateTimeを使う
  - くわしくはNotionにまとめたので参照すること

## ScreenWidget データどこから取得するの問題

- android widget
  - serviceを通してデータを取得でいそうなので、sqliteが使えそう？
- ios widget
  - sqliteをwidgetに共有することはできそう
    - <https://useyourloaf.com/blog/sharing-data-with-a-widget/>
- パッケージ
  - <https://github.com/imReker/FlutterHomeWidge>
    - ios, android
    - 表示方法が、flutterでWidgetで表示できてる
      - Widgetの表示をnativeでやるのではなく、flutter のレンダリングで達成しようとしてる
  - <https://github.com/ABausG/home_widget>
    - ios, android
    - データはsharedPreference, Userdefaultでやっている
      - これならメインのDBを用意して、変わるごとに、HomeWidgetにjsonとかでデータを入れれば良さそうな気がする
      - Widget側で復元して、それを表示するようにする
- 結論
  - sharedPreferenceで共有すれば十分な気がする
    - sqliteで共有できればと思っていたが、
      - os差があり、変な不具合がありそう
      - そもそもiosではsqliteは微妙そう
    - そもそもWidgetではデータの読み出しを軽くして、表示するだけ
      - なので、データ変更があれば、sharedPreferenceを読み出して、アップデートをするだけで十分な気がする
