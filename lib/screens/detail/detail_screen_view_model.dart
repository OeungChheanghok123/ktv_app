import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreenViewModel extends GetxController {
  var menuIndex = 0.obs;

  List<String> specialServiceTitleList = [
    'Hotel',
    'Steam / Suana',
    'Sky Bar',
  ];
  List<IconData> specialServiceIconList = [
    Icons.hotel,
    Icons.hot_tub,
    Icons.liquor,
  ];
}
