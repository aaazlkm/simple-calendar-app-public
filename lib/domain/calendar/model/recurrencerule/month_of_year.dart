enum MonthOfYear {
  january,
  february,
  march,
  april,
  may,
  june,
  july,
  august,
  september,
  october,
  november,
  december,
}

extension MonthOfYearEX on MonthOfYear {
  int get month {
    switch (this) {
      case MonthOfYear.january:
        return 1;
      case MonthOfYear.february:
        return 2;
      case MonthOfYear.march:
        return 3;
      case MonthOfYear.april:
        return 4;
      case MonthOfYear.may:
        return 5;
      case MonthOfYear.june:
        return 6;
      case MonthOfYear.july:
        return 7;
      case MonthOfYear.august:
        return 8;
      case MonthOfYear.september:
        return 9;
      case MonthOfYear.october:
        return 10;
      case MonthOfYear.november:
        return 11;
      case MonthOfYear.december:
        return 12;
    }
    throw AssertionError('unknown this type: $this');
  }
}
