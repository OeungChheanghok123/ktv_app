import 'package:ktv_app/models/category.dart';
import 'package:ktv_app/models/image.dart';
import 'package:ktv_app/models/post.dart';
import 'package:ktv_app/models/sort_by.dart';

class SearchApi {
  static Future<List<PostModel>> loadSearch(
      String? query, SortByModelValue? value) async {
    if (value == SortByModelValue.popular) {
      await Future.delayed(const Duration(seconds: 2));
      return [
        PostModel(
          id: 1,
          name: 'Temple Club1',
          address: 'Phnom Penh',
          lat: 11.578175935497143,
          lng: 104.92305030536971,
          rating: 5,
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
              path: 'assets/images/category_3.jpg',
            ),
          ],
        ),
        PostModel(
          id: 2,
          name: 'Temple Club2',
          address: 'Phnom Penh',
          lat: 11.578175935497143,
          lng: 104.92305030536971,
          rating: 4.5,
          postCategory: [
            CategoryModel(
              id: 1,
              name: 'KTV',
              image: 'assets/images/category_2.jpg',
            ),
          ],
          isFavorite: false,
          images: [
            ImageModel(
              id: '1',
              path: 'assets/images/category_4.jpg',
            ),
          ],
        ),
        PostModel(
          id: 3,
          name: 'Temple Club3',
          address: 'Phnom Penh',
          lat: 11.578175935497143,
          lng: 104.92305030536971,
          rating: 4.0,
          postCategory: [
            CategoryModel(
              id: 1,
              name: 'KTV',
              image: 'assets/images/category_3.jpg',
            ),
          ],
          isFavorite: false,
          images: [
            ImageModel(
              id: '1',
              path: 'assets/images/category_5.jpg',
            ),
          ],
        ),
        PostModel(
          id: 4,
          name: 'Temple Club4',
          address: 'Phnom Penh',
          lat: 11.578175935497143,
          lng: 104.92305030536971,
          rating: 4.0,
          postCategory: [
            CategoryModel(
              id: 1,
              name: 'KTV',
              image: 'assets/images/category_4.jpg',
            ),
          ],
          isFavorite: false,
          images: [
            ImageModel(
              id: '1',
              path: 'assets/images/category_6.jpg',
            ),
          ],
        ),
        PostModel(
          id: 5,
          name: 'Temple Club5',
          address: 'Phnom Penh',
          lat: 11.578175935497143,
          lng: 104.92305030536971,
          rating: 3.5,
          postCategory: [
            CategoryModel(
              id: 1,
              name: 'KTV',
              image: 'assets/images/category_5.jpg',
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
          id: 6,
          name: 'Temple Club6',
          address: 'Phnom Penh',
          lat: 11.578175935497143,
          lng: 104.92305030536971,
          rating: 3.0,
          postCategory: [
            CategoryModel(
              id: 1,
              name: 'KTV',
              image: 'assets/images/category_6.jpg',
            ),
          ],
          isFavorite: false,
          images: [
            ImageModel(
              id: '1',
              path: 'assets/images/category_2.jpg',
            ),
          ],
        )
      ];
    }
    if (value == SortByModelValue.distance) {
      await Future.delayed(const Duration(seconds: 2));
      return [
        PostModel(
          id: 1,
          name: 'Temple Club1',
          address: 'Phnom Penh',
          lat: 11.578175935497143,
          lng: 104.92305030536971,
          rating: 5,
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
              path: 'assets/images/category_2.jpg',
            ),
          ],
        ),
        PostModel(
          id: 2,
          name: 'Temple Club2',
          address: 'Phnom Penh',
          lat: 11.578175935497143,
          lng: 104.92305030536971,
          rating: 4.5,
          postCategory: [
            CategoryModel(
              id: 1,
              name: 'KTV',
              image: 'assets/images/category_2.jpg',
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
        PostModel(
          id: 3,
          name: 'Temple Club3',
          address: 'Phnom Penh',
          lat: 11.578175935497143,
          lng: 104.92305030536971,
          rating: 4.0,
          postCategory: [
            CategoryModel(
              id: 1,
              name: 'KTV',
              image: 'assets/images/category_3.jpg',
            ),
          ],
          isFavorite: false,
          images: [
            ImageModel(
              id: '1',
              path: 'assets/images/category_4.jpg',
            ),
          ],
        ),
        PostModel(
          id: 4,
          name: 'Temple Club4',
          address: 'Phnom Penh',
          lat: 11.578175935497143,
          lng: 104.92305030536971,
          rating: 4.0,
          postCategory: [
            CategoryModel(
              id: 1,
              name: 'KTV',
              image: 'assets/images/category_5.jpg',
            ),
          ],
          isFavorite: false,
          images: [
            ImageModel(
              id: '1',
              path: 'assets/images/category_4.jpg',
            ),
          ],
        ),
        PostModel(
          id: 5,
          name: 'Temple Club5',
          address: 'Phnom Penh',
          lat: 11.578175935497143,
          lng: 104.92305030536971,
          rating: 3.5,
          postCategory: [
            CategoryModel(
              id: 1,
              name: 'KTV',
              image: 'assets/images/category_6.jpg',
            ),
          ],
          isFavorite: false,
          images: [
            ImageModel(
              id: '1',
              path: 'assets/images/category_5.jpg',
            ),
          ],
        ),
        PostModel(
          id: 6,
          name: 'Temple Club6',
          address: 'Phnom Penh',
          lat: 11.578175935497143,
          lng: 104.92305030536971,
          rating: 3.0,
          postCategory: [
            CategoryModel(
              id: 1,
              name: 'KTV',
              image: 'assets/images/category_6.jpg',
            ),
          ],
          isFavorite: false,
          images: [
            ImageModel(
              id: '1',
              path: 'assets/images/category_6.jpg',
            ),
          ],
        )
      ];
    } else {
      await Future.delayed(const Duration(seconds: 2));
      return [
        PostModel(
          id: 1,
          name: 'Temple Club1',
          address: 'Phnom Penh',
          lat: 11.578175935497143,
          lng: 104.92305030536971,
          rating: 5,
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
              path: 'assets/images/category_1.jpg',
            ),
          ],
        ),
        PostModel(
          id: 2,
          name: 'Temple Club2',
          address: 'Phnom Penh',
          lat: 11.578175935497143,
          lng: 104.92305030536971,
          rating: 4.5,
          postCategory: [
            CategoryModel(
              id: 1,
              name: 'KTV',
              image: 'assets/images/category_2.jpg',
            ),
          ],
          isFavorite: false,
          images: [
            ImageModel(
              id: '1',
              path: 'assets/images/category_2.jpg',
            ),
          ],
        ),
        PostModel(
          id: 3,
          name: 'Temple Club3',
          address: 'Phnom Penh',
          lat: 11.578175935497143,
          lng: 104.92305030536971,
          rating: 4.0,
          postCategory: [
            CategoryModel(
              id: 1,
              name: 'KTV',
              image: 'assets/images/category_3.jpg',
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
        PostModel(
          id: 4,
          name: 'Temple Club4',
          address: 'Phnom Penh',
          lat: 11.578175935497143,
          lng: 104.92305030536971,
          rating: 4.0,
          postCategory: [
            CategoryModel(
              id: 1,
              name: 'KTV',
              image: 'assets/images/category_4.jpg',
            ),
          ],
          isFavorite: false,
          images: [
            ImageModel(
              id: '1',
              path: 'assets/images/category_4.jpg',
            ),
          ],
        ),
        PostModel(
          id: 5,
          name: 'Temple Club5',
          address: 'Phnom Penh',
          lat: 11.578175935497143,
          lng: 104.92305030536971,
          rating: 3.5,
          postCategory: [
            CategoryModel(
              id: 1,
              name: 'KTV',
              image: 'assets/images/category_5.jpg',
            ),
          ],
          isFavorite: false,
          images: [
            ImageModel(
              id: '1',
              path: 'assets/images/category_5.jpg',
            ),
          ],
        ),
        PostModel(
          id: 6,
          name: 'Temple Club6',
          address: 'Phnom Penh',
          lat: 11.578175935497143,
          lng: 104.92305030536971,
          rating: 3.0,
          postCategory: [
            CategoryModel(
              id: 1,
              name: 'KTV',
              image: 'assets/images/category_6.jpg',
            ),
          ],
          isFavorite: false,
          images: [
            ImageModel(
              id: '1',
              path: 'assets/images/category_6.jpg',
            ),
          ],
        )
      ];
    }
  }

  static Future<List<String>> loadHistorySearch() async {
    await Future.delayed(const Duration(seconds: 2));

    return [
      'KTV1',
      'KTV2',
      'KTV3',
      'KTV4',
      'KTV5',
      'KTV6',
      'KTV7',
      'KTV8',
      'KTV9',
      'KTV10',
      'KTV11',
      'KTV12',
      'KTV13',
      'KTV14',
      'KTV15',
    ];
  }
}
