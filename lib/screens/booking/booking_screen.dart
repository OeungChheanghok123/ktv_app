import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/models/booking_model.dart';
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
              viewModel.bookingList.length,
              (index) => bookingListView(
                context,
                viewModel.bookingList[index],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget bookingListView(BuildContext context, Booking booking) {
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
            child: _buildImage(context, booking.image),
          ),
          const SizedBox(width: defaultPaddin / 2),
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTitle(context, booking.title),
                    const SizedBox(height: defaultPaddin / 4),
                    Container(
                      padding: const EdgeInsets.only(right: defaultPaddin / 2),
                      child: _buildDetail(
                        context,
                        booking.time,
                        booking.set,
                        booking.tolalAmount,
                      ),
                    ),
                    booking.status == "Success"
                        ? _buildButtonReBooking(context, primaryColor, bgColor)
                        : _buildButtonReBooking(context, noneColor, noneColor),
                  ],
                ),
                booking.status == "Pending"
                    ? _buildBookingStatus(
                        context,
                        booking.status,
                        primaryColor,
                      )
                    : booking.status == "Accepted"
                        ? _buildBookingStatus(
                            context,
                            booking.status,
                            Colors.green,
                          )
                        : booking.status == "Rejected"
                            ? _buildBookingStatus(
                                context,
                                booking.status,
                                Colors.red,
                              )
                            : Container(),
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

  Widget _buildImage(
    BuildContext context,
    String img,
  ) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(13),
          bottomLeft: Radius.circular(13),
        ),
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTitle(
    BuildContext context,
    String txt,
  ) {
    return Text(
      txt,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyle.headline2,
    );
  }

  Widget _buildDetail(
    BuildContext context,
    String time,
    String set,
    String totalAmount,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        listTile(context, time),
        listTile(context, 'Set: $set'),
        listTile(context, 'Total: $totalAmount'),
      ],
    );
  }

  Widget _buildButtonReBooking(
    BuildContext context,
    Color color,
    Color colorBg,
  ) {
    return Row(
      children: [
        const Expanded(
          flex: 3,
          child: SizedBox.shrink(),
        ),
        Expanded(
          flex: 2,
          child: Container(
            margin: const EdgeInsets.only(right: defaultPaddin / 2),
            padding: const EdgeInsets.symmetric(vertical: defaultPaddin / 4),
            decoration: BoxDecoration(
              color: colorBg,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 2,
                color: color,
              ),
            ),
            child: Center(
              child: Text(
                'Re-Booking',
                style: AppTextStyle.headline2.copyWith(
                  color: color,
                  fontSize: 11,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBookingStatus(
    BuildContext context,
    String txt,
    Color color,
  ) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        width: 90,
        height: 25,
        decoration: BoxDecoration(
          color: color.withOpacity(0.4),
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(13),
            topLeft: Radius.circular(13),
          ),
        ),
        child: Center(
          child: Text(
            txt,
            style: AppTextStyle.headline2.copyWith(
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
