import 'package:ktv_app/models/category.dart';
import 'package:ktv_app/models/image.dart';
import 'package:ktv_app/models/post.dart';

class MapApi {
  static Future<List<PostModel>> loadPostLocation() async {
    await Future.delayed(const Duration(milliseconds: 1));

    return [
      PostModel(
        id: 1,
        name: 'Temple Club',
        address: 'Phnom Penh',
        lat: 11.564642616318666,
        lng: 104.91534022196787,
        rating: 4.5,
        phone: '011355313',
        postCategory: [
          CategoryModel(
            id: 1,
            name: 'Spa',
            image: 'assets/images/category_1.jpg',
          ),
          CategoryModel(
            id: 2,
            name: 'KTV',
            image: 'assets/images/category_1.jpg',
          ),
        ],
        isFavorite: false,
        images: [
          ImageModel(
            id: '1',
            path: 'assets/images/category_4.jpg',
          ),
          ImageModel(
            id: '1',
            path: 'assets/images/category_3.jpg',
          ),
        ],
      ),
      PostModel(
        id: 2,
        name: 'EDM',
        address: 'Phnom Penh',
        lat: 11.563150003183495,
        lng: 104.90805528963725,
        rating: 4,
        phone: '011355313',
        postCategory: [
          CategoryModel(
            id: 1,
            name: 'Club',
            image: 'assets/images/category_1.jpg',
          ),
        ],
        isFavorite: true,
        images: [
          ImageModel(
            id: '1',
            path: 'assets/images/category_5.jpg',
          ),
        ],
      ),
    ];
  }
}
