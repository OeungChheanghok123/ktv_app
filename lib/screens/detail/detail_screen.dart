import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/screens/detail/detail_screen_view_model.dart';
import 'package:ktv_app/utility/app_bar.dart';
import 'package:ktv_app/utility/text_style.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key}) : super(key: key);

  final viewModel = Get.put(DetailScreenViewModel());

  Widget imagePost(BuildContext context) {
    return Container(
      height: 180,
      decoration: const BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(13),
          topRight: Radius.circular(13),
        ),
        image: DecorationImage(
          image: AssetImage('assets/images/category_1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget detailPost(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: defaultPaddin),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: defaultPaddin / 2),
              Text(
                'Best Star KTV (Toul Kok)',
                style: AppTextStyle.headline2,
              ),
              const SizedBox(height: defaultPaddin / 2),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.star,
                          color: primaryColor,
                          size: 21,
                        ),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '5',
                        style: AppTextStyle.body.copyWith(
                          color: secondGraydColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: defaultPaddin / 2),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.monetization_on,
                          color: primaryColor,
                          size: 21,
                        ),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        'From \$50/set',
                        style: AppTextStyle.body.copyWith(
                          color: secondGraydColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: defaultPaddin / 2),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.motorcycle,
                          color: primaryColor,
                          size: 21,
                        ),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '10-20min',
                        style: AppTextStyle.body.copyWith(
                          color: secondGraydColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: defaultPaddin,
              right: defaultPaddin / 2,
            ),
            child: Icon(Icons.favorite, color: primaryColor),
          ),
        ],
      ),
    );
  }

  Widget specialService(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(defaultPaddin),
      padding: const EdgeInsets.symmetric(vertical: defaultPaddin / 2),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: defaultPaddin / 2),
            child: Text(
              'Special Service',
              style: AppTextStyle.headline2.copyWith(
                color: primaryColor,
              ),
            ),
          ),
          const SizedBox(height: defaultPaddin / 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.hotel,
                    color: whiteColor,
                  ),
                  const SizedBox(width: defaultPaddin / 2),
                  Text(
                    'Hotel',
                    style: AppTextStyle.headline2,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.hot_tub,
                    color: whiteColor,
                  ),
                  const SizedBox(width: defaultPaddin / 2),
                  Text(
                    'Steam / Suana',
                    style: AppTextStyle.headline2,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.liquor,
                    color: whiteColor,
                  ),
                  const SizedBox(width: defaultPaddin / 2),
                  Text(
                    'Sky Bar',
                    style: AppTextStyle.headline2,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget gridViewMenuBar(BuildContext context) {
    final List<String> menuText = [
      "All Set",
      "Popular",
      "Discount",
    ];
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: defaultPaddin),
      color: bgColor,
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        physics: const BouncingScrollPhysics(),
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 3.5,
        children: List.generate(menuText.length, (index) {
          return Obx(() => InkWell(
                onTap: () {
                  viewModel.menuIndex.value = index;
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: index == viewModel.menuIndex.value
                        ? primaryColor
                        : secondColor,
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(
                      width: 2,
                      color: primaryColor,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      menuText[index],
                      style: AppTextStyle.headline2.copyWith(
                        color: index == viewModel.menuIndex.value
                            ? primaryGrayColor
                            : primaryColor,
                      ),
                    ),
                  ),
                ),
              ));
        }),
      ),
    );
  }

  Widget detailListView(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(defaultPaddin / 2),
          margin: const EdgeInsets.symmetric(horizontal: defaultPaddin),
          decoration: BoxDecoration(
            color: secondColor,
            borderRadius: BorderRadius.circular(13),
          ),
          child: Stack(
            children: [
              Row(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 125,
                        height: 85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/category_1.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _iconAndText(Icons.sports_bar, "ABC (1Box)"),
                          _iconAndText(Icons.chair, "Free Room"),
                          _iconAndText(Icons.restaurant, "Food 2"),
                          _iconAndText(Icons.groups, "4-6 Person"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Text(
                  '50\$',
                  style: AppTextStyle.headline1.copyWith(
                    color: primaryColor,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                    color: bgColor,
                    border: Border.all(
                      width: 2,
                      color: primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Center(
                    child: Text(
                      "Book Now",
                      style: AppTextStyle.headline2.copyWith(
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: defaultPaddin),
      ],
    );
  }

  PreferredSize _appBarWidget(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(440),
      child: Container(
        color: bgColor,
        child: Column(
          children: [
            AppBarWidget.simpleAppbarWidget(
              context,
              'Best Star KTV (Toul Kok)',
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: defaultPaddin),
              child: Stack(
                children: [
                  Container(
                    height: 320,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: secondColor,
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        imagePost(context),
                        detailPost(context),
                        specialService(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: defaultPaddin,
              color: bgColor,
            ),
            gridViewMenuBar(context),
          ],
        ),
      ),
    );
  }

  Widget _iconAndText(IconData iconData, String text) {
    return Row(
      children: [
        const SizedBox(width: defaultPaddin / 2),
        Icon(
          iconData,
          size: 21,
          color: primaryColor,
        ),
        const SizedBox(width: defaultPaddin / 2),
        Text(
          text,
          style: AppTextStyle.headline2,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: bgColor,
      appBar: _appBarWidget(context),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Scrollbar(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 25,
            itemBuilder: (context, index) {
              return detailListView(context);
            },
          ),
        ),
      ),
    );
  }
}
