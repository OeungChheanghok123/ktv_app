import 'package:ktv_app/models/category_model.dart';
import 'package:ktv_app/models/home_model.dart';
import 'package:ktv_app/models/image_model.dart';
import 'package:ktv_app/models/item_set_model.dart';
import 'package:ktv_app/models/post_model.dart';

class HomeApi {
  static Future<HomeModel> loadHome() async {
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
          address: 'ផ្លូវលេខ ០៨, ក្រុងសៀមរាប',
          description:
              'G Mekong Hotel features a rooftop swimming pool and a spa centre. Guests can enjoy meals at the in-house restaurant or have a drink at the bar. Freee WIFI is available in public areas. Tuol Sleng Genocide Museum is about 5 minutes and king Palace...',
          lat: 11.578175935497143,
          lng: 104.92305030536971,
          rating: 5,
          isFavorite: true,
          backgroundImage: 'assets/images/category_1.jpg',
          postCategory: [
            CategoryModel(
              id: 1,
              name: 'KTV',
              image: 'assets/images/category_1.jpg',
            ),
            CategoryModel(
              id: 2,
              name: 'Club',
              image: 'assets/images/category_2.jpg',
            ),
          ],
          images: [
            ImageModel(
              id: '1',
              path: 'assets/images/category_1.jpg',
            ),
            ImageModel(
              id: '2',
              path: 'assets/images/category_2.jpg',
            ),
            ImageModel(
              id: '3',
              path: 'assets/images/category_3.jpg',
            ),
            ImageModel(
              id: '4',
              path: 'assets/images/category_4.jpg',
            ),
          ],
          itemSet: [
            ItemSetModel(
              id: '1',
              image: 'assets/images/category_1.jpg',
              title: 'Set Size L ',
              subTitle: 'For those seeking a premium KTV experience in Phnom Penh. the ultimate location for a night of singing and partying while enjoying the privacy of our karaoke rooms have to offer.',
              price: '25.00',
              popular: true,
            ),
            ItemSetModel(
              id: '2',
              image: 'assets/images/category_5.jpg',
              title: 'Set Size XL ',
              subTitle: 'For those seeking a premium KTV experience in Phnom Penh. the ultimate location for a night of singing and partying while enjoying the privacy of our karaoke rooms have to offer.',
              price: '35.00',
              popular: true,
            ),
            ItemSetModel(
              id: '3',
              image: 'assets/images/category_3.jpg',
              title: 'Set Size M ',
              subTitle: 'For those seeking a premium KTV experience in Phnom Penh. the ultimate location for a night of singing and partying while enjoying the privacy of our karaoke rooms have to offer.',
              price: '15.00',
            ),
            ItemSetModel(
              id: '4',
              image: 'assets/images/category_2.jpg',
              title: 'Set Size S ',
              subTitle: 'For those seeking a premium KTV experience in Phnom Penh. the ultimate location for a night of singing and partying while enjoying the privacy of our karaoke rooms have to offer.',
              price: '10.00',
              popular: true,
            ),
            ItemSetModel(
              id: '5',
              image: 'assets/images/category_4.jpg',
              title: 'Set Size L ',
              subTitle: 'For those seeking a premium KTV experience in Phnom Penh. the ultimate location for a night of singing and partying while enjoying the privacy of our karaoke rooms have to offer.',
              price: '25.00',
            ),
            ItemSetModel(
              id: '6',
              image: 'assets/images/category_6.jpg',
              title: 'Set Size XL ',
              subTitle: 'For those seeking a premium KTV experience in Phnom Penh. the ultimate location for a night of singing and partying while enjoying the privacy of our karaoke rooms have to offer.',
              price: '35.00',
            ),
          ],
        ),
        PostModel(
          id: 2,
          name: 'EDM',
          address:
              'No 149, Preah Monivong Boulevard, Khan 7 Makara (Orussey Market Area), Phnom Penh',
          description:
              'មោះ ណាគេនៅចាំidol បទកាដូគ្មានន៏យខ្លះ ? TOS meet him tonight at EDM3',
          lat: 11.578175935497143,
          lng: 104.92305030536971,
          rating: 4,
          isFavorite: true,
          backgroundImage: 'assets/images/category_6.jpg',
          postCategory: [
            CategoryModel(
              id: 1,
              name: 'KTV',
              image: 'assets/images/category_1.jpg',
            ),
          ],
          images: [
            ImageModel(
              id: '1',
              path: 'assets/images/category_6.jpg',
            ),
            ImageModel(
              id: '2',
              path: 'assets/images/category_3.jpg',
            ),
          ],
        ),
        PostModel(
          id: 3,
          name: 'Diamond Region KTV',
          address: 'Preah Sihanouk Blvd (274), Phnom Penh',
          lat: 11.578175935497143,
          lng: 104.92305030536971,
          rating: 5,
          isFavorite: false,
          backgroundImage: 'assets/images/category_3.jpg',
          postCategory: [
            CategoryModel(
              id: 1,
              name: 'Club',
              image: 'assets/images/category_1.jpg',
            ),
            CategoryModel(
              id: 2,
              name: 'Pub & Resturant',
              image: 'assets/images/category_1.jpg',
            ),
          ],
          images: [
            ImageModel(
              id: '1',
              path: 'assets/images/category_3.jpg',
            ),
          ],
        ),
      ],
      excellentService: [
        PostModel(
          id: 4,
          name: 'Magic Family KTV',
          address: 'Phnom Penh',
          lat: 11.578175935497143,
          lng: 104.92305030536971,
          rating: 4,
          backgroundImage: 'assets/images/category_6.jpg',
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
          id: 5,
          name: 'Happy Day KTV',
          address: 'Phnom Penh',
          backgroundImage: 'assets/images/category_2.jpg',
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
          id: 6,
          name: 'CLUB 888',
          backgroundImage: 'assets/images/category_4.jpg',
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
        PostModel(
          id: 7,
          name: 'Diamond Region KTV',
          backgroundImage: 'assets/images/category_1.jpg',
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
      specailDiscount: [
        PostModel(
          id: 8,
          name: 'CLUB 888',
          backgroundImage: 'assets/images/category_1.jpg',
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
          isFavorite: true,
          images: [
            ImageModel(
              id: '1',
              path: 'assets/images/category_3.jpg',
            ),
          ],
        ),
      ],
      newArrived: [
        PostModel(
          id: 9,
          name: 'CLUB 888',
          backgroundImage: 'assets/images/category_5.jpg',
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
          isFavorite: true,
          images: [
            ImageModel(
              id: '1',
              path: 'assets/images/category_3.jpg',
            ),
          ],
        ),
        PostModel(
          id: 10,
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
      nearBy: [],
    );
  }
}
