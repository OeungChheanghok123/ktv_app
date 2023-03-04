import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/utility/text_style.dart';

var _khLanguage = false.obs;
var _engLanguage = true.obs;

Widget _languageWidget(
  BuildContext context, {
  required String image,
  required String title,
  required Color trailingColor,
  required int index,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: defaultPaddin / 2),
    child: ListTile(
      leading: Container(
        width: 45,
        height: 30,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(4),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        title,
        style: AppTextStyle.body,
      ),
      trailing: Icon(
        Icons.check_circle_rounded,
        color: trailingColor,
      ),
      onTap: () {
        if (index == 0) {
          _khLanguage.value = true;
          _engLanguage.value = false;
          _buildConfirmDialog(context);
        } else {
          _khLanguage.value = false;
          _engLanguage.value = true;
          _buildConfirmDialog(context);
        }
      },
    ),
  );
}

Future _buildConfirmDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      backgroundColor: bgColor,
      content: Text(
        "Are you sure?",
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
            'Confirm',
            style: AppTextStyle.body.copyWith(color: primaryColor),
          ),
        ),
      ],
    ),
  );
}

class Language {
  static Future buildLanguage(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => SimpleDialog(
        backgroundColor: bgColor,
        title: Text(
          'Language',
          style: AppTextStyle.headline2,
        ),
        children: [
          Obx(
            () => _languageWidget(
              context,
              index: 0,
              image: 'assets/images/cambodia.png',
              title: 'Khmer',
              trailingColor: _khLanguage.value ? primaryColor : whiteColor,
            ),
          ),
          Obx(
            () => _languageWidget(
              context,
              index: 1,
              image: 'assets/images/english.png',
              title: 'English',
              trailingColor: _engLanguage.value ? primaryColor : whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
