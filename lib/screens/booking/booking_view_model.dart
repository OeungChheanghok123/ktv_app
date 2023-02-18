import 'package:get/get.dart';
import 'package:ktv_app/models/booking_model.dart';

class BookingViewModel extends GetxController {
  final List<Booking> bookingList = [
    Booking(
      image: 'assets/images/category_1.jpg',
      title: 'Diamond Region KTV III',
      time: '5 hour',
      set: 'ABC 3 Box and Free 1 Food',
      tolalAmount: '50\$',
      status: 'Success',
    ),
    Booking(
      image: 'assets/images/category_2.jpg',
      title: 'EDM3 CLUB',
      time: '5 hour',
      set: 'ABC 3 Box and Free 1 Food',
      tolalAmount: '50\$',
      status: 'Pending',
    ),
    Booking(
      image: 'assets/images/category_3.jpg',
      title: 'Diamond Region KTV III',
      time: '5 hour',
      set: 'ABC 3 Box and Free 1 Food',
      tolalAmount: '50\$',
      status: 'Accepted',
    ),
    Booking(
      image: 'assets/images/category_4.jpg',
      title: 'EDM3 CLUB',
      time: '5 hour',
      set: 'ABC 3 Box and Free 1 Food',
      tolalAmount: '50\$',
      status: 'Rejected',
    ),
    Booking(
      image: 'assets/images/category_5.jpg',
      title: 'Family KTV',
      time: '1 hour',
      set: 'ABC 1 Box and Free 1 Food',
      tolalAmount: '20\$',
      status: 'Success',
    ),
    Booking(
      image: 'assets/images/category_6.jpg',
      title: 'EDM3 CLUB',
      time: '2 hour',
      set: 'ABC 2 Box and Free 1 Food',
      tolalAmount: '100\$',
      status: 'Success',
    ),
  ];
}
