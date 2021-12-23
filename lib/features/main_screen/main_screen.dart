import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/features/main_screen/widgets/day_hourly_weather_view.dart';
import 'package:weather_app/features/main_screen/main_controller.dart';
import 'package:weather_app/features/main_screen/widgets/location_widget.dart';
import 'package:weather_app/features/main_screen/widgets/main_widgets.dart';
import 'package:weather_app/features/main_screen/widgets/temp_widget.dart';
import 'package:weather_app/features/main_screen/widgets/time_widget.dart';
import 'package:weather_app/shared/core/localization/string_keys.dart';
import 'package:weather_app/shared/design_system/widgets.dart';
import 'package:weather_app/shared/utils/utils.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (MainController controller) {
        return controller.screenLoader ? getProgress() : Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: GestureDetector(
                onTap: () => controller.navToAboutAs(),
                child: appIcon(size: 30),
              ),
            ),
            title: Text(AppStringsKeys.appName.tr),
            actions: controller.screenError ? null : <Widget>[
              buildMainPopUp(controller.popUpItems),
            ],
            bottom: appBarDivider(),
          ),
          body: refreshIndicatorView(
            onRefresh: () => controller.refreshScreen(),
            child: controller.screenError ? somethingWentWrongView() : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildLocationWidget(
                  getClearName(
                    controller.location!.city,
                    controller.location!.country,
                    comma: true,
                  ),
                ),
                buildTimeWidget(controller.weather?.current?.dt),
                buildTempWidget(
                  temp: controller.weather?.current?.temp,
                  description: controller.weather?.current?.weather?[0].description,
                  icon: controller.weather?.current?.weather?[0].icon,
                ),
                buildDayHourlyWeatherView(
                  viewIndex: controller.viewIndex,
                  weatherHourly: controller.weather?.hourly?? [],
                  weatherByDay: controller.weather?.daily?? [],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
