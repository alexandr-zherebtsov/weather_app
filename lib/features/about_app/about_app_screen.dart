import 'package:flutter/material.dart';
import 'package:weather_app/features/about_app/about_app_controller.dart';
import 'package:weather_app/shared/core/localization/string_keys.dart';
import 'package:get/get.dart';
import 'package:weather_app/shared/design_system/widgets.dart';

class AboutAppScreen extends GetView<AboutAppController> {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStringsKeys.aboutApp.tr),
        bottom: appBarDivider(),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Text(
                  AppStringsKeys.appName.tr,
                  style: Get.theme.textTheme.headline2,
                ),
              ),
              appIcon(size: 200),
              Padding(
                padding: const EdgeInsets.only(top: 60.0, bottom: 6.0),
                child: Text(
                  AppStringsKeys.createdBy.tr,
                  style: Get.theme.textTheme.bodyText1,
                ),
              ),
              GestureDetector(
                child: Text(
                  AppStringsKeys.author.tr,
                  style: Get.theme.textTheme.headline4,
                ),
                onTap: () => controller.gitHubLaunch(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 30.0),
                child: GestureDetector(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        AppStringsKeys.usingFlutter.tr,
                        style: Get.theme.textTheme.bodyText1,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: FlutterLogo(size: 24),
                      ),
                    ],
                  ),
                  onTap: () => controller.flutterLaunch(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Obx(() => Text(
                  controller.version.value,
                  style: Get.theme.textTheme.bodyText1,
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
