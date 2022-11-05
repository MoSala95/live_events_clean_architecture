import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:live_events_clean_architecture/core/app_global_services/settings_service.dart';
import 'package:logger/logger.dart';
import 'package:live_events_clean_architecture/core/constants/app_assets.dart';
 import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';



const englishKey = "en";
const arabicKey = "ar";

class LocalizationService extends Translations {
  final settingsService = Get.find<SettingsService>();

  // final settingsService = Get.find<SettingsService>();
  static Map<String, String> en = {"x": "x"};

  static Map<String, String> ar = {"x": "x"};
  static const fallbackLocale = Locale('en', 'US');

  Future<void> loadTranslationsFiles() async {
    try {
      en = Map<String, String>.from(
          json.decode(await rootBundle.loadString('$i18n/en.json')));
      ar = Map<String, String>.from(
          json.decode(await rootBundle.loadString('$i18n/ar.json')));
    } catch (ex) {
      print(ex);
    }
  }

  @override
  Map<String, Map<String, String>> get keys => {
        englishKey: en,
        arabicKey: ar,
      };

  Future<void> changeLocale(String langCode) async {
    Logger().d("changeLocale - langCode: $langCode");
    settingsService.saveAppLang(langCode);
    //  settingsService.saveAppLang(langCode);
    Get.updateLocale(Locale(langCode));
  }

  String getCurrentLocal() {
    Logger().d("Get.locale: ${Get.locale.toString()}");
    return Get.locale.toString();
  }
}



class CupertinoLocalizationsDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const CupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => Get.find<SettingsService>().isArabic ;

  @override
  Future<CupertinoLocalizations> load(Locale locale) => ArabicCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(CupertinoLocalizationsDelegate old) => false;

  @override
  String toString() => 'DefaultCupertinoLocalizations.delegate($arabicKey)';
}

/// US English strings for the cupertino widgets.
class ArabicCupertinoLocalizations implements CupertinoLocalizations {
  /// Constructs an object that defines the cupertino widgets' localized strings
  /// for US English (only).
  ///
  /// [LocalizationsDelegate] implementations typically call the static [load]
  /// function, rather than constructing this class directly.
  const ArabicCupertinoLocalizations();

  static const List<String> _shortWeekdays = <String>[
    'السبت',
    'الاحد',
    'الاثنين',
    'الثلاثاء',
    'الاربعاء',
    'الخميس',
    'الجمعه',
  ];

  static const List<String> _shortMonths = <String>[
    'Jan',
    'Feb',
    'Mär',
    'Apr',
    'Mai',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Okt',
    'Nov',
    'Dez',
  ];

  static const List<String> _months = <String>[
    'يناير',
    'فبراير',
    'مارس',
    'ابريل',
    'مايو',
    'يونيو',
    'يوليو',
    'اغسطس',
    'سبتمبر',
    'اكتوبر',
    'نوفمبر',
    'ديسمبر',
  ];

  @override
  String datePickerYear(int yearIndex) => yearIndex.toString();

  @override
  String datePickerMonth(int monthIndex) => _months[monthIndex - 1];

  @override
  String datePickerDayOfMonth(int dayIndex) => dayIndex.toString();

  @override
  String datePickerHour(int hour) => hour.toString();

  @override
  String datePickerHourSemanticsLabel(int hour) => "$hour ساعه ";

  @override
  String datePickerMinute(int minute) => minute.toString().padLeft(2, '0');

  @override
  String datePickerMinuteSemanticsLabel(int minute) {
    if (minute == 1) {
      return '1 دقيقه';
    }
    return '$minute دقائق ';
  }

  @override
  String datePickerMediumDate(DateTime date) {
    return '${_shortWeekdays[date.weekday - DateTime.monday]} '
        '${_shortMonths[date.month - DateTime.january]} '
        '${date.day.toString().padRight(2)}';
  }

  @override
  DatePickerDateOrder get datePickerDateOrder => DatePickerDateOrder.mdy;

  @override
  DatePickerDateTimeOrder get datePickerDateTimeOrder => DatePickerDateTimeOrder.date_time_dayPeriod;

  @override
  String get anteMeridiemAbbreviation => 'AM';

  @override
  String get postMeridiemAbbreviation => 'PM';

  @override
  String get alertDialogLabel =>  throw UnimplementedError();

  @override
  String timerPickerHour(int hour) => hour.toString();

  @override
  String timerPickerMinute(int minute) => minute.toString();

  @override
  String timerPickerSecond(int second) => second.toString();

  @override
  String timerPickerHourLabel(int hour) => hour == 1 ? 'ساعه' : 'ساعات';

  @override
  String timerPickerMinuteLabel(int minute) => 'دقيقه';

  @override
  String timerPickerSecondLabel(int second) => 'ثانيه';

  @override
  String get cutButtonLabel =>  throw UnimplementedError();

  @override
  String get copyButtonLabel =>  throw UnimplementedError();

  @override
  String get pasteButtonLabel =>  throw UnimplementedError();

  @override
  String get selectAllButtonLabel =>  throw UnimplementedError();

  /// Creates an object that provides US English resource values for the
  /// cupertino library widgets.
  ///
  /// The [locale] parameter is ignored.
  ///
  /// This method is typically used to create a [LocalizationsDelegate].
  static Future<CupertinoLocalizations> load(Locale locale) {
    return SynchronousFuture<CupertinoLocalizations>(const ArabicCupertinoLocalizations());
  }

  /// A [LocalizationsDelegate] that uses [DefaultCupertinoLocalizations.load]
  /// to create an instance of this class.
  static const LocalizationsDelegate<CupertinoLocalizations> delegate = CupertinoLocalizationsDelegate();

  @override
  // TODO: implement modalBarrierDismissLabel
  String get modalBarrierDismissLabel => throw UnimplementedError();

  @override
  // TODO: implement searchTextFieldPlaceholderLabel
  String get searchTextFieldPlaceholderLabel => throw UnimplementedError();

  @override
  String tabSemanticsLabel({required int tabIndex, required int tabCount}) {
    // TODO: implement tabSemanticsLabel
    throw UnimplementedError();
  }

  @override
  // TODO: implement timerPickerHourLabels
  List<String> get timerPickerHourLabels => throw UnimplementedError();

  @override
  // TODO: implement timerPickerMinuteLabels
  List<String> get timerPickerMinuteLabels => throw UnimplementedError();

  @override
  // TODO: implement timerPickerSecondLabels
  List<String> get timerPickerSecondLabels => throw UnimplementedError();

  @override
  // TODO: implement todayLabel
  String get todayLabel => throw UnimplementedError();
}