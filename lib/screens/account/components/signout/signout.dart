import 'package:flutter/material.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/utility/text_style.dart';

class SignOut {
  static Future buildSignOut(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: bgColor,
        title: Text(
          'Sign Out',
          style: AppTextStyle.headline2,
        ),
        content: Text(
          "May you help confirm that you want",
          style: AppTextStyle.body,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: Text(
              'Cancel',
              style: AppTextStyle.body.copyWith(color: secondGraydColor),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'Sign Out'),
            child: Text(
              'Sign Out',
              style: AppTextStyle.body.copyWith(color: primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
