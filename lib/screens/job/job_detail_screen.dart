import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/screens/job/job_defail_view_model.dart';
import 'package:ktv_app/utility/app_bar.dart';
import 'package:ktv_app/utility/text_style.dart';

class JobDetailScreen extends StatelessWidget {
  final int index;
  final String title;
  final String salary;
  JobDetailScreen({
    super.key,
    required this.index,
    required this.title,
    required this.salary,
  });

  final double bigImageHeight = 200;
  final double smallImageHeight = 100;

  final viewModel = Get.put(JobDetailViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBarWidget.simpleAppbarWidget(
        context,
        "Job Details",
        actionIcon: "assets/icons/love-heart.svg",
        height: 24,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            imageBooking(context),
            companyProfile(context),
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
          child: jobDetail(context),
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
          image: AssetImage('assets/images/job_detail.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget jobDetail(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: defaultPaddin),
      padding: const EdgeInsets.all(defaultPaddin),
      decoration: BoxDecoration(
        color: secondColor,
        borderRadius: BorderRadius.circular(defaultPaddin / 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: defaultPaddin),
                  child: Text(
                    "BUSINESS MANAGER (1000 USD - 2000 USD)",
                    softWrap: true,
                    style: AppTextStyle.headline2.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Text(
                  "\$1000-\$2000",
                  style: AppTextStyle.headline2.copyWith(
                    color: primaryColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            child: Wrap(
              direction: Axis.horizontal,
              children: List.generate(
                viewModel.mainRequirement.length,
                (index) => _mainRequirement(
                  viewModel.mainRequirement[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget companyProfile(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(defaultPaddin),
      decoration: BoxDecoration(
        color: secondColor,
        borderRadius: BorderRadius.circular(defaultPaddin / 2),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          vertical: defaultPaddin / 4,
          horizontal: defaultPaddin,
        ),
        minVerticalPadding: 0,
        isThreeLine: true,
        leading: const CircleAvatar(
          backgroundColor: primaryColor,
          backgroundImage: AssetImage('assets/images/ktv_logo.jpg'),
          radius: 30,
        ),
        title: Text(
          'GOLDEN FARM CO.,LTD',
          style: AppTextStyle.headline2.copyWith(
            color: whiteColor,
          ),
        ),
        subtitle: Container(
          margin: const EdgeInsets.only(top: defaultPaddin / 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '>200People | Food & Beverages | Others',
                style: AppTextStyle.body.copyWith(
                  color: secondGraydColor,
                  fontSize: 11,
                ),
              ),
              Text(
                'Location: Phnom Penh',
                style: AppTextStyle.body.copyWith(
                  color: secondGraydColor,
                  fontSize: 11,
                ),
              ),
              Text(
                'Company Benefits: No',
                style: AppTextStyle.body.copyWith(
                  color: secondGraydColor,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _mainRequirement(String txt) {
    return Container(
      margin: const EdgeInsets.only(
        top: defaultPaddin / 2,
        right: defaultPaddin / 2,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: defaultPaddin / 4,
        horizontal: defaultPaddin / 2,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(defaultPaddin / 2),
      ),
      child: Text(
        txt,
        style: AppTextStyle.body.copyWith(
          fontSize: 10,
        ),
      ),
    );
  }
}
