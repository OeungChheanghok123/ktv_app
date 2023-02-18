import 'dart:convert';

class ImageModel {
  final String id;
  final String path;
  
  ImageModel({
    required this.id,
    required this.path,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'path': path,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      id: map['id'] as String,
      path: map['path'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageModel.fromJson(String source) => ImageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
