import 'dart:io';

import 'package:flutter/material.dart';

import 'core/utils/myHTTPOverrides.dart';
import 'app/weatherApp.dart';

void main() {

  HttpOverrides.global = MyHttpOverrides();

  runApp(const WeatherApp());
}
