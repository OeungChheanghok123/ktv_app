import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/screens/detail/view_set/view_set_view_model.dart';
import 'package:ktv_app/screens/home/home_view_model.dart';
import 'package:ktv_app/utility/app_bar.dart';
import 'package:ktv_app/utility/text_style.dart';
import 'package:ktv_app/utility/widgets.dart';

class ViewSet extends StatelessWidget {
  final int selectedIndex;
  ViewSet({super.key, required this.selectedIndex});

  final viewModel = Get.put(ViewSetViewModel());
  final homeViewModel = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBarWidget.simpleAppbarWidget(
        context,
        homeViewModel.popularList[homeViewModel.postIndex.value]
            .itemSet![selectedIndex].title,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            setImage(context),
            offering(context),
            specialInstruction(context),
            time(context),
          ],
        ),
      ),
    );
  }

  Widget setImage(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      margin: const EdgeInsets.symmetric(
        horizontal: defaultPaddin,
        vertical: defaultPaddin / 2,
      ),
      decoration: const BoxDecoration(
        color: secondColor,
        borderRadius: BorderRadius.all(Radius.circular(13)),
      ),
      child: Column(
        children: [
          Container(
            height: 160,
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
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: defaultPaddin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    homeViewModel.popularList[homeViewModel.postIndex.value]
                        .itemSet![selectedIndex].title,
                    style: AppTextStyle.headline2,
                  ),
                  Text(
                    'Price \$${homeViewModel.popularList[homeViewModel.postIndex.value].itemSet![selectedIndex].price}',
                    style: AppTextStyle.headline2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget offering(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: defaultPaddin,
        vertical: defaultPaddin / 2,
      ),
      decoration: BoxDecoration(
        color: secondColor,
        borderRadius: BorderRadius.circular(13),
      ),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(defaultPaddin),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Text(
            "Offering",
            style: AppTextStyle.headline2,
          ),
          const SizedBox(height: defaultPaddin / 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPaddin / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildIconText(Icons.sports_bar, "ABC (1 Box)"),
                _buildIconText(Icons.restaurant, "2 Menu"),
                _buildIconText(Icons.local_gas_station, "2hour"),
                _buildIconText(Icons.people_alt_rounded, "4-6"),
              ],
            ),
          ),
          const SizedBox(height: defaultPaddin),
          Text(
            "Remarks",
            style: AppTextStyle.headline2,
          ),
          const SizedBox(height: defaultPaddin / 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPaddin / 2),
            child: Text(
              "WiFi is available in all areas and is free of charge, and Room has Air conditioning.",
              style: AppTextStyle.headline2,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }

  Widget specialInstruction(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: defaultPaddin,
        vertical: defaultPaddin / 2,
      ),
      decoration: BoxDecoration(
        color: secondColor,
        borderRadius: BorderRadius.circular(13),
      ),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(defaultPaddin),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Text(
            "Specail Instructions",
            style: AppTextStyle.headline2,
          ),
          const SizedBox(height: defaultPaddin / 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPaddin / 2),
            child: Text(
              "Please let me know if you have anything to add more.",
              style: AppTextStyle.headline2,
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(height: defaultPaddin / 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPaddin / 2),
            child: AppWidget.textField(
              context,
              viewModel.controller,
              borderRadius: defaultPaddin / 2,
              maxLength: 200,
              maxLine: 5,
            ),
          ),
        ],
      ),
    );
  }

  Widget time(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: defaultPaddin,
        vertical: defaultPaddin / 2,
      ),
      decoration: BoxDecoration(
        color: secondColor,
        borderRadius: BorderRadius.circular(13),
      ),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(defaultPaddin),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Text(
            "Time",
            style: AppTextStyle.headline2,
          ),
          const SizedBox(height: defaultPaddin / 2),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: defaultPaddin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Start',
                  style: AppTextStyle.headline2,
                ),
                const SizedBox(width: defaultPaddin),
                Text(
                  '10:30PM',
                  style: AppTextStyle.headline2,
                ),
                const SizedBox(width: defaultPaddin * 2),
                Text(
                  'To',
                  style: AppTextStyle.headline2,
                ),
                const SizedBox(width: defaultPaddin),
                Text(
                  '12:30AM',
                  style: AppTextStyle.headline2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconText(IconData iconData, String text) {
    return Row(
      children: [
        Icon(
          iconData,
          color: whiteColor,
          size: 16,
        ),
        const SizedBox(width: 3),
        Text(
          text,
          style: AppTextStyle.headline2,
        ),
      ],
    );
  }
}
