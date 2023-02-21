// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CommentModel {
  final String id;
  final double rating;
  final String description;
  final String userId;
  final String postId;

  CommentModel({
    required this.id,
    required this.rating,
    required this.description,
    required this.userId,
    required this.postId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'rating': rating,
      'description': description,
      'userId': userId,
      'postId': postId,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      id: map['id'] as String,
      rating: map['rating'] as double,
      description: map['description'] as String,
      userId: map['userId'] as String,
      postId: map['postId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) => CommentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
