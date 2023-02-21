import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktv_app/api/home_api.dart';
import 'package:ktv_app/models/image_model.dart';
import 'package:ktv_app/models/post_model.dart';
import 'package:ktv_app/models/remote_data.dart';

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
    'Pub & Resturant',
    'Spa & Massage',
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

  var sliderImgList = <ImageModel>[].obs;
  var popularList = <PostModel>[].obs;
  var excellentService = <PostModel>[].obs;
  var specialDiscount = <PostModel>[].obs;
  var newArrived = <PostModel>[].obs;
  var sliderIndex = 0.obs;

  final _popularReportData = RemoteData<List<PostModel>>(
    status: RemoteDataStatus.processing,
    data: null,
  ).obs;
  RemoteData<List<PostModel>> get popularReportData => _popularReportData.value;

  @override
  void onInit() {
    loadHomeData();
    super.onInit();
  }

  void loadHomeData() async {
    try {
      final homeData = await HomeApi.loadHome();
      sliderImgList.value = homeData.sliderImage.map((e) => e).toList();
      popularList.value = homeData.popular.map((e) => e).toList();
      excellentService.value = homeData.excellentService.map((e) => e).toList();
      specialDiscount.value = homeData.specailDiscount.map((e) => e).toList();
      newArrived.value = homeData.newArrived.map((e) => e).toList();

      _popularReportData.value = RemoteData<List<PostModel>>(
        status: RemoteDataStatus.success,
        data: popularList,
      );
    } catch (ex) {
      debugPrint('Data: ERRORRRRRRRRRRRRRRRRRRR');
      _popularReportData.value = RemoteData<List<PostModel>>(
        status: RemoteDataStatus.error,
        data: null,
      );
    }
  }

  Future<Widget> wait3SecToLoadData() async {
    await Future.delayed(const Duration(seconds: 3));
    return Container();
  }
}
