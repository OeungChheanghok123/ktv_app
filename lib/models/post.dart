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
}
