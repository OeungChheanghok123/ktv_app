import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/screens/booking/booking_view_model.dart';
import 'package:ktv_app/utility/app_bar.dart';
import 'package:ktv_app/utility/map_style.dart';
import 'package:ktv_app/utility/text_style.dart';

class BookingDetail extends StatelessWidget {
  final int id;
  final String title;
  BookingDetail({super.key, required this.id, required this.title});

  final double bigImageHeight = 200;
  final double smallImageHeight = 80;

  final viewModel = Get.put(BookingViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBarWidget.simpleAppbarWidget(context, title),
      body: SingleChildScrollView(
        child: Column(
          children: [
            imageBooking(context),
            googleMap(context),
            detailBooking(context),
          ],
        ),
      ),
      bottomNavigationBar: navigationButton(context),
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
            width: imageHeight * 1.25,
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
          Container(
            margin: const EdgeInsets.only(
              left: defaultPaddin / 4,
              top: defaultPaddin / 2,
              bottom: defaultPaddin / 2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildIconText(Icons.sports_bar, "ABC (1 Box)"),
                _buildIconText(Icons.chair, "Free Room"),
                _buildIconText(Icons.restaurant, "Food 2"),
                _buildIconText(Icons.people_alt_rounded, "4 - 6 Person"),
              ],
            ),
          ),
          const Spacer(),
          Container(
            alignment: Alignment.topRight,
            padding: const EdgeInsets.only(
              top: defaultPaddin / 2,
              right: defaultPaddin / 2,
            ),
            child: Text(
              '\$50',
              style: AppTextStyle.headline1.copyWith(
                color: primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget googleMap(BuildContext context) {
    BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;

    return Padding(
      padding: const EdgeInsets.all(defaultPaddin),
      child: SizedBox(
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: GoogleMap(
            myLocationEnabled: false,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
            tiltGesturesEnabled: false,
            initialCameraPosition: const CameraPosition(
              target: LatLng(11.551088453367658, 104.93626745546725),
              zoom: 16,
            ),
            markers: {
              Marker(
                markerId: const MarkerId("Best Star KTV"),
                position: const LatLng(11.551088453367658, 104.93626745546725),
                icon: sourceIcon,
              )
            },
            onMapCreated: (GoogleMapController mapController) {
              mapController.setMapStyle(AppMap.map);
            },
          ),
        ),
      ),
    );
  }

  Widget detailBooking(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: defaultPaddin),
      children: [
        _buildListTile(
          Icons.pin_drop_rounded,
          "St.123, #12, Veal Vong, 7 Makara, PP",
          textStyle: AppTextStyle.body,
        ),
        _buildListTile(
          Icons.delivery_dining,
          "10-20 min",
          textStyle: AppTextStyle.body,
        ),
        _buildListTile(
          Icons.running_with_errors,
          viewModel.bookingList[id].status,
          textStyle: AppTextStyle.body.copyWith(
            color: viewModel.bookingList[id].status == "Pending"
                ? Colors.yellow
                : viewModel.bookingList[id].status == "Accepted"
                    ? Colors.green
                    : viewModel.bookingList[id].status == "Rejected"
                        ? Colors.red
                        : primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget? navigationButton(BuildContext context) {
    if (viewModel.bookingList[id].status == "Success") {
      return Padding(
        padding: const EdgeInsets.only(bottom: defaultPaddin),
        child: Container(
          margin: const EdgeInsets.all(defaultPaddin),
          padding: const EdgeInsets.all(defaultPaddin),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Re-Booking',
            textAlign: TextAlign.center,
            style: AppTextStyle.headline2,
          ),
        ),
      );
    }
    return null;
  }

  Widget _buildIconText(IconData iconData, String text) {
    return Row(
      children: [
        Icon(
          iconData,
          color: whiteColor,
          size: 14,
        ),
        const SizedBox(width: 3),
        Text(
          text,
          style: AppTextStyle.body,
        ),
      ],
    );
  }

  Widget _buildListTile(
    IconData iconData,
    String text, {
    required TextStyle textStyle,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(defaultPaddin / 2),
        decoration: BoxDecoration(
          color: secondColor,
          borderRadius: BorderRadius.circular(defaultPaddin / 2),
        ),
        child: Icon(
          iconData,
          color: whiteColor,
          size: 28,
        ),
      ),
      title: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
