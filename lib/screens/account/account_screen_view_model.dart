import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreenViewModel extends GetxController {
  final List<String> menuTitleList = [
    'Edit Profile',
    'Security',
    'Invite Friends',
    'Needs Support',
    'Feedback Us',
  ];

  final List<IconData> menuIconList = [
    Icons.account_circle,
    Icons.https,
    Icons.share,
    Icons.support_agent,
    Icons.try_sms_star,
  ];
}
