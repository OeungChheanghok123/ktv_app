// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class CategoryModel {
  final int id;
  final String name;
  final String image;
  final IconData? icon;
  final int? parentId;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    this.icon,
    this.parentId,
  });
}
