# model考える #43

- todo
  - [x] どんな機能をつけるのか
  - [x] 繰り返し機能定義
  - [x] モデルを定義する
  - [x] 通知機能定義

## モデルを定義する

- Calendar  
  - id: CalendarId
  - name: String
  - events: List<Event>
- CalendarId
  - String
- Event
  - id: EventId
  - caledarId: CalendarId
  - name: String
  - dateRange: DateRange
  - timeRange: TimeRange
  - color: Color
  - memo: String
  - notifications: List<Notification>
  - repeat: Repeat
- EventId
  - id: String
- DateRange
  - from: DateTime
  - to: DateTime
- TimeRange
  - from: TimeOfDay
  - to: TimeOfDay
- Repeat (~~intervalの値制限するかしないか~~  <- 別にしても致命的なエラーとかではないからmodel側ではしない, UIならしてもいいかもね>
  - type: RepeatType
  - interval: int
- RepeatType
  - day 1 ~ 31
  - month 1 ~ 11
  - year 1 ~ 12
- Notification
  - id: NotificationId
    - 通知を削除したりする時に必要かもしれない
  - dateTime: DateTime
- NotificationID
  - id: String

## 繰り返し機能定義

- 定義
  - 設定した日付通りに自動でイベントを表示するようにする
  - 例
    - 毎日通知する
    - 5日ごとに通知する
    - 月曜日にサークルを通知する
    - 25日に給料日を通知する
    - 毎年11月1日に通知する
- パラメータ
  - 日 (週の指定もできる)
    - 1 ~ 31
  - 月
    - 1 ~ 12
  - 毎年
    - 1 ~ 100

## 通知機能定義

- 定義
  - 指定した時間に通知する
- 例
  - 予定の一時間前に通知
  - 予定の二時間前に通知
- パラメータ
  - DateTime

## どんな機能をつけるのか

- カレンダーは一つ
- 一日のどこかで通知するようにする
- イベントごとに通知を設定する
- 繰り返し設定できるようにする
- イベントはTimeRangeを持つ
