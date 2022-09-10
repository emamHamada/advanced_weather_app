import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'featurs/quotes_feature/presentation/screens/main_screen.dart';
import 'featurs/quotes_feature/presentation/screens/main_screen_model.dart';



class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ChangeNotifierProvider(
          create: (_) => MainScreenModel(),
          lazy: false,
          child: const MainScreenWidget(),
        ),
      ),
    );
  }
}
