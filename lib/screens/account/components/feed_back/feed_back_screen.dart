import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/screens/account/components/feed_back/feed_back_view_model.dart';
import 'package:ktv_app/utility/app_bar.dart';
import 'package:ktv_app/utility/button.dart';
import 'package:ktv_app/utility/text_style.dart';
import 'package:ktv_app/utility/widgets.dart';

class FeedBackScreen extends StatelessWidget {
  FeedBackScreen({super.key});

  final controller = Get.put(FeedBackViewModel());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBarWidget.simpleAppbarWidget(context, 'Feedback Us'),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppWidget.bigImage(context, "assets/icons/feed-back.svg"),
              const SizedBox(height: defaultPaddin),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: defaultPaddin),
                child: Text(
                  'Rate your experience',
                  style: AppTextStyle.headline2.copyWith(color: whiteColor),
                ),
              ),
              const SizedBox(height: defaultPaddin / 2),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: defaultPaddin),
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPaddin / 2),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: secondGraydColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Center(
                  child: _ratingStar(5),
                ),
              ),
              const SizedBox(height: defaultPaddin * 2),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: defaultPaddin),
                child: Text(
                  'Write your comment',
                  style: AppTextStyle.headline2.copyWith(color: whiteColor),
                ),
              ),
              const SizedBox(height: defaultPaddin / 2),
              _textField(context),
              const SizedBox(height: defaultPaddin * 2),
              _button(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _ratingStar(int index) {
    return RatingBar.builder(
      initialRating: 0,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: index,
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: primaryColor,
      ),
      unratedColor: secondColor,
      wrapAlignment: WrapAlignment.spaceAround,
      itemPadding: const EdgeInsets.symmetric(horizontal: defaultPaddin / 2),
      onRatingUpdate: (rating) {},
    );
  }

  Widget _textField(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: defaultPaddin),
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: TextField(
        controller: controller.commentController,
        style: AppTextStyle.headline2,
        maxLines: 10,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(defaultPaddin),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: secondGraydColor, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(defaultPaddin)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: secondGraydColor, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(defaultPaddin)),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: whiteColor, width: 2.0),
          ),
        ),
        onSubmitted: (val) {},
        onChanged: (String val) {},
      ),
    );
  }

  Widget _button(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: AppButton.button(
        'Submit',
        leftIcon: Icons.download_done,
        borderRadius: defaultPaddin,
        onTap: () {},
      ),
    );
  }
}
