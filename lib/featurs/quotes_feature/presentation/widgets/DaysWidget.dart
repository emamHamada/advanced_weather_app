
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/constants.dart';
import '../provider/MainScreenProvider.dart';

class DaysWidget extends StatelessWidget {
  const DaysWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainScreenProvider>();
    final snapshot = model.forecastObject;


    return Column(
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
                  text: " Days of week  ",
                  isBold: FontWeight.bold,
                ),

              ],
            ),
          ),
        ),

        SizedBox(
          height: 150,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, index) {
              return Container(
                margin: index == 0 ? const EdgeInsets.only(left: 20) : null,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          appText(
                            size: 14,
                            text: DateFormat('EEE')
                                .format(DateTime.fromMillisecondsSinceEpoch(int.tryParse(
                                "${snapshot!.forecast!.forecastday![index].dateEpoch! * 1000}")!,),),
                          ),
                          const SizedBox(width: 10),
                          appText(
                            size: 14,
                            text:
                            '${snapshot.forecast!.forecastday![index].day!.condition!.text}',
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Image.network(
                          'https://${(snapshot.forecast!.forecastday![index].day!.condition!.icon).toString().substring(2)}',
                          scale: 1),
                      const SizedBox(height: 5),
                      Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                        const SizedBox(width: 10),
                        appText(
                          size: 14,
                          text:
                          'min ${snapshot.forecast!.forecastday![index].day!.mintempC}°   -',
                        ),

                        const SizedBox(width: 10),
                        appText(
                          size: 14,
                          text:
                          'max ${snapshot.forecast!.forecastday![index].day!.maxtempC}°',
                        ),
                      ],)
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
