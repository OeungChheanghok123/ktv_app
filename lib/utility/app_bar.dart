import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/utility/text_style.dart';

class AppBarWidget {
  static AppBar simpleAppbarWidget(
    BuildContext context,
    String txt, {
    Color? backgroundColor = bgColor,
    String actionIcon = 'assets/icons/notification.svg',
    double height = 28,
  }) {
    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      centerTitle: true,
      title: Text(
        txt,
        style:
            Theme.of(context).textTheme.headline6?.copyWith(color: whiteColor),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset(
          'assets/icons/chevron-back.svg',
          height: 21,
          color: whiteColor,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: defaultPaddin / 2),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              actionIcon,
              height: height,
              color: whiteColor,
            ),
          ),
        ),
      ],
    );
  }

  static List<Widget> homeScreenAppBar(
    context,
    innerBoxIsScrolled,
  ) {
    return [
      SliverAppBar(
        floating: true,
        snap: true,
        backgroundColor: bgColor,
        title: Text(
          'KTV App',
          style: AppTextStyle.headline1.copyWith(color: whiteColor),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/map.svg',
              height: 21,
              color: primaryColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/love-heart.svg',
              height: 21,
              color: primaryColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/notification.svg',
              height: 28,
              color: primaryColor,
            ),
          ),
          const SizedBox(width: defaultPaddin / 2),
        ],
      ),
    ];
  }
}
