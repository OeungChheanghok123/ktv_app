import 'package:flutter/material.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/utility/text_style.dart';

class AppVersion {
  static Future buildVersion(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: bgColor,
        title: Text(
          'App Version',
          style: AppTextStyle.headline2,
        ),
        content: Text(
          "Your app is already up to date.",
          style: AppTextStyle.body,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: Text(
              'OK',
              style: AppTextStyle.body.copyWith(color: primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
