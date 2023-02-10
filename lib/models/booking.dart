import 'dart:convert';

class Booking {
  final String image;
  final String title;
  final String time;
  final String set;
  final String tolalAmount;
  final String status;
  Booking({
    required this.image,
    required this.title,
    required this.time,
    required this.set,
    required this.tolalAmount,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'title': title,
      'time': time,
      'set': set,
      'tolalAmount': tolalAmount,
      'status': status,
    };
  }

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      image: map['image'] as String,
      title: map['title'] as String,
      time: map['time'] as String,
      set: map['set'] as String,
      tolalAmount: map['tolalAmount'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Booking.fromJson(String source) =>
      Booking.fromMap(json.decode(source) as Map<String, dynamic>);
}
