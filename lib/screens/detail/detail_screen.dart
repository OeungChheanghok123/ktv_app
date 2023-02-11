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
    return Stack(
      children: [
        Container(
          height: 220,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: primaryColor,
            image: DecorationImage(
              image: AssetImage('assets/images/category_1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          child: Center(
            child: Container(
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                color: secondGraydColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(3),
                  bottomRight: Radius.circular(3),
                ),
              ),
              width: 40,
              height: 40,
              child: const Center(
                child: Icon(
                  Icons.arrow_back_rounded,
                  size: 28,
                  color: secondColor,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: Center(
            child: Container(
              alignment: Alignment.centerRight,
              decoration: const BoxDecoration(
                color: secondGraydColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(3),
                  bottomLeft: Radius.circular(3),
                ),
              ),
              width: 40,
              height: 40,
              child: const Center(
                child: Icon(
                  Icons.arrow_forward_rounded,
                  size: 28,
                  color: secondColor,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          right: 5,
          child: Container(
            width: 55,
            height: 35,
            decoration: BoxDecoration(
              color: whiteColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '1/',
                  style: AppTextStyle.title2.copyWith(
                    letterSpacing: 3,
                  ),
                ),
                Text(
                  '12',
                  style: AppTextStyle.title2,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buttonBooking(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPaddin),
      margin: const EdgeInsets.all(defaultPaddin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: primaryColor,
      ),
      child: Center(
        child: Text(
          'Book Now',
          style: AppTextStyle.headline2,
        ),
      ),
    );
  }

  Widget detailPost(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: defaultPaddin / 2),
      padding: const EdgeInsets.symmetric(horizontal: defaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPaddin / 2,
                  vertical: defaultPaddin / 4,
                ),
                decoration: BoxDecoration(
                  color: secondColor,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Text(
                  'KTV',
                  style: AppTextStyle.title2,
                ),
              ),
              const SizedBox(width: defaultPaddin / 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => const Icon(
                    Icons.star,
                    color: primaryColor,
                    size: 18,
                  ),
                ),
              ),
              const SizedBox(width: defaultPaddin / 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.two_wheeler,
                    color: secondGraydColor,
                    size: 21,
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
              const Spacer(),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.favorite_border_rounded,
                  color: secondGraydColor,
                  size: 28,
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultPaddin / 2),
          Text(
            'Best Star KTV (Toul Kok)',
            style: AppTextStyle.headline1,
          ),
          const SizedBox(height: defaultPaddin / 4),
          Text.rich(
            textAlign: TextAlign.justify,
            TextSpan(
              children: [
                const WidgetSpan(
                  child: Icon(
                    Icons.location_on_rounded,
                    color: primaryColor,
                    size: 16,
                  ),
                ),
                TextSpan(
                  text:
                      ' No 149, Preah Monivong Boulevard, Khan 7 Makara (Orussey Market Area), Phnom Penh',
                  style: AppTextStyle.body,
                )
              ],
            ),
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
          const SizedBox(height: defaultPaddin / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.hotel,
                    color: whiteColor,
                    size: 21,
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
                    size: 21,
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
                    size: 21,
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
                      color: index == viewModel.menuIndex.value
                          ? primaryColor
                          : secondGraydColor,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      menuText[index],
                      style: AppTextStyle.headline2.copyWith(
                        color: index == viewModel.menuIndex.value
                            ? whiteColor
                            : secondGraydColor,
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
                    color: whiteColor,
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

  Widget _iconAndText(IconData iconData, String text) {
    return Row(
      children: [
        const SizedBox(width: defaultPaddin / 2),
        Icon(
          iconData,
          size: 21,
          color: secondGraydColor,
        ),
        const SizedBox(width: defaultPaddin / 2),
        Text(
          text,
          style: AppTextStyle.headline2.copyWith(
            color: secondGraydColor,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: bgColor,
      appBar: AppBarWidget.simpleAppbarWidget(
        context,
        'Best Star KTV (Toul Kok)',
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: RawScrollbar(
          thumbVisibility: false,
          scrollbarOrientation: ScrollbarOrientation.right,
          thumbColor: secondColor,
          radius: const Radius.circular(20),
          thickness: 5,
          child: ListView(
            children: [
              imagePost(context),
              detailPost(context),
              buttonBooking(context),
              specialService(context),
              Container(
                height: defaultPaddin,
                color: bgColor,
              ),
              gridViewMenuBar(context),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 25,
                itemBuilder: (context, index) {
                  return detailListView(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
