import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ktv_app/utility/text_style.dart';

import '../constants/constants.dart';

class AppButton {
  static Widget button(
    String text, {
    required VoidCallback onTap,
    Color backgroundColor = primaryColor,
    IconData? leftIcon,
    IconData? rightIcon,
    Color color = whiteColor,
    double borderRadius = 13,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(defaultPaddin),
        margin: const EdgeInsets.symmetric(
          horizontal: defaultPaddin,
          vertical: defaultPaddin / 4,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leftIcon != null)
              Icon(
                leftIcon,
                color: color,
              ),
            if (leftIcon != null)
              const SizedBox(
                width: defaultPaddin,
              ),
            Text(
              text.toUpperCase(),
              style: AppTextStyle.headline2,
            ),
            if (rightIcon != null)
              const SizedBox(
                width: defaultPaddin,
              ),
            if (rightIcon != null)
              Icon(
                rightIcon,
                color: color,
              ),
          ],
        ),
      ),
    );
  }

  static Widget favorite(bool isFavorite, VoidCallback onPress) {
    return AppButton.icon(
      onPress,
      svg: isFavorite
          ? 'assets/icons/love-heart-filled.svg'
          : 'assets/icons/love-heart.svg',
      backgroundColor: whiteColor.withOpacity(0.1),
      color: primaryColor,
    );
  }

  static Widget icon(
    VoidCallback onPress, {
    String? svg,
    IconData? icon,
    double size = 21,
    Color color = primaryColor,
    Color backgroundColor = Colors.transparent,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Material(
        color: backgroundColor,
        child: InkWell(
          onTap: onPress,
          child: Ink(
            padding: const EdgeInsets.all(defaultPaddin / 2),
            child: svg != null
                ? SvgPicture.asset(
                    svg.toString(),
                    height: size,
                    color: color,
                  )
                : Icon(
                    icon,
                    color: color,
                    size: size,
                  ),
          ),
        ),
      ),
    );
  }

  static Widget phone(
    BuildContext context,
    String text, {
    VoidCallback? onPress,
    String? svg,
    IconData? icon,
  }) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/phone.svg',
          color: primaryColor,
          height: 13,
        ),
        const SizedBox(
          width: defaultPaddin / 4,
        ),
        GestureDetector(
          onDoubleTap: onPress,
          child: Text(
            text,
            style: AppTextStyle.title2,
          ),
        ),
      ],
    );
  }

  static Widget category({required String text, required VoidCallback onTap}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Material(
        color: secondColor,
        child: InkWell(
          onTap: onTap,
          child: Ink(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPaddin / 2, vertical: defaultPaddin / 4),
            child: Text(
              text,
              style: AppTextStyle.title2,
            ),
          ),
        ),
      ),
    );
  }
}
