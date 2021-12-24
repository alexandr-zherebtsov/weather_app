import 'package:flutter/material.dart';
import 'package:weather_app/features/main/widgets/main_widgets.dart';

Row buildTempWidget({
  required double? temp,
  required String? description,
  required String? icon,
}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTempText(temp),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(description?? ''),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 14.0),
        child: buildWeatherIcon(icon),
      ),
    ],
  );
}
