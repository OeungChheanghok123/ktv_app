import 'package:flutter/material.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/utility/app_bar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBarWidget.simpleAppbarWidget(context, 'Privacy Policy'),
      ),
    );
  }
}
