
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/constants.dart';
import '../provider/MainScreenProvider.dart';

class BarometerWidget extends StatelessWidget {
  const BarometerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainScreenProvider>();
    final snapshot = model.forecastObject;
    var temperature = snapshot!.current?.tempC;
    var humidity = snapshot.current?.humidity;
    var pressure = snapshot.current?.pressureMb;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: appText(
              size: 20,
              color: primaryColor.withOpacity(.8),
              text: 'Barometer',
              isBold: FontWeight.bold,
            ),
          ),
          Card(
            color: bgGreyColor,
            elevation: 0,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customListTile(
                    first: 'Temperature:',
                    second: ' $temperature °C',
                    icon: Icons.thermostat,
                    iconColor: Colors.orange,
                  ),
                  customListTile(
                    first: 'Humidity:',
                    second: ' $humidity %',
                    icon: Icons.water_drop_outlined,
                    iconColor: Colors.blueGrey,
                  ),
                  customListTile(
                    first: 'Pressure:',
                    second: ' $pressure hPa',
                    icon: Icons.speed,
                    iconColor: Colors.red[300]!,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
