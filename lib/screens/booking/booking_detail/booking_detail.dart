import 'package:flutter/material.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/utility/app_bar.dart';

class BookingDetail extends StatelessWidget {
  final String title;
  const BookingDetail({super.key, required this.title});

  final double bigImageHeight = 200;
  final double smallImageHeight = 80;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBarWidget.simpleAppbarWidget(context, title),
      body: SingleChildScrollView(
        child: Column(
          children: [
            imageBooking(context),
          ],
        ),
      ),
    );
  }

  Widget imageBooking(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: bigImageHeight + (smallImageHeight / 2),
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: bigImage(context, imageHeight: bigImageHeight),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: imageDetail(context, imageHeight: smallImageHeight),
        ),
      ],
    );
  }

  Widget bigImage(BuildContext context, {required double imageHeight}) {
    return Container(
      height: imageHeight,
      decoration: const BoxDecoration(
        color: secondColor,
        image: DecorationImage(
          image: AssetImage('assets/images/category_1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget imageDetail(BuildContext context, {required double imageHeight}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: defaultPaddin),
      height: imageHeight,
      decoration: BoxDecoration(
        color: secondColor,
        borderRadius: BorderRadius.circular(defaultPaddin / 2),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(defaultPaddin / 2),
            width: imageHeight,
            height: imageHeight,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(defaultPaddin / 2),
              image: const DecorationImage(
                image: AssetImage('assets/images/category_1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
