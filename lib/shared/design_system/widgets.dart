import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/shared/core/localization/string_keys.dart';
import 'package:weather_app/shared/design_system/assets.dart';
import 'package:weather_app/shared/design_system/colors.dart';
import 'package:weather_app/shared/constants/hero_tags.dart';

PreferredSize appBarDivider() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(1),
    child: buildDivider(),
  );
}

Divider buildDivider() {
  return const Divider(
    thickness: 1,
    height: 1,
    indent: 0,
    color: AppColors.lightGray_2,
  );
}

Hero appIcon({
  required double size,
}) {
  return Hero(
    tag: HeroTags.mainIcon,
    child: Image.asset(
      AppAssets.appIcon,
      height: size,
      width: size,
    ),
  );
}

Container buildNetworkImage(String? url, {bool isProgress = false}) {
  return Container(
    color: AppColors.black.withOpacity(0.03),
    child: url == null ? buildMediaErrorIcon() : url.isEmpty ? buildMediaErrorIcon() :
    Image.network(
      url,
      fit: BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return isProgress ? getProgress() : const Offstage();
      },
      errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
        return buildMediaErrorIcon();
      },
    ),
  );
}

Center buildMediaErrorIcon() {
  return const Center(
    child: Icon(Icons.error_outline),
  );
}

ColoredBox getProgress() {
  return ColoredBox(
    color: Get.theme.scaffoldBackgroundColor,
    child: Center(
      child: Platform.isIOS ? const CupertinoActivityIndicator() : const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.green),
      ),
    ),
  );
}

RefreshIndicator refreshIndicatorView({
  required Future<void> Function() onRefresh,
  required Widget child,
}) {
  return RefreshIndicator(
    color: AppColors.green,
    backgroundColor: AppColors.white,
    onRefresh: () => onRefresh(),
    child: SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Center(
          child: child,
        ),
      ),
    ),
  );
}

Widget somethingWentWrongView() {
  return Column(
    children: <Widget>[
      const Padding(
        padding: EdgeInsets.only(top: 100, bottom: 40),
        child: Icon(
          Icons.flutter_dash,
          color: AppColors.green,
          size: 180,
        ),
      ),
      Text(
        AppStringsKeys.somethingWentWrong.tr,
        style: Get.theme.textTheme.headline4,
      ),
    ],
  );
}

class PopUpModel {
  final String title;
  final Function func;

  PopUpModel({
    required this.title,
    required this.func,
  });
}
