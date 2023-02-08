import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/screens/booking/booking_view_model.dart';
import 'package:ktv_app/utility/text_style.dart';

class BookingScreen extends StatelessWidget {
  BookingScreen({super.key});

  final viewModel = Get.put(BookingViewModel());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: bgColor,
          title: Center(
            child: Text(
              'Booking',
              style: AppTextStyle.headline1,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(
              5,
              (index) => bookingListView(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget bookingListView(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 110,
      margin: const EdgeInsets.only(
        left: defaultPaddin,
        right: defaultPaddin,
        bottom: defaultPaddin,
      ),
      decoration: BoxDecoration(
        color: secondColor,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 0,
            child: Container(
              width: 150,
              decoration: const BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(13),
                  bottomLeft: Radius.circular(13),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/category_1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: defaultPaddin / 2),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Diamond Region KTV III',
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.headline2,
                ),
                const SizedBox(height: defaultPaddin / 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    listTile(context, '5 hour'),
                    listTile(context, 'Set: ABC 300 Box and Free 1 Food'),
                    listTile(context, 'Total: 50\$'),
                    Row(
                      children: [
                        const Expanded(
                          flex: 3,
                          child: SizedBox.shrink(),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 25,
                            margin: const EdgeInsets.only(right: defaultPaddin),
                            decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                width: 2,
                                color: primaryColor,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Re-Booking',
                                style: AppTextStyle.headline2.copyWith(
                                  color: primaryColor,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget listTile(
    BuildContext context,
    String text,
  ) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: defaultPaddin / 2),
          decoration: const BoxDecoration(
            color: secondGraydColor,
            shape: BoxShape.circle,
          ),
        ),
        Expanded(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.headline2.copyWith(
              color: secondGraydColor,
            ),
          ),
        ),
      ],
    );
  }
}
