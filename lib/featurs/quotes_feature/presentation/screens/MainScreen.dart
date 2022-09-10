import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/constants.dart';
import '../../data/models/weather_model.dart';
import '../provider/MainScreenProvider.dart';
import '../widgets/BarometerWidget.dart';
import '../widgets/CarouselWidget.dart';
import '../widgets/CityInfoWidget.dart';
import '../widgets/DaysWidget.dart';
import '../widgets/HeaderWidget.dart';
import '../widgets/WindWidget.dart';

class MainScreenWidget extends StatelessWidget {
  const MainScreenWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = context.watch<MainScreenProvider>();
    final GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      drawer:  const Drawer(),
      backgroundColor: Colors.white,
      body:
          model.forecastObject?.location?.name != null && model.loading == false
              ? _ViewWidget()
              : const Center(
                  child: SpinKitCubeGrid(color: Colors.blue, size: 80),
                ),
    );
  }
}

class _ViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.read<MainScreenProvider>();

    return SafeArea(
      child: Stack(
        children: [
          model.forecastObject!.location!.name != 'Null'
              ? SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        SizedBox(height: 70),
                        CityInfoWidget(),
                        SizedBox(height: 15),
                        CarouselWidget(),
                        SizedBox(height: 15),
                        DaysWidget(),
                        SizedBox(height: 15),
                        WindWidget(),
                        SizedBox(height: 15),
                        BarometerWidget(),

                      ]),
                )
              : Center(
                  child: appText(size: 16, text: 'Произошла ошибка'),
                ),
          const HeaderWidget(),
        ],
      ),
    );
  }
}
