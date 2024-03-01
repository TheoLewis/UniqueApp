import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String shortLogoPath = 'assets/logos/shortLogoColor.svg';
String logoPath = 'assets/logos/logoColor.svg';

class Globals {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static String authKey = "";
  static ThemeMode themeMode = ThemeMode.dark;

  static Color primaryColor = const Color(0xFFF28020);
  static Color secondaryColor = const Color(0xFF616161);
  static Color accentColor = const Color(0xFFF28020);
  static Color backgroundColor = const Color(0xffEEEEEE);

  static int operatingSystemId = 0;
  static String operatingSystemVersion = "0";
  static String deviceModel = "";
  static String locale = "AU";
  static int softwareVersion = 1;

  static Gradient themeGradient = const LinearGradient(
    colors: [Color(0xffffa848), Color(0xffde6c0c)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static openAlert(Widget sheet, {required bool dismissable}) {
    showDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: dismissable,
      barrierColor: Colors.black12,
      builder: (BuildContext context) {
        return sheet;
      },
    );
  }

  static openSheet(dynamic sheet) {
    showModalBottomSheet(
      context: navigatorKey.currentContext!,
      isScrollControlled: true,
      isDismissible: true,
      barrierColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      builder: (BuildContext context) {
        return sheet;
      },
    );
  }

  static pop({int? count = 1}) {
    for (int i = 0; i < count!; i++) {
      Navigator.pop(Globals.navigatorKey.currentContext!);
    }
  }

  static String formatDateTime(String dateTimeString) {
    DateTime utcDateTime = DateTime.parse(dateTimeString).toUtc();
    DateTime localDateTime = utcDateTime.toLocal();
    DateFormat dateFormat = DateFormat('h:mm a dd/MM/yyyy');
    return dateFormat.format(localDateTime);
  }
}
