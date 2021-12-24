import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/shared/utils/utils.dart';

Widget buildTimeWidget(int? time) {
  return Padding(
    padding: const EdgeInsets.only(left: 16.0, top: 6.0),
    child: Text(
      getDayAndMonth(time),
      softWrap: true,
      style: Get.theme.textTheme.bodyText1,
    ),
  );
}