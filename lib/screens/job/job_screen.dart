import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/models/job.dart';
import 'package:ktv_app/screens/job/job_view_model.dart';
import 'package:ktv_app/utility/text_style.dart';

class JobScreen extends StatelessWidget {
  JobScreen({super.key});

  final viewModel = Get.put(JobViewModel());

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
              'Job',
              style: AppTextStyle.headline1,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(
              viewModel.jobList.length,
              (index) => cardJobPost(
                context,
                index: index,
                jobModel: viewModel.jobList[index],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget cardJobPost(
    BuildContext context, {
    required int index,
    required JobModel jobModel,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(defaultPaddin / 2),
      margin: const EdgeInsets.symmetric(
        horizontal: defaultPaddin,
        vertical: defaultPaddin / 2,
      ),
      decoration: BoxDecoration(
        color: secondColor,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: jobImage(
                  context,
                  image: jobModel.image,
                ),
              ),
              const SizedBox(width: defaultPaddin / 2),
              Expanded(
                flex: 4,
                child: jobDetail(
                  context,
                  position: jobModel.position,
                  name: jobModel.name,
                  address: jobModel.address,
                  salary: jobModel.salary,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: deadLineWidget(
              context,
              deadLine: jobModel.deadLine,
            ),
          ),
          Positioned(
            top: 0,
            right: 10,
            child: InkWell(
              onTap: () {
                if (viewModel.favoriteList[index] == false) {
                  viewModel.favoriteList[index] = true;
                } else {
                  viewModel.favoriteList[index] = false;
                }
              },
              child: favoriteIcon(context, index),
            ),
          ),
        ],
      ),
    );
  }

  Widget jobImage(
    BuildContext context, {
    required String image,
  }) {
    return Container(
      width: 120,
      height: 95,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(13),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget jobDetail(
    BuildContext context, {
    required String position,
    required String name,
    required String address,
    required String salary,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: defaultPaddin),
          child: Text(
            position,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.headline2.copyWith(
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: defaultPaddin / 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            listTile(
              context,
              name,
            ),
            const SizedBox(height: defaultPaddin / 6),
            listTile(
              context,
              address,
            ),
            const SizedBox(height: defaultPaddin / 6),
            listTile(
              context,
              salary,
            ),
          ],
        ),
      ],
    );
  }

  Widget deadLineWidget(
    BuildContext context, {
    required String deadLine,
  }) {
    return Row(
      children: [
        Text(
          'DeadLine: ',
          style: AppTextStyle.headline2,
        ),
        Text(
          deadLine,
          style: AppTextStyle.headline2.copyWith(
            color: whiteColor,
          ),
        ),
      ],
    );
  }

  Widget favoriteIcon(
    BuildContext context,
    int index,
  ) {
    return Obx(
      () => Icon(
        viewModel.favoriteList[index] == true
            ? Icons.favorite_rounded
            : Icons.favorite_border_rounded,
        color: viewModel.favoriteList[index] == true
            ? primaryColor
            : secondGraydColor,
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
