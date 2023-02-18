import 'package:get/get.dart';
import 'package:ktv_app/models/job_model.dart';

class JobViewModel extends GetxController {
  final List<JobModel> jobList = [
    JobModel(
      image: 'assets/images/category_1.jpg',
      position: 'General Manager',
      name: 'EDM3 CLUB',
      address: 'Koh Pich St, Phnom Penh',
      salary: 'Negotiate',
      deadLine: '28-Feb-2023',
    ),
    JobModel(
      image: 'assets/images/category_2.jpg',
      position: 'IT Support',
      name: 'Diamond Region KTV III',
      address: 'Preah Sihanouk Blvd (274), Phnom Penh',
      salary: 'Negotiate',
      deadLine: '18-Feb-2023',
    ),
    JobModel(
      image: 'assets/images/category_3.jpg',
      position: 'Bussiness Manager',
      name: 'Diamond Region KTV III',
      address: 'Preah Sihanouk Blvd (274), Phnom Penh',
      salary: 'Negotiate',
      deadLine: '20-Feb-2023',
    ),
    JobModel(
      image: 'assets/images/category_4.jpg',
      position: 'Bussiness Manager',
      name: 'Diamond Region KTV III',
      address: 'Preah Sihanouk Blvd (274), Phnom Penh',
      salary: 'Negotiate',
      deadLine: '25-Feb-2023',
    ),
    JobModel(
      image: 'assets/images/category_5.jpg',
      position: 'General Manager',
      name: 'EDM3 CLUB',
      address: 'Koh Pich St, Phnom Penh',
      salary: 'Negotiate',
      deadLine: '1-Mar-2023',
    ),
    JobModel(
      image: 'assets/images/category_6.jpg',
      position: 'Bussiness Manager',
      name: 'Diamond Region KTV III',
      address: 'Preah Sihanouk Blvd (274), Phnom Penh',
      salary: 'Negotiate',
      deadLine: '10-Feb-2023',
    ),
  ];

  var favoriteList = [].obs;

  void setFavoriteList() {
    for (int i = 0; i < jobList.length; i++) {
      favoriteList.add(false);
    }
  }

  @override
  void onInit() {
    setFavoriteList();
    super.onInit();
  }
}
