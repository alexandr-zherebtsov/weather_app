import 'package:flutter/material.dart';
import 'package:get/get.dart';

Padding buildLocationWidget(String location) {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0, left: 16.0),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          child: Text(
            location,
            softWrap: true,
            style: Get.theme.textTheme.headline3,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Icon(Icons.location_pin),
        ),
      ],
    ),
  );
}
