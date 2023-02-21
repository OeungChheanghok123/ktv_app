import 'package:flutter/material.dart';

class SortByModel {
  final IconData icon;
  final String text;
  final SortByModelValue? value;

  SortByModel({required this.icon, required this.text, this.value});

  static List<SortByModel> data() {
    return [
      SortByModel(
        icon: Icons.favorite_rounded,
        text: 'Popular',
        value: SortByModelValue.popular,
      ),
      SortByModel(
        icon: Icons.star_rounded,
        text: 'Rating',
        value: SortByModelValue.rating,
      ),
      SortByModel(
        icon: Icons.near_me_rounded,
        text: 'Distance',
        value: SortByModelValue.distance,
      ),
    ];
  }
}

enum SortByModelValue { empty, popular, rating, distance }
