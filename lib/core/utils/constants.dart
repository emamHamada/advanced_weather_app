// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const primaryColor = Color(0xff2c2c2c);
const blackColor = Colors.black;
const whiteColor = Colors.white;
const greyColor = Color(0xffc4c4c4);
const bgGreyColor = Color(0xfffdfcfc);
const darkGreyColor = Color(0xff9a9a9a);

// custom Text Widget
Widget appText(
    {FontWeight isBold = FontWeight.normal,
    Color color = blackColor,
    required double size,
    required String text,
    int maxLines = 0,
    bool overflow = false,
    bool alignCenter = false}) {
  return Text(
    text,
    textAlign: alignCenter == true ? TextAlign.center : null,
    maxLines: maxLines == 0 ? null : maxLines,
    overflow: overflow == true ? TextOverflow.ellipsis : null,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: isBold,
    ),
  );
}

// for displaying snackbars
showSnackBar(BuildContext context, String text, {Color color = primaryColor}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      elevation: 3,
      content: Text(text, textAlign: TextAlign.center),
    ),
  );
}

// Custom ListTile for MainScreen
Widget customListTile({
   String? first,
   String? second,
   IconData? icon,
   Color? iconColor,
  String text = '',
}) {
  return ListTile(
    trailing: appText(size: 16, text: text, color: darkGreyColor),
    leading: Icon(icon, color: iconColor),
    title: RichText(
      maxLines: 1,
      text: TextSpan(
        children: [
          TextSpan(
            text: first,
            style: const TextStyle(
              color: darkGreyColor,
              fontSize: 16,
            ),
          ),
          TextSpan(
            text: second,
            style: const TextStyle(
              color: primaryColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    ),
  );
}

// API

// http://api.weatherapi.com/v1/forecast.json?key=13843be3964649e08d450720221009&q=Vladivostok&days=1&aqi=no&alerts=no

class Constants {
  static const String WEATHER_APP_ID = '13843be3964649e08d450720221009';
  static const String WEATHER_BASE_SCHEME = 'https://';
  static const String WEATHER_BASE_URL_DOMAIN = 'api.weatherapi.com';
  static const String WEATHER_FORECAST_PATH = '/v1/forecast.json';
}




/////////////////////////////


final cardColor = Color(0xff4884EE);
final nextCardColor = Color(0xff06BCFB);
final cardBorderGlow = Color(0xff1FD1F9);
final backgroundColor = Color(0xff171717);
final cardBorder = Color(0xff2B2B2B);
const textColor = Color(0xfffdfcfa);
const secondaryTextColor = Color(0xff808080);
const secondaryTextColor2 = Color(0xffdbdbdb);

final degree = "°";
const devImg = "assets/me.jpg";

//------- Height and Width-----
extension MediaQueryValues on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

const DaysTextStyle = TextStyle(
  fontWeight: FontWeight.w600,
  color: textColor,
);

const SecondaryTextStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: secondaryTextColor,
);

const smallCardPrimaryText = TextStyle(
  fontWeight: FontWeight.bold,
  color: textColor,
);