import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  var sliderIndex = 0.obs;
  final CarouselController carouselController = CarouselController();

  final List<String> sliderImgList = [
    'assets/images/category_1.jpg',
    'assets/images/category_2.jpg',
    'assets/images/category_3.jpg',
    'assets/images/category_4.jpg',
    'assets/images/category_5.jpg',
    'assets/images/category_6.jpg',
  ];

  final List<String> categoryIconList = [
    'assets/icons/karaoke.svg',
    'assets/icons/steam.svg',
    'assets/icons/club.svg',
    'assets/icons/resturant.svg',
    'assets/icons/spa.svg',
  ];

    final List<String> categoryNameList = [
    'Karaoke',
    'Steam Sauna',
    'Club',
    'Resturant',
    'Spa',
  ];
}
