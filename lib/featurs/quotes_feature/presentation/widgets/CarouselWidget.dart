
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/constants.dart';
import '../provider/MainScreenProvider.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainScreenProvider>();
    final snapshot = model.forecastObject;
    var  day =DateFormat('EEEE, MMM d, yyyy')
        .format(DateTime.fromMillisecondsSinceEpoch(int.tryParse(
        "${snapshot!.current!.lastUpdatedEpoch! * 1000}")!,),);

    // debugPrint(" =====================>${snapshot!.forecast?.forecastday?[0].hour?[1].tempC}");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(

              children: [
                appText(
                  size: 20,
                  color: primaryColor.withOpacity(.8),
                  text: day,
                  isBold: FontWeight.bold,
                ),

              ],
            ),
          ),
        ),

        SizedBox(
          height: 100,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 23,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, index) {
              return Container(
                margin: index == 0 ? const EdgeInsets.only(left: 20) : null,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [

                      const SizedBox(height: 10),
                      index < 11
                          ? appText(
                          size: 14,
                          text: '${index + 1} am',
                          color: primaryColor)
                          : index == 11
                          ? appText(
                          size: 14,
                          text: '${index + 1} pm',
                          color: primaryColor)
                          : appText(
                          size: 14,
                          text: '${index - 11} pm',
                          color: primaryColor),
                      const SizedBox(height: 10),
                      Image.network(
                          'https://${(snapshot.forecast!.forecastday![0].hour![index].condition!.icon).toString().substring(2)}',
                          scale: 2),
                      const SizedBox(height: 5),
                      appText(
                        size: 14,
                        text:
                        '${snapshot.forecast!.forecastday![0].hour![index].tempC}°',
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
