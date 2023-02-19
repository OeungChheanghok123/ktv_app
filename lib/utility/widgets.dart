import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/screens/detail/detail_screen.dart';
import 'package:ktv_app/utility/text_style.dart';

class AppWidget {
  static Widget badge(
    String text,
    Color pColor,
    Color sColor, {
    IconData? icon,
    String? svg,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPaddin / 2, vertical: defaultPaddin / 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: sColor,
      ),
      child: Row(
        children: [
          if (icon != null)
            Icon(
              icon,
              color: pColor,
            ),
          if (svg != null)
            SvgPicture.asset(
              svg.toString(),
              color: pColor,
              height: 13,
            ),
          const SizedBox(
            width: defaultPaddin / 4,
          ),
          Text(
            text,
            style: TextStyle(
              color: pColor,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  static Widget largePost(
    BuildContext context, {
    required VoidCallback onPress,
    required String image,
    required String name,
    required double rating,
    required bool isFavorite,
  }) {
    return Container(
      margin: const EdgeInsets.only(left: defaultPaddin),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Material(
          color: secondColor,
          child: InkWell(
            onTap: onPress,
            splashColor: primaryColor,
            child: Stack(
              children: [
                Ink(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 138,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage(image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: defaultPaddin / 2,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: defaultPaddin / 2),
                                Text(
                                  name,
                                  style: AppTextStyle.headline2,
                                ),
                                const SizedBox(height: defaultPaddin / 2),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: const Icon(
                                            Icons.star,
                                            color: secondGraydColor,
                                            size: 21,
                                          ),
                                        ),
                                        const SizedBox(width: 3),
                                        Text(
                                          "$rating",
                                          style: AppTextStyle.body.copyWith(
                                            color: secondGraydColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: defaultPaddin / 2),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: const Icon(
                                            Icons.monetization_on,
                                            color: secondGraydColor,
                                            size: 21,
                                          ),
                                        ),
                                        const SizedBox(width: 3),
                                        Text(
                                          '\$50/set',
                                          style: AppTextStyle.body.copyWith(
                                            color: secondGraydColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: defaultPaddin / 2),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: const Icon(
                                            Icons.motorcycle,
                                            color: secondGraydColor,
                                            size: 21,
                                          ),
                                        ),
                                        const SizedBox(width: 3),
                                        Text(
                                          '10-20min',
                                          style: AppTextStyle.body.copyWith(
                                            color: secondGraydColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: defaultPaddin / 2),
                              child: Icon(
                                isFavorite == false
                                    ? Icons.favorite_outline_rounded
                                    : Icons.favorite_rounded,
                                color: isFavorite == false
                                    ? secondGraydColor
                                    : primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: 55,
                    height: 35,
                    decoration: const BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: Text('50%', style: AppTextStyle.headline2),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget smallPost(
    BuildContext context, {
    bool? isShadow = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: defaultPaddin,
        vertical: defaultPaddin / 2,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Material(
          color: secondColor,
          child: InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(),
              ),
            ),
            splashColor: primaryColor,
            child: Ink(
              height: 89,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(defaultPaddin / 2),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: isShadow == true
                        ? blackColor.withOpacity(0.2)
                        : noneColor,
                    blurRadius: 4,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: primaryColor,
                      image: const DecorationImage(
                        image: AssetImage('assets/images/category_1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: defaultPaddin / 2,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'The Best Star KTV',
                          style: AppTextStyle.headline2,
                        ),
                        Row(
                          children: [
                            AppWidget.badge(
                              '5',
                              Colors.orange,
                              Colors.orange.withOpacity(0.1),
                              svg: "assets/icons/star-filled-fiveointed.svg",
                            ),
                            const SizedBox(
                              width: defaultPaddin / 2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget listTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    required bool underLine,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            padding: const EdgeInsets.all(defaultPaddin / 2),
            decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: whiteColor,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: secondGraydColor,
          ),
          title: Text(
            title,
            style: AppTextStyle.headline2.copyWith(
              color: whiteColor,
            ),
          ),
          onTap: onTap,
        ),
        const SizedBox(height: defaultPaddin / 4),
        underLine
            ? Container(
                color: bgColor,
                margin: const EdgeInsets.symmetric(horizontal: defaultPaddin),
                height: 2,
                width: double.infinity,
              )
            : const SizedBox.shrink(),
        underLine
            ? const SizedBox(height: defaultPaddin / 4)
            : const SizedBox.shrink(),
      ],
    );
  }

  static Widget bigImage(
    BuildContext context,
    String image,
  ) {
    return Container(
      height: 144,
      margin: const EdgeInsets.symmetric(
        horizontal: defaultPaddin * 4,
        vertical: defaultPaddin / 2,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Material(
          color: secondColor,
          child: Ink(
            width: MediaQuery.of(context).size.width,
            child: Container(
              padding: const EdgeInsets.all(defaultPaddin),
              child: SvgPicture.asset(
                image,
                color: secondGraydColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget textField(
    BuildContext context,
    TextEditingController controller, {
    bool obscureText = false,
    TextInputType textInputType = TextInputType.text,
    IconData? iconData,
    String? suffixText = "",
    VoidCallback? onTap,
  }) {
    return TextField(
      keyboardType: textInputType,
      controller: controller,
      style: AppTextStyle.headline2,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: iconData == null
            ? null
            : Container(
                margin: const EdgeInsets.only(right: defaultPaddin / 2),
                child: InkWell(
                  onTap: onTap,
                  splashColor: noneColor,
                  highlightColor: noneColor,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        iconData,
                        color: secondGraydColor,
                      ),
                      const SizedBox(width: defaultPaddin / 2),
                      Text(
                        "$suffixText",
                        style: AppTextStyle.headline2,
                      ),
                      const SizedBox(width: defaultPaddin / 2),
                    ],
                  ),
                ),
              ),
        contentPadding: const EdgeInsets.only(
          left: defaultPaddin,
          right: defaultPaddin / 2,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: secondGraydColor, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(defaultPaddin)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: secondGraydColor, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(defaultPaddin)),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: whiteColor, width: 2.0),
        ),
      ),
      onSubmitted: (val) {},
      onChanged: (String val) {},
    );
  }
}
