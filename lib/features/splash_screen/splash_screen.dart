import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/features/splash_screen/splash_controller.dart';
import 'package:weather_app/shared/design_system/widgets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (SplashController controller) {
        return Scaffold(
          body: Center(
            child: appIcon(size: 240),
          ),
        );
      },
    );
  }
}
