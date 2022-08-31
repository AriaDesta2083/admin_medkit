import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medkit_app/item_constant.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Poppins",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    textButtonTheme: textbtnTheme,
    timePickerTheme: timePickertheme,
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextButtonThemeData textbtnTheme = TextButtonThemeData(
  style: ButtonStyle(
    // backgroundColor: MaterialStateColor.resolveWith((states) => kPrimaryColor),
    foregroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
    // overlayColor: MaterialStateColor.resolveWith((states) => kPrimaryColor),
  ),
);

TimePickerThemeData timePickertheme = TimePickerThemeData(
  backgroundColor: Colors.transparent,
  hourMinuteShape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    side: BorderSide(color: kOrange, width: 4),
  ),
  dayPeriodBorderSide: const BorderSide(color: kOrange, width: 4),
  dayPeriodColor: Colors.blueGrey,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    side: BorderSide(color: kOrange, width: 4),
  ),
  dayPeriodTextColor: Colors.white,
  dayPeriodShape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    side: BorderSide(color: kOrange, width: 4),
  ),
  hourMinuteColor: MaterialStateColor.resolveWith((states) =>
      states.contains(MaterialState.selected)
          ? kOrange
          : Colors.blueGrey.shade800),
  hourMinuteTextColor: MaterialStateColor.resolveWith((states) =>
      states.contains(MaterialState.selected) ? Colors.white : kOrange),
  dialHandColor: Colors.blueGrey.shade700,
  dialBackgroundColor: Colors.blueGrey.shade800,
  hourMinuteTextStyle:
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  dayPeriodTextStyle:
      const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
  helpTextStyle: const TextStyle(
      fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
  inputDecorationTheme: const InputDecorationTheme(
    border: InputBorder.none,
    contentPadding: EdgeInsets.all(0),
  ),
  dialTextColor: MaterialStateColor.resolveWith((states) =>
      states.contains(MaterialState.selected) ? kOrange : Colors.white),
  entryModeIconColor: kOrange,
);

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: kTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: kPrimaryColor,
    shadowColor: const Color(0XFF8B8B8B),
    elevation: 0,
    iconTheme: const IconThemeData(color: kWhite),
    toolbarTextStyle: const TextTheme(
      headline6: TextStyle(color: kWhite, fontSize: 20),
    ).bodyText2,
    titleTextStyle: const TextTheme(
      headline6: TextStyle(color: kWhite, fontSize: 20),
    ).headline6,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  );
}
