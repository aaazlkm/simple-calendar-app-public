import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:simple_calendar_app/core/appbuild/flavor.dart';
import 'package:simple_calendar_app/core/constant.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event_date.dart';
import 'package:simple_calendar_app/domain/calendar/usecase/calendar_usecase.dart';
import 'package:simple_calendar_app/locator/locator.dart';
import 'package:simple_calendar_app/presentation/res/app_color.dart';

DateTime createThisMonthDay({required int day}) => DateTime(DateTime.now().year, DateTime.now().month, day);

Color? generateColor() => AppColor.eventColors[Random().nextInt(AppColor.eventColors.length - 1)];

Future<void> setupDummyDataIfDevelopment() async {
  if (flavor != Flavor.development) {
    return;
  }

  switch (PlatformEx.languageCode) {
    case 'ja':
      await _setupDummyDataJa();
      break;
    default:
      await _setupDummyDataEn();
      break;
  }
}

Future<void> _setupDummyDataJa() async {
  final calendar = Constant.defaultCalendar;
  final movieColor = AppColor.eventColors[14];
  final baitoColor = AppColor.eventColors[0];
  final circleColor = AppColor.eventColors[8];
  final nomikaiColor = AppColor.eventColors[4];
  final biyouinnColor = AppColor.eventColors[1];
  final launchColor = AppColor.eventColors[12];
  final travelColor = AppColor.eventColors[9];

  final events = [
    calendar.createEvent(name: '映画', note: '', color: movieColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 1))),
    calendar.createEvent(name: 'バイト', note: '', color: baitoColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 5))),
    calendar.createEvent(name: 'バイト', note: '', color: baitoColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 7))),
    calendar.createEvent(name: 'サークル', note: '', color: circleColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 7))),
    calendar.createEvent(name: '飲み会', note: '', color: nomikaiColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 8))),
    calendar.createEvent(name: '自転車旅行', note: '', color: travelColor, eventDate: EventDate.range(start: createThisMonthDay(day: 9), end: createThisMonthDay(day: 12))),
    calendar.createEvent(name: 'ランチ', note: '', color: launchColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 13))),
    calendar.createEvent(name: '美容院', note: '', color: biyouinnColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 14))),
    calendar.createEvent(name: 'サークル', note: '', color: circleColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 14))),
    calendar.createEvent(name: '映画見る', note: 'インターステラー', color: movieColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 14))),
    calendar.createEvent(name: 'バイト', note: '書類忘れないように', color: baitoColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 14))),
    calendar.createEvent(name: 'サークル', note: '', color: circleColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 16))),
    calendar.createEvent(name: 'ランチ', note: '', color: launchColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 17))),
    calendar.createEvent(name: 'バイト', note: '', color: baitoColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 19))),
    calendar.createEvent(name: 'バイト', note: '', color: baitoColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 21))),
    calendar.createEvent(name: '旅行', note: '持ち物\nお金\nリュック\n服\nタオル\nサンダル', color: travelColor, eventDate: EventDate.range(start: createThisMonthDay(day: 23), end: createThisMonthDay(day: 23))),
    calendar.createEvent(name: 'サークル', note: '', color: circleColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 24))),
    calendar.createEvent(name: 'バイト', note: '', color: baitoColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 27))),
    calendar.createEvent(name: '飲み会', note: '', color: nomikaiColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 28))),
    calendar.createEvent(name: '映画', note: '', color: movieColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 29))),
  ];
  final calendarUseCase = locator.get<CalendarUseCase>();
  final allEvents = await calendarUseCase.fetchAllEvents(calendar.id);
  allEvents.dataOrNull?.forEach(calendarUseCase.deleteEvent);
  events.forEach(calendarUseCase.saveOrUpdateEvent);
}

Future<void> _setupDummyDataEn() async {
  final calendar = Constant.defaultCalendar;
  final movieColor = AppColor.eventColors[14];
  final baitoColor = AppColor.eventColors[0];
  final circleColor = AppColor.eventColors[8];
  final nomikaiColor = AppColor.eventColors[4];
  final biyouinnColor = AppColor.eventColors[1];
  final launchColor = AppColor.eventColors[12];
  final travelColor = AppColor.eventColors[9];

  final events = [
    calendar.createEvent(name: 'Movie', note: '', color: movieColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 1))),
    calendar.createEvent(name: 'work', note: '', color: baitoColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 5))),
    calendar.createEvent(name: 'work', note: '', color: baitoColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 7))),
    calendar.createEvent(name: 'club', note: '', color: circleColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 7))),
    calendar.createEvent(name: 'drinking party.', note: '', color: nomikaiColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 8))),
    calendar.createEvent(name: 'bike travel', note: '', color: travelColor, eventDate: EventDate.range(start: createThisMonthDay(day: 9), end: createThisMonthDay(day: 12))),
    calendar.createEvent(name: 'launch', note: '', color: launchColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 13))),
    calendar.createEvent(name: 'hair salon', note: '', color: biyouinnColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 14))),
    calendar.createEvent(name: 'club', note: '', color: circleColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 14))),
    calendar.createEvent(name: 'Movie', note: 'interstellar', color: movieColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 14))),
    calendar.createEvent(name: 'work', note: 'Don\'t forget the documents', color: baitoColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 14))),
    calendar.createEvent(name: 'club', note: '', color: circleColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 16))),
    calendar.createEvent(name: 'launch', note: '', color: launchColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 17))),
    calendar.createEvent(name: 'work', note: '', color: baitoColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 19))),
    calendar.createEvent(name: 'work', note: '', color: baitoColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 21))),
    calendar.createEvent(
        name: 'travel',
        note: 'things\nwallet\nBackpack\nClothes\nTowel\nSandals',
        color: travelColor,
        eventDate: EventDate.range(start: createThisMonthDay(day: 23), end: createThisMonthDay(day: 23))),
    calendar.createEvent(name: 'club', note: '', color: circleColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 24))),
    calendar.createEvent(name: 'work', note: '', color: baitoColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 27))),
    calendar.createEvent(name: 'drinking party.', note: '', color: nomikaiColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 28))),
    calendar.createEvent(name: 'Movie', note: '', color: movieColor, eventDate: EventDate.day(dateTime: createThisMonthDay(day: 29))),
  ];
  final calendarUseCase = locator.get<CalendarUseCase>();
  final allEvents = await calendarUseCase.fetchAllEvents(calendar.id);
  allEvents.dataOrNull?.forEach(calendarUseCase.deleteEvent);
  events.forEach(calendarUseCase.saveOrUpdateEvent);
}
