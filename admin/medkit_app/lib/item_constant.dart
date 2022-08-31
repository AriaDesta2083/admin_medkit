import 'dart:math';

import 'package:flutter/material.dart';
import 'package:medkit_app/size_config.dart';

ImageLoadingBuilder loadingCircular =
    (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
  if (loadingProgress == null) return child;
  return Center(
    child: CircularProgressIndicator(
      value: loadingProgress.expectedTotalBytes != null
          ? loadingProgress.cumulativeBytesLoaded /
              loadingProgress.expectedTotalBytes!
          : null,
      color: kWhite,
    ),
  );
};

const kPrimaryColor = Color(0xFF2FDFA5);
// const kPrimaryColor = Color(0xFF5DC9FF);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kBlue = Color(0xFF5DC9FF);
const kOrange = Color(0xFFFEAD48);
const kPurple = Color(0xFF8BB1FE);
const kPink = Color(0xFFFF7AA6);
const kWhite = Color(0xFFFFFFFF);
const kBlack = Color(0xFF000000);
const kShadow = Color.fromARGB(137, 29, 28, 28);
const kGrey = Color(0XFF8B8B8B);

List<BoxShadow> shadowBOX = const [
  BoxShadow(
    color: Color.fromARGB(86, 192, 192, 192),
    spreadRadius: 5,
    blurRadius: 7,
    offset: Offset(0, 3), // changes position of shadow
  )
];
List<BoxShadow> shadowBOXtop = [
  BoxShadow(
      color: Color.fromARGB(128, 158, 158, 158),
      blurRadius: 5,
      spreadRadius: 0.1,
      offset: Offset(0, -5))
];
const kPrimaryGradientColor = SweepGradient(
  startAngle: -1,
  endAngle: 2 + 0.3,
  center: Alignment.bottomLeft,
  tileMode: TileMode.repeated,
  colors: [
    kPrimaryColor,
    Colors.white,
  ],
);

const kPrimaryGraColor = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomCenter,
  tileMode: TileMode.clamp,
  colors: [
    Colors.grey,
    kPrimaryColor,
  ],
);
const kOrangeGraColor = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomCenter,
  tileMode: TileMode.clamp,
  colors: [
    Colors.white70,
    kOrange,
  ],
);
const kBlueGraColor = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomCenter,
  tileMode: TileMode.clamp,
  colors: [
    Colors.white70,
    kBlue,
  ],
);
const kPurpleGraColor = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomCenter,
  tileMode: TileMode.clamp,
  colors: [
    Colors.white70,
    kPurple,
  ],
);
const kPinkGraColor = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomCenter,
  tileMode: TileMode.clamp,
  colors: [
    Colors.white70,
    kPink,
  ],
);

const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

final namaStyle = TextStyle(
  color: Colors.white,
  fontSize: getProportionateScreenWidth(20),
  fontWeight: FontWeight.bold,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

extension RandomStingItem on String {
  String randomItem() {
    return this[Random().nextInt(length)].trim();
  }
}

const String kUpdateData = "Data tidak boleh kosong";
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kPhoneNumberLength = "Your phone number to short";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 15),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: kTextColor),
  );
}
