import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreenViewModel extends GetxController {
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
}
