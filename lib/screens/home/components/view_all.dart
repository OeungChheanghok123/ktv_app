import 'package:flutter/material.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/utility/text_style.dart';

class ViewAll extends StatelessWidget {
  final String tilte;
  final VoidCallback onPress;
  const ViewAll({
    Key? key,
    required this.tilte,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(left: defaultPaddin),
          child: Text(
            tilte,
            style: AppTextStyle.headline1.copyWith(
              color: primaryGrayColor,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: defaultPaddin / 2),
          child: TextButton(
            onPressed: onPress,
            clipBehavior: Clip.none,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'View all',
                  style: AppTextStyle.title2.copyWith(color: primaryGrayColor),
                ),
                const SizedBox(width: 5),
                const Icon(
                  Icons.east,
                  color: primaryGrayColor,
                  size: 13,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
