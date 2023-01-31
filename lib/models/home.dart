import 'package:ktv_app/models/category.dart';
import 'package:ktv_app/models/image.dart';
import 'package:ktv_app/models/post.dart';

class HomeModel {
  final CategoryModel mainCategory;
  final List<CategoryModel> subCategories;
  final List<PostModel> nearbys;
  final List<PostModel> popular;

  HomeModel({
    required this.mainCategory,
    required this.subCategories,
    required this.nearbys,
    required this.popular,
  });
}

final HomeModel homeData = HomeModel(
  mainCategory: CategoryModel(
    id: 1,
    name: 'KTV',
    image: 'assets/images/category_1.jpg',
  ),
  subCategories: [
    CategoryModel(
      id: 2,
      name: 'Steam Sauna',
      image: 'assets/images/category_2.jpg',
    ),
    CategoryModel(
      id: 3,
      name: 'Restaurant ',
      image: 'assets/images/category_3.jpg',
    ),
    CategoryModel(
      id: 4,
      name: 'Spa',
      image: 'assets/images/category_4.jpg',
    ),
    CategoryModel(
      id: 5,
      name: 'Club',
      image: 'assets/images/category_5.jpg',
    ),
    CategoryModel(
      id: 6,
      name: 'Massage',
      image: 'assets/images/category_6.jpg',
    ),
  ],
  nearbys: [
    PostModel(
      id: 1,
      name: 'Temple Club',
      address: 'Phnom Penh',
      lat: 11.578175935497143,
      lng: 104.92305030536971,
      rating: 4.5,
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
          path: 'assets/images/category_4.jpg',
        ),
      ],
    ),
    PostModel(
      id: 2,
      name: 'EDM',
      address: 'Phnom Penh',
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
          path: 'assets/images/category_1.jpg',
        ),
      ],
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
          path: 'assets/images/category_4.jpg',
        ),
      ],
    ),
    PostModel(
      id: 2,
      name: 'EDM',
      address: 'Phnom Penh',
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
          path: 'assets/images/category_1.jpg',
        ),
      ],
    ),
  ],
);
