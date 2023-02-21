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

  List<Map<String, int>> orderList = [];

  void createOrder(String id) {
    if (orderList.isNotEmpty) {
      for (var data in orderList) {
        data.forEach((key, value) {
          if (key == id) {
            data.update(key, (v) => v = v + 1);
          } else {
            orderList.add({id: 1});
          }
        });
      }
    } else {
      orderList.add({id: 1});
    }
  }
}
