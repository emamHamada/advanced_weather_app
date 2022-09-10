
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/constants.dart';
import '../provider/MainScreenProvider.dart';

class CityInfoWidget extends StatelessWidget {
  const CityInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainScreenProvider>();
    final snapshot = model.forecastObject;
    var city = snapshot!.location?.name;
    var temp = snapshot.current?.tempC!.round();
    var feelTemp = snapshot.current?.feelslikeC;
    var windDegree = snapshot.current?.windDegree;
    var url =
        'https://${((snapshot.current!.condition!.icon).toString().substring(2)).replaceAll("64", "128")}';
    var condetion_discripe_word=snapshot.current!.condition!.text;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(url, scale: 1.2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // condetion text
            appText(
              size: 20,
              text: '$condetion_discripe_word',
              isBold: FontWeight.bold,
              color: darkGreyColor,
            ),
          ],
        ),
        const SizedBox(height: 8),
        //city+wind arrow
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appText(
              size: 30,
              text: '$city',
              isBold: FontWeight.bold,
              color: primaryColor,
            ),
            // wind arrow
            RotationTransition(
              turns: AlwaysStoppedAnimation(windDegree! / 360),
              child: const Icon(Icons.north, color: primaryColor),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appText(
              size: 70,
              text: '$temp°',
            ),
            appText(size: 20, text: '$feelTemp°', color: darkGreyColor),
          ],
        ),
      ],
    );
  }
}
