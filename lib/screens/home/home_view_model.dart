import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktv_app/api/home_api.dart';

class HomeViewModel extends GetxController {
  final CarouselController carouselController = CarouselController();

  final List<String> categoryIconList = [
    'assets/icons/karaoke.svg',
    'assets/icons/steam.svg',
    'assets/icons/club.svg',
    'assets/icons/resturant.svg',
    'assets/icons/spa.svg',
  ];

  final List<String> categoryNameList = [
    'Karaoke',
    'Steam & Sauna',
    'Club',
    'Resturant',
    'Spa',
  ];

  final List<String> countryFlagList = [
    'assets/images/china.png',
    'assets/images/japan.png',
    'assets/images/korean.png',
    'assets/images/vietnam.png',
    'assets/images/thailand.png',
    'assets/images/europe.png',
  ];

  final List<String> countryNameList = [
    'China',
    'Japan',
    'Korean',
    'Vietnam',
    'Thailand',
    'Europe',
  ];

  var sliderImgList = [].obs;
  var sliderIndex = 0.obs;

  @override
  void onInit() {
    loadSliderImage();
    super.onInit();
  }

  void loadSliderImage() async {
    try {
      final homeData = await HomeApi.loadHome();
      sliderImgList.value = homeData.sliderImage.map((e) => e.path).toList();
    } catch (ex) {
      debugPrint('Data: ERRORRRRRRRRRRRRRRRRRRR');
    }
  }

  void loadPostPopular() async {
    try {
      final homeData = await HomeApi.loadHome();
      sliderImgList.value = homeData.sliderImage.map((e) => e.path).toList();
    } catch (ex) {
      debugPrint('Data: ERRORRRRRRRRRRRRRRRRRRR');
    }
  }

  Future<Widget> wait3SecToLoadData() async {
    await Future.delayed(const Duration(seconds: 3));
    return Container();
  }
}
