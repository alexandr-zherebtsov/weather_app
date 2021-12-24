import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/shared/constants/app_values.dart';
import 'package:weather_app/shared/core/localization/string_keys.dart';
import 'package:weather_app/shared/design_system/widgets.dart';
import 'package:weather_app/shared/utils/utils.dart';

PopupMenuButton<PopUpModel> buildMainPopUp(List<PopUpModel> popUpItems) {
  return PopupMenuButton<PopUpModel>(
    tooltip: AppStringsKeys.more.tr,
    padding: EdgeInsets.zero,
    icon: const Icon(Icons.more_vert),
    onSelected: (v) => v.func(),
    onCanceled: () => Get.focusScope!.unfocus(),
    itemBuilder: (_) {
      return popUpItems.map((PopUpModel e) {
        return PopupMenuItem<PopUpModel>(
          value: e,
          child: Text(e.title),
        );
      }).toList();
    },
  );
}

RichText buildTempText(double? temp) {
  return RichText(
    text: TextSpan(
      text: kelvinToCelsius(temp),
      style: Get.theme.textTheme.headline1,
      children: <TextSpan>[
        TextSpan(
          text: AppValues.symbolCelsius,
          style: Get.theme.textTheme.headline4,
        ),
      ],
    ),
  );
}

ClipRRect buildWeatherIcon(String? icon) {
  return ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(8)),
    child: SizedBox(
      width: 36,
      height: 36,
      child: buildNetworkImage(
        getWeatherImage(icon),
      ),
    ),
  );
}
