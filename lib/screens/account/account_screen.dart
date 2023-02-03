import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/screens/account/account_screen_view_model.dart';
import 'package:ktv_app/utility/text_style.dart';
import 'package:ktv_app/utility/widgets.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  final viewModel = Get.put(AccountScreenViewModel());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: defaultPaddin / 2),
        profileImage(
          context,
          name: 'Blang Vibol',
          number: '011355313',
        ),
        const SizedBox(height: defaultPaddin * 2),
        settingListView(context),
      ],
    );
  }

  Widget profileImage(
    BuildContext context, {
    required String name,
    required String number,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: defaultPaddin * 4),
      padding: const EdgeInsets.symmetric(vertical: defaultPaddin),
      decoration: BoxDecoration(
        color: secondColor,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(100),
              image: const DecorationImage(
                image: AssetImage(
                  "assets/images/map_currentLocation.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: defaultPaddin / 2),
          Text(
            name,
            style: AppTextStyle.headline1.copyWith(
              color: primaryColor,
            ),
          ),
          const SizedBox(height: defaultPaddin / 2),
          Text(
            number,
            style: AppTextStyle.headline2.copyWith(
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget settingListView(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: defaultPaddin),
      padding: const EdgeInsets.all(defaultPaddin / 2),
      decoration: BoxDecoration(
        color: secondColor,
        borderRadius: BorderRadius.circular(13),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(0),
        itemCount: viewModel.settingTitleList.length,
        itemBuilder: (context, index) {
          return AppWidget.listTile(
            icon: viewModel.settingIconList[index],
            title: viewModel.settingTitleList[index],
            underLine:
                index + 1 == viewModel.settingTitleList.length ? false : true,
            onTap: () {},
          );
        },
      ),
    );
  }
}
