import 'dart:convert';

import 'package:ktv_app/models/image.dart';
import 'package:ktv_app/models/post.dart';

class HomeModel {
  final ImageModel sliderImage;
  final List<PostModel> popular;
  final List<PostModel> excellentService;
  final List<PostModel> specailDiscount;
  final List<PostModel> newArrived;
  final List<PostModel> nearBy;

  HomeModel({
    required this.sliderImage,
    required this.popular,
    required this.excellentService,
    required this.specailDiscount,
    required this.newArrived,
    required this.nearBy,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sliderImage': sliderImage.toMap(),
      'popular': popular.map((x) => x.toMap()).toList(),
      'excellentService': excellentService.map((x) => x.toMap()).toList(),
      'specailDiscount': specailDiscount.map((x) => x.toMap()).toList(),
      'newArrived': newArrived.map((x) => x.toMap()).toList(),
      'nearBy': nearBy.map((x) => x.toMap()).toList(),
    };
  }

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(
      sliderImage:
          ImageModel.fromMap(map['sliderImage'] as Map<String, dynamic>),
      popular: List<PostModel>.from(
        (map['popular'] as List<int>).map<PostModel>(
          (x) => PostModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      excellentService: List<PostModel>.from(
        (map['excellentService'] as List<int>).map<PostModel>(
          (x) => PostModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      specailDiscount: List<PostModel>.from(
        (map['specailDiscount'] as List<int>).map<PostModel>(
          (x) => PostModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      newArrived: List<PostModel>.from(
        (map['newArrived'] as List<int>).map<PostModel>(
          (x) => PostModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      nearBy: List<PostModel>.from(
        (map['nearBy'] as List<int>).map<PostModel>(
          (x) => PostModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeModel.fromJson(String source) =>
      HomeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
