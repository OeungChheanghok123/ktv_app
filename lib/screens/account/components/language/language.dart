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
        style: AppTextStyle.headline2.copyWith(
          color: blackColor,
        ),
      ),
      trailing: Icon(
        Icons.check_circle_rounded,
        color: trailingColor,
      ),
      onTap: () {
        if (index == 0) {
          _khLanguage.value = true;
          _engLanguage.value = false;
        } else {
          _khLanguage.value = false;
          _engLanguage.value = true;
        }
      },
    ),
  );
}

class Language {
  static Future buildLanguage(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => SimpleDialog(
        title: Center(
          child: Text(
            'Language',
            style: AppTextStyle.headline1.copyWith(color: blackColor),
          ),
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
