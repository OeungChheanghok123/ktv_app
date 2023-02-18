import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/screens/detail/detail_screen_view_model.dart';
import 'package:ktv_app/screens/home/components/view_all.dart';
import 'package:ktv_app/utility/app_bar.dart';
import 'package:ktv_app/utility/text_style.dart';
import 'package:ktv_app/utility/widgets.dart';

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
              _iconAndText(Icons.two_wheeler, '10-20min'),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonBooking(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPaddin),
      margin: const EdgeInsets.symmetric(horizontal: defaultPaddin),
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

  Widget description(BuildContext context) {
    return Container(
      color: secondColor,
      padding: const EdgeInsets.all(defaultPaddin),
      margin: const EdgeInsets.only(top: defaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: AppTextStyle.headline2,
          ),
          const SizedBox(height: defaultPaddin / 2),
          Text(
            'G Mekong Hotel features a rooftop swimming pool and a spa centre. Guests can enjoy meals at the in-house restaurant or have a drink at the bar. Freee WIFI is available in public areas. Tuol Sleng Genocide Museum is about 5 minutes and king Palace...',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
            style: AppTextStyle.title2,
          ),
          const SizedBox(height: defaultPaddin / 2),
          Text(
            'Read more',
            textAlign: TextAlign.justify,
            style: AppTextStyle.title2.copyWith(
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget specialService(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(defaultPaddin),
      margin: const EdgeInsets.symmetric(vertical: defaultPaddin / 2),
      color: secondColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Special Service',
            style: AppTextStyle.headline2,
          ),
          const SizedBox(height: defaultPaddin / 2),
          Container(
            padding: const EdgeInsets.only(left: defaultPaddin / 6),
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              padding: const EdgeInsets.all(0),
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 15,
              mainAxisSpacing: 5,
              childAspectRatio: 8,
              children: List.generate(
                viewModel.specialServiceIconList.length,
                (index) => Container(
                  alignment: Alignment.topLeft,
                  child: _iconAndText(
                    viewModel.specialServiceIconList[index],
                    viewModel.specialServiceTitleList[index],
                    color: whiteColor,
                  ),
                ),
              ),
            ),
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
      margin: const EdgeInsets.symmetric(
        horizontal: defaultPaddin,
        vertical: defaultPaddin / 2,
      ),
      decoration: BoxDecoration(
        color: secondColor,
        borderRadius: BorderRadius.circular(13),
      ),
      child: GridView.count(
        crossAxisCount: menuText.length,
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        physics: const BouncingScrollPhysics(),
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 3.5,
        children: List.generate(
          menuText.length,
          (index) {
            return Obx(
              () => InkWell(
                onTap: () => viewModel.menuIndex.value = index,
                child: Container(
                  decoration: BoxDecoration(
                    color: index == viewModel.menuIndex.value
                        ? primaryColor
                        : secondColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 2,
                      color: noneColor,
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
              ),
            );
          },
        ),
      ),
    );
  }

  Widget detailListView(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 15,
      itemBuilder: (context, index) {
        return _detailListViewItems(context);
      },
    );
  }

  Widget similarListView(BuildContext context) {
    return Column(
      children: [
        ViewAll(
          tilte: 'Similar',
          onPress: () {},
        ),
        SizedBox(
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
        ),
      ],
    );
  }

  Widget _detailListViewItems(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: defaultPaddin,
        vertical: defaultPaddin / 2,
      ),
      decoration: BoxDecoration(
        color: secondColor,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.all(defaultPaddin / 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/category_1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(defaultPaddin / 2),
                  padding: const EdgeInsets.only(right: defaultPaddin / 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Set Size L',
                            style: AppTextStyle.headline2.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(width: defaultPaddin / 2),
                          Container(
                            padding: const EdgeInsets.all(defaultPaddin / 4),
                            decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.whatshot,
                                  size: 13,
                                  color: secondGraydColor,
                                ),
                                const SizedBox(width: defaultPaddin / 6),
                                Text(
                                  'Popular',
                                  style: AppTextStyle.headline2.copyWith(
                                    color: secondGraydColor,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: defaultPaddin / 4),
                      Text(
                        'For those seeking a premium KTV experience in Phnom Penh. the ultimate location for a night of singing and partying while enjoying the privacy of our karaoke rooms have to offer.',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        style: AppTextStyle.body.copyWith(
                          color: secondGraydColor,
                        ),
                      ),
                      const SizedBox(height: defaultPaddin),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(
                            style: AppTextStyle.headline2,
                            const TextSpan(
                              children: [
                                TextSpan(
                                  text: '\$25.00',
                                ),
                                WidgetSpan(
                                  child: SizedBox(width: defaultPaddin / 4),
                                ),
                                TextSpan(
                                  text: '\$35.00',
                                  style: TextStyle(
                                    color: secondGraydColor,
                                    decorationThickness: 2,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: secondGraydColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: bgColor,
                              border: Border.all(
                                width: 2,
                                color: bgColor,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                color: whiteColor,
                                size: 21,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 45,
              height: 25,
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Center(
                child: Text('50%', style: AppTextStyle.headline2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconAndText(
    IconData iconData,
    String text, {
    Color color = secondGraydColor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        color == secondGraydColor
            ? const SizedBox(width: defaultPaddin / 2)
            : const SizedBox.shrink(),
        Icon(
          iconData,
          size: 21,
          color: color,
        ),
        const SizedBox(width: defaultPaddin / 2),
        Text(
          text,
          style: AppTextStyle.headline2.copyWith(
            color: color,
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
              description(context),
              specialService(context),
              gridViewMenuBar(context),
              detailListView(context),
              similarListView(context),
            ],
          ),
        ),
      ),
    );
  }
}
