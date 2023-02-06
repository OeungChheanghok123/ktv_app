import 'dart:convert';

class JobModel {
  final String image;
  final String position;
  final String name;
  final String address;
  final String salary;
  final String deadLine;
  
  JobModel({
    required this.image,
    required this.position,
    required this.name,
    required this.address,
    required this.salary,
    required this.deadLine,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'position': position,
      'name': name,
      'address': address,
      'salary': salary,
      'deadLine': deadLine,
    };
  }

  factory JobModel.fromMap(Map<String, dynamic> map) {
    return JobModel(
      image: map['image'] as String,
      position: map['position'] as String,
      name: map['name'] as String,
      address: map['address'] as String,
      salary: map['salary'] as String,
      deadLine: map['deadLine'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory JobModel.fromJson(String source) => JobModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
