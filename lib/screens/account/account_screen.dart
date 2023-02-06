import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/screens/account/account_screen_view_model.dart';
import 'package:ktv_app/screens/account/components/feed_back/feed_back_screen.dart';
import 'package:ktv_app/screens/account/components/invite_friend/invite_friend_screen.dart';
import 'package:ktv_app/screens/account/components/profile/profile_screen.dart';
import 'package:ktv_app/screens/account/components/security/security_screen.dart';
import 'package:ktv_app/screens/account/components/support/support_screen.dart';
import 'package:ktv_app/utility/text_style.dart';
import 'package:ktv_app/utility/widgets.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  final viewModel = Get.put(AccountScreenViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: defaultPaddin / 2),
              Padding(
                padding: const EdgeInsets.only(left: defaultPaddin),
                child: Text(
                  'Profile',
                  style: AppTextStyle.headline1,
                ),
              ),
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
              } else if (index == 6) {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => SimpleDialog(
                    title: Center(
                      child: Text(
                        'Language',
                        style: AppTextStyle.headline1.copyWith(
                          color: blackColor,
                        ),
                      ),
                    ),
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: defaultPaddin / 2,
                        ),
                        child: ListTile(
                          leading: Container(
                            width: 45,
                            height: 30,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(4),
                              image: const DecorationImage(
                                image: AssetImage(
                                  'assets/images/cambodia.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(
                            'Khmer',
                            style: AppTextStyle.headline2.copyWith(
                              color: blackColor,
                            ),
                          ),
                          trailing: const Icon(
                            Icons.check_circle_rounded,
                            color: primaryColor,
                          ),
                          onTap: () => Navigator.pop(context, 'Khmer'),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: defaultPaddin / 2,
                        ),
                        child: ListTile(
                          leading: Container(
                            width: 45,
                            height: 30,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(4),
                              image: const DecorationImage(
                                image: AssetImage(
                                  'assets/images/english.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(
                            'English',
                            style: AppTextStyle.headline2.copyWith(
                              color: blackColor,
                            ),
                          ),
                          trailing: const Icon(
                            Icons.check_circle_rounded,
                            color: primaryColor,
                          ),
                          onTap: () => Navigator.pop(context, 'English'),
                        ),
                      ),
                    ],
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
