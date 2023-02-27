import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreenViewModel extends GetxController {
  var setIndex = 0.obs;
  var menuIndex = 0.obs;
  var imageIndex = 0.obs;
  var favoriteIcon = false.obs;
  var buttonClicked = false.obs;

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
