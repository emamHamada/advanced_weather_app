
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../featurs/quotes_feature/presentation/screens/MainScreen.dart';
import '../featurs/quotes_feature/presentation/provider/MainScreenProvider.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ChangeNotifierProvider(
          create: (_) => MainScreenProvider(),
          lazy: false,
          child: const MainScreenWidget(),
        ),
      ),
    );
  }
}
