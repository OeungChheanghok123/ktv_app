// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ktv_app/models/category.dart';
import 'package:ktv_app/models/comment.dart';
import 'package:ktv_app/models/image.dart';

class PostModel {
  final int id;
  final String name;
  final String? description;
  final String address;
  final double lat;
  final double lng;
  final double rating;
  final String? phone;
  final DateTime? startTime;
  final DateTime? closeTime;
  final List<ImageModel> images;
  final List<CategoryModel> postCategory;
  final List<CommentModel>? postComment;
  bool isFavorite = false;

  PostModel({
    required this.id,
    required this.name,
    this.description,
    required this.address,
    required this.lat,
    required this.lng,
    required this.rating,
    this.phone,
    this.startTime,
    this.closeTime,
    required this.images,
    required this.postCategory,
    this.postComment,
    required this.isFavorite,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'address': address,
      'lat': lat,
      'lng': lng,
      'rating': rating,
      'phone': phone,
      'startTime': startTime?.millisecondsSinceEpoch,
      'closeTime': closeTime?.millisecondsSinceEpoch,
      'images': images.map((x) => x.toMap()).toList(),
      'postCategory': postCategory.map((x) => x.toMap()).toList(),
      'postComment': postComment?.map((x) => x.toMap()).toList(),
      'isFavorite': isFavorite,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] != null ? map['description'] as String : null,
      address: map['address'] as String,
      lat: map['lat'] as double,
      lng: map['lng'] as double,
      rating: map['rating'] as double,
      phone: map['phone'] != null ? map['phone'] as String : null,
      startTime: map['startTime'] != null ? DateTime.fromMillisecondsSinceEpoch(map['startTime'] as int) : null,
      closeTime: map['closeTime'] != null ? DateTime.fromMillisecondsSinceEpoch(map['closeTime'] as int) : null,
      images: List<ImageModel>.from((map['images'] as List<int>).map<ImageModel>((x) => ImageModel.fromMap(x as Map<String,dynamic>),),),
      postCategory: List<CategoryModel>.from((map['postCategory'] as List<int>).map<CategoryModel>((x) => CategoryModel.fromMap(x as Map<String,dynamic>),),),
      postComment: List<CommentModel>.from((map['postComment'] as List<int>).map<CommentModel>((x) => CommentModel.fromMap(x as Map<String,dynamic>),),),
      isFavorite: map['isFavorite'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) => PostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
