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
}
