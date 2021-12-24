import 'dart:developer';

import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_app/shared/constants/app_values.dart';
import 'package:weather_app/shared/core/localization/string_keys.dart';

class AboutAppController extends GetxController {
  RxString version = ''.obs;
  late PackageInfo packageInfo;

  @override
  void onInit() async {
    super.onInit();
    getVersion();
  }

  void getVersion() async {
    try {
      packageInfo = await PackageInfo.fromPlatform();
      version(AppStringsKeys.version.tr + ' ' + packageInfo.version);
    } catch (e) {
      log(e.toString());
    }
  }

  void gitHubLaunch() async {
    if (!await launch(AppValues.gitHubUrl)) log('Could not launch ${AppValues.gitHubUrl}');
  }

  void flutterLaunch() async {
    if (!await launch(AppValues.flutterUrl)) log('Could not launch ${AppValues.flutterUrl}');
  }
}
