import 'dart:convert';

class ItemSetModel {
  final String id;
  final String image;
  final String title;
  final String subTitle;
  final String price;
  final bool? popular;
  final bool? discount;
  final String? discountPrice;
  
  ItemSetModel({
    required this.id,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.price,
    this.popular = false,
    this.discount = false,
    this.discountPrice = "0.00",
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'title': title,
      'subTitle': subTitle,
      'price': price,
      'popular': popular,
      'discount': discount,
      'discountPrice': discountPrice,
    };
  }

  factory ItemSetModel.fromMap(Map<String, dynamic> map) {
    return ItemSetModel(
      id: map['id'] as String,
      image: map['image'] as String,
      title: map['title'] as String,
      subTitle: map['subTitle'] as String,
      price: map['price'] as String,
      popular: map['popular'] != null ? map['popular'] as bool : false,
      discount: map['discount'] != null ? map['discount'] as bool : false,
      discountPrice: map['discountPrice'] != null ? map['discountPrice'] as String : "0.00",
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemSetModel.fromJson(String source) => ItemSetModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
