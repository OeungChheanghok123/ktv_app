import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/screens/detail/detail_screen.dart';
import 'package:ktv_app/screens/home/components/view_all.dart';
import 'package:ktv_app/screens/home/home_view_model.dart';
import 'package:ktv_app/utility/text_style.dart';
import 'package:ktv_app/utility/widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final homeViewModel = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: defaultPaddin / 4),
          sliderImage(context),
          const SizedBox(height: defaultPaddin),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: defaultPaddin),
            child: Text(
              "Category",
              style: AppTextStyle.headline1,
            ),
          ),
          const SizedBox(height: defaultPaddin / 2),
          gridViewCatagory(context),
          const SizedBox(height: defaultPaddin / 2),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: defaultPaddin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Need a KTV that is open during the day?',
                  style: AppTextStyle.headline2.copyWith(
                    color: primaryColor,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: primaryColor,
                ),
              ],
            ),
          ),
          const SizedBox(height: defaultPaddin / 2),
          ViewAll(
            tilte: 'Popular',
            onPress: () {},
          ),
          popularListView(context),
          const SizedBox(height: defaultPaddin / 2),
          ViewAll(
            tilte: 'Excellent Service',
            onPress: () {},
          ),
          excellentServiceListView(context),
          const SizedBox(height: defaultPaddin / 2),
          ViewAll(
            tilte: 'Special Discount',
            onPress: () {},
          ),
          specialDiscountListView(context),
          const SizedBox(height: defaultPaddin),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: defaultPaddin),
            child: Text(
              "For Foreigners",
              style: AppTextStyle.headline1,
            ),
          ),
          const SizedBox(height: defaultPaddin / 2),
          gridViewCountryFlag(context),
          const SizedBox(height: defaultPaddin / 2),
          ViewAll(
            tilte: 'New Arrived',
            onPress: () {},
          ),
          newArrivedListView(context),
          const SizedBox(height: defaultPaddin),
        ],
      ),
    );
  }

  Widget sliderImage(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          carouselController: HomeViewModel().carouselController,
          options: CarouselOptions(
            height: 200.0,
            aspectRatio: 16 / 9,
            viewportFraction: 0.9,
            initialPage: 0,
            enableInfiniteScroll: true,
            disableCenter: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 10),
            autoPlayAnimationDuration: const Duration(seconds: 1),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.2,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              homeViewModel.sliderIndex.value = index;
            },
          ),
          items: homeViewModel.sliderImgList.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: secondGraydColor,
                    borderRadius: BorderRadius.circular(13),
                    image: DecorationImage(
                      image: AssetImage(i),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: homeViewModel.sliderImgList.asMap().entries.map((entry) {
            return Obx(
              () => GestureDetector(
                onTap: () =>
                    homeViewModel.carouselController.animateToPage(entry.key),
                child: Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(
                    vertical: defaultPaddin / 2,
                    horizontal: defaultPaddin / 4,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: homeViewModel.sliderIndex.value == entry.key
                        ? primaryColor
                        : secondGraydColor,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget gridViewCatagory(BuildContext context) {
    return Container(
      color: bgColor,
      child: GridView.count(
        crossAxisCount: 4,
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        physics: const BouncingScrollPhysics(),
        mainAxisSpacing: 15,
        crossAxisSpacing: 5,
        children: List.generate(homeViewModel.categoryIconList.length, (index) {
          return Column(
            children: [
              Container(
                height: 65,
                width: 65,
                padding: const EdgeInsets.all(defaultPaddin),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: secondColor,
                ),
                child: SvgPicture.asset(
                  homeViewModel.categoryIconList[index],
                  color: primaryColor,
                  height: 21,
                ),
              ),
              const SizedBox(height: defaultPaddin / 4),
              Text(
                homeViewModel.categoryNameList[index],
                style: AppTextStyle.headline2,
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget popularListView(BuildContext context) {
    return SizedBox(
      height: 207,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return AppWidget.largePost(
            context,
            onPress: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailScreen(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget excellentServiceListView(BuildContext context) {
    return SizedBox(
      height: 207,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return AppWidget.largePost(
            context,
            onPress: () {},
          );
        },
      ),
    );
  }

  Widget specialDiscountListView(BuildContext context) {
    return SizedBox(
      height: 207,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return AppWidget.largePost(
            context,
            onPress: () {},
          );
        },
      ),
    );
  }

  Widget gridViewCountryFlag(BuildContext context) {
    return Container(
      color: bgColor,
      margin: const EdgeInsets.symmetric(horizontal: defaultPaddin),
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        physics: const BouncingScrollPhysics(),
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 2,
        children: List.generate(homeViewModel.countryFlagList.length, (index) {
          return Container(
            height: 20,
            width: 100,
            decoration: BoxDecoration(
              color: secondColor,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 45,
                  height: 30,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                      image: AssetImage(
                        homeViewModel.countryFlagList[index],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  homeViewModel.countryNameList[index],
                  style: AppTextStyle.headline2.copyWith(
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget newArrivedListView(BuildContext context) {
    return SizedBox(
      height: 207,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return AppWidget.largePost(
            context,
            onPress: () {},
          );
        },
      ),
    );
  }
}
