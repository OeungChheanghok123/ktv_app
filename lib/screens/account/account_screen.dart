import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/screens/account/account_view_model.dart';
import 'package:ktv_app/screens/account/components/profile/profile_screen.dart';
import 'package:ktv_app/utility/text_style.dart';
import 'package:ktv_app/utility/widgets.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  final viewModel = Get.put(AccountViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: defaultPaddin * 4),
            Padding(
              padding: const EdgeInsets.only(left: defaultPaddin),
              child: Text('Profile', style: AppTextStyle.headline1),
            ),
            const SizedBox(height: defaultPaddin / 2),
            profileImage(
              context,
              name: 'Blang Vibol',
              number: '011355313',
            ),
            const SizedBox(height: defaultPaddin * 2),
            settingListView(context),
            const SizedBox(height: defaultPaddin * 4),
            signOutWidget(context),
            const SizedBox(height: defaultPaddin * 2),
          ],
        ),
      ),
    );
  }

  Widget profileImage(
    BuildContext context, {
    required String name,
    required String number,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: defaultPaddin),
      padding: const EdgeInsets.symmetric(
        vertical: defaultPaddin / 2,
        horizontal: defaultPaddin,
      ),
      decoration: BoxDecoration(
        color: secondColor,
        borderRadius: BorderRadius.circular(13),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileScreen(),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 60,
              height: 60,
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
            const SizedBox(width: defaultPaddin),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyle.headline1.copyWith(
                    color: whiteColor,
                  ),
                ),
                const SizedBox(height: defaultPaddin / 2),
                Text(
                  number,
                  style: AppTextStyle.headline2.copyWith(
                    color: secondGraydColor,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(right: defaultPaddin / 2),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: secondGraydColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget settingListView(BuildContext context) {
    var titleData = viewModel.menuTitleList;
    var iconData = viewModel.menuIconList;

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: defaultPaddin),
      padding: const EdgeInsets.all(defaultPaddin / 2),
      decoration: BoxDecoration(
        color: secondColor,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(viewModel.menuTitleList.length, (index) {
          return AppWidget.listTile(
            icon: iconData[index],
            title: titleData[index],
            underLine: index + 1 == titleData.length ? false : true,
            onTap: () => viewModel.menuSettingFunc(context, index),
          );
        }),
      ),
    );
  }

  Widget signOutWidget(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.logout_rounded,
            size: 21,
            color: secondGraydColor,
          ),
          const SizedBox(width: defaultPaddin / 2),
          Text(
            'Sign Out',
            style: AppTextStyle.headline2.copyWith(
              color: secondGraydColor,
            ),
          ),
        ],
      ),
    );
  }
}
