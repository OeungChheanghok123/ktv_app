import 'package:ktv_app/models/category.dart';
import 'package:ktv_app/models/home_model.dart';
import 'package:ktv_app/models/image_model.dart';
import 'package:ktv_app/models/post.dart';

class HomeApi {
  static Future<HomeModel> loadHome() async {
    await Future.delayed(const Duration(seconds: 2));

    return HomeModel(
      sliderImage: [
        ImageModel(
          id: '1',
          path: 'assets/images/category_4.jpg',
        ),
        ImageModel(
          id: '2',
          path: 'assets/images/category_1.jpg',
        ),
        ImageModel(
          id: '3',
          path: 'assets/images/category_3.jpg',
        ),
        ImageModel(
          id: '4',
          path: 'assets/images/category_2.jpg',
        ),
        ImageModel(
          id: '5',
          path: 'assets/images/category_5.jpg',
        ),
        ImageModel(
          id: '6',
          path: 'assets/images/category_6.jpg',
        ),
      ],
      popular: [
        PostModel(
          id: 1,
          name: 'Temple Club',
          address: 'Phnom Penh',
          lat: 11.578175935497143,
          lng: 104.92305030536971,
          rating: 4.5,
          backgroundImage: 'assets/images/category_1.jpg',
          postCategory: [
            CategoryModel(
              id: 1,
              name: 'KTV',
              image: 'assets/images/category_1.jpg',
            ),
          ],
          isFavorite: false,
          images: [
            ImageModel(
              id: '1',
              path: 'assets/images/category_1.jpg',
            ),
          ],
        ),
        PostModel(
          id: 2,
          name: 'EDM',
          address: 'Phnom Penh',
          backgroundImage: 'assets/images/category_6.jpg',
          lat: 11.578175935497143,
          lng: 104.92305030536971,
          rating: 4,
          postCategory: [
            CategoryModel(
              id: 1,
              name: 'KTV',
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
        PostModel(
          id: 3,
          name: 'Diamond Region KTV',
          backgroundImage: 'assets/images/category_3.jpg',
          address: 'Phnom Penh',
          lat: 11.578175935497143,
          lng: 104.92305030536971,
          rating: 3.5,
          postCategory: [
            CategoryModel(
              id: 1,
              name: 'KTV',
              image: 'assets/images/category_1.jpg',
            ),
          ],
          isFavorite: false,
          images: [
            ImageModel(
              id: '1',
              path: 'assets/images/category_3.jpg',
            ),
          ],
        ),
      ],
      excellentService: [],
      specailDiscount: [],
      newArrived: [],
      nearBy: [],
    );
  }
}
