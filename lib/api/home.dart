// import 'package:ktv_app/models/home.dart';

// import '../models/category.dart';
// import '../models/image.dart';
// import '../models/post.dart';

// class HomeApi {
//   static Future<HomeModel> loadHome() async {
//     await Future.delayed(const Duration(seconds: 2));

//     return HomeModel(
//       mainCategory: CategoryModel(
//         id: 1,
//         name: 'KTV',
//         image: 'assets/images/category_1.jpg',
//       ),
//       subCategories: [
//         CategoryModel(
//           id: 2,
//           name: 'Steam Sauna',
//           image: 'assets/images/category_2.jpg',
//         ),
//         CategoryModel(
//           id: 3,
//           name: 'Restaurant ',
//           image: 'assets/images/category_3.jpg',
//         ),
//         CategoryModel(
//           id: 4,
//           name: 'Spa',
//           image: 'assets/images/category_4.jpg',
//         ),
//         CategoryModel(
//           id: 5,
//           name: 'Club',
//           image: 'assets/images/category_5.jpg',
//         ),
//         CategoryModel(
//           id: 6,
//           name: 'Massage',
//           image: 'assets/images/category_6.jpg',
//         ),
//       ],
//       nearbys: [
//         PostModel(
//           id: 1,
//           name: 'Temple Club',
//           address: 'Phnom Penh',
//           lat: 11.578175935497143,
//           lng: 104.92305030536971,
//           rating: 4.5,
//           phone: '011355313',
//           postCategory: [
//             CategoryModel(
//               id: 1,
//               name: 'Spa',
//               image: 'assets/images/category_1.jpg',
//             ),
//             CategoryModel(
//               id: 2,
//               name: 'KTV',
//               image: 'assets/images/category_1.jpg',
//             ),
//           ],
//           isFavorite: false,
//           images: [
//             ImageModel(
//               id: '1',
//               path: 'assets/images/category_4.jpg',
//             ),
//             ImageModel(
//               id: '2',
//               path: 'assets/images/category_1.jpg',
//             ),
//             ImageModel(
//               id: '3',
//               path: 'assets/images/category_2.jpg',
//             ),
//             ImageModel(
//               id: '4',
//               path: 'assets/images/category_3.jpg',
//             ),
//             ImageModel(
//               id: '5',
//               path: 'assets/images/category_5.jpg',
//             ),
//           ],
//         ),
//         PostModel(
//           id: 2,
//           name: 'EDM',
//           address: 'Phnom Penh',
//           lat: 11.578175935497143,
//           lng: 104.92305030536971,
//           rating: 4,
//           phone: '011355313',
//           postCategory: [
//             CategoryModel(
//               id: 1,
//               name: 'Club',
//               image: 'assets/images/category_1.jpg',
//             ),
//           ],
//           isFavorite: true,
//           images: [
//             ImageModel(
//               id: '1',
//               path: 'assets/images/category_5.jpg',
//             ),
//           ],
//         ),
//         PostModel(
//           id: 3,
//           name: 'Diamond Region KTV',
//           address: 'Phnom Penh',
//           lat: 11.578175935497143,
//           lng: 104.92305030536971,
//           rating: 3.5,
//           phone: '011355313',
//           postCategory: [
//             CategoryModel(
//               id: 1,
//               name: 'KTV',
//               image: 'assets/images/category_1.jpg',
//             ),
//           ],
//           isFavorite: false,
//           images: [
//             ImageModel(
//               id: '1',
//               path: 'assets/images/category_1.jpg',
//             ),
//           ],
//         ),
//       ],
//       popular: [
//         PostModel(
//           id: 4,
//           name: 'Temple Club',
//           address: 'Phnom Penh',
//           lat: 11.578175935497143,
//           lng: 104.92305030536971,
//           rating: 4.5,
//           postCategory: [
//             CategoryModel(
//               id: 1,
//               name: 'KTV',
//               image: 'assets/images/category_1.jpg',
//             ),
//           ],
//           isFavorite: false,
//           images: [
//             ImageModel(
//               id: '1',
//               path: 'assets/images/category_1.jpg',
//             ),
//           ],
//         ),
//         PostModel(
//           id: 5,
//           name: 'EDM',
//           address: 'Phnom Penh',
//           lat: 11.578175935497143,
//           lng: 104.92305030536971,
//           rating: 4,
//           postCategory: [
//             CategoryModel(
//               id: 1,
//               name: 'KTV',
//               image: 'assets/images/category_1.jpg',
//             ),
//           ],
//           isFavorite: true,
//           images: [
//             ImageModel(
//               id: '1',
//               path: 'assets/images/category_5.jpg',
//             ),
//           ],
//         ),
//         PostModel(
//           id: 6,
//           name: 'Diamond Region KTV',
//           address: 'Phnom Penh',
//           lat: 11.578175935497143,
//           lng: 104.92305030536971,
//           rating: 3.5,
//           postCategory: [
//             CategoryModel(
//               id: 1,
//               name: 'KTV',
//               image: 'assets/images/category_1.jpg',
//             ),
//           ],
//           isFavorite: false,
//           images: [
//             ImageModel(
//               id: '1',
//               path: 'assets/images/category_3.jpg',
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
