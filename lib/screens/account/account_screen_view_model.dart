import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktv_app/screens/account/components/feed_back/feed_back_screen.dart';
import 'package:ktv_app/screens/account/components/invite_friend/invite_friend_screen.dart';
import 'package:ktv_app/screens/account/components/language/language.dart';
import 'package:ktv_app/screens/account/components/security/security_screen.dart';
import 'package:ktv_app/screens/account/components/support/support_screen.dart';

class AccountScreenViewModel extends GetxController {
  final List<String> languageList = [
    "Khmer",
    "English",
  ];

  final List<String> langeImageList = [
    "assets/images/cambodia.png",
    "assets/images/english.png",
  ];

  final List<String> menuTitleList = [
    'Security',
    'Invite Friends',
    'Needs Support',
    'Feedback Us',
    'Privacy Policy',
    'FAQ',
    'Language',
    'App Version'
  ];

  final List<IconData> menuIconList = [
    Icons.https,
    Icons.share,
    Icons.support_agent,
    Icons.rate_review_rounded,
    Icons.security_rounded,
    Icons.question_answer,
    Icons.language_rounded,
    Icons.info_rounded,
  ];

  void menuSettingFunc(BuildContext context, int index) {
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
      Language.buildLanguage(context);
    }
  }
}
