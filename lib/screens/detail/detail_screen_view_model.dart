import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreenViewModel extends GetxController {
  var menuIndex = 0.obs;
  var imageIndex = 0.obs;
  var favoriteIcon = false.obs;

  final CarouselController carouselController = CarouselController();

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
