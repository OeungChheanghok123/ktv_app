import 'package:flutter/material.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/utility/app_bar.dart';
import 'package:ktv_app/utility/text_style.dart';

class JobScreen extends StatelessWidget {
  const JobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: AppBarWidget.homeScreenAppBar,
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(5, (index) => cardJobPost(context)),
        ),
      ),
    );
  }

  Widget cardJobPost(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(defaultPaddin / 2),
      margin: const EdgeInsets.symmetric(
          horizontal: defaultPaddin, vertical: defaultPaddin / 2),
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
                child: Container(
                  width: 120,
                  height: 95,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(13),
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/category_1.jpg',
                      ),
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
                      'IT Project Manager',
                      style: AppTextStyle.headline2.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: defaultPaddin / 4),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        listTile(
                          context,
                          "Best Star KTV (Toul Kok)",
                        ),
                        const SizedBox(height: defaultPaddin / 6),
                        listTile(
                          context,
                          "St.123, #12, Veal Vong, 7 Makara, PhnomPenh",
                        ),
                        const SizedBox(height: defaultPaddin / 6),
                        listTile(
                          context,
                          "Negotiate",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Row(
              children: [
                Text(
                  'DeadLine: ',
                  style: AppTextStyle.headline2,
                ),
                Text(
                  '28-Feb-2023',
                  style: AppTextStyle.headline2.copyWith(
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            top: 0,
            right: 10,
            child: Icon(
              Icons.favorite_border_rounded,
              color: secondGraydColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget listTile(BuildContext context, String text) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: defaultPaddin / 2),
          decoration: const BoxDecoration(
            color: primaryColor,
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
