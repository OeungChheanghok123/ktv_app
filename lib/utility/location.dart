import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ktv_app/utility/text_style.dart';

import '../constants/constants.dart';

class AppLocation {
  static Widget location(
    String location,
    double sourceLat,
    double sourceLng,
    double destinationLat,
    double destinationLng,
  ) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/location-svgrepo.svg',
          color: Colors.red,
          height: 13,
        ),
        const SizedBox(
          width: defaultPaddin / 4,
        ),
        Text(
          location,
          style: AppTextStyle.title2.copyWith(color: secondGraydColor),
        ),
        const SizedBox(
          width: defaultPaddin / 6,
        ),
        Text(
          "(${_calculateDistance(
            sourceLat,
            sourceLng,
            destinationLat,
            destinationLng,
          ).toStringAsFixed(2)} km)",
          style: const TextStyle(
              fontSize: 13, color: primaryColor, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  static double _calculateDistance(
    double sourceLat,
    double sourceLng,
    double destinationLat,
    double destinationLng,
  ) {
    const p = 0.017453292519943295;
    final a = 0.5 -
        cos((destinationLat - sourceLat) * p) / 2 +
        cos(sourceLat * p) *
            cos(destinationLat * p) *
            (1 - cos((destinationLng - sourceLng) * p)) /
            2;
    return 12742 * asin(sqrt(a));
  }
}
