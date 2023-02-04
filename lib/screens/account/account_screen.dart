import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/screens/account/account_screen_view_model.dart';
import 'package:ktv_app/screens/account/components/feed_back/feed_back_screen.dart';
import 'package:ktv_app/screens/account/components/invite_friend/invite_friend_screen.dart';
import 'package:ktv_app/screens/account/components/security/security_screen.dart';
import 'package:ktv_app/screens/account/components/support/support_screen.dart';
import 'package:ktv_app/utility/text_style.dart';
import 'package:ktv_app/utility/widgets.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  final viewModel = Get.put(AccountScreenViewModel());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
        ),
        Positioned(
          bottom: 30,
          child: Container(
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
          ),
        ),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
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
        ],
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
            onTap: () {
              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecurityScreen(),
                  ),
                );
              } else if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InviteFriendScreen(),
                  ),
                );
              } else if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SupportScreen(),
                  ),
                );
              } else if (index == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FeedBackScreen(),
                  ),
                );
              }
            },
          );
        }),
      ),
    );
  }
}
