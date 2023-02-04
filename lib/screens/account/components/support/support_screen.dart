import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/utility/app_bar.dart';
import 'package:ktv_app/utility/text_style.dart';
import 'package:ktv_app/utility/widgets.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBarWidget.simpleAppbarWidget(context, 'Needs Suppot'),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppWidget.bigImage(context, "assets/icons/support.svg"),
            const SizedBox(height: defaultPaddin),
            Text(
              'How can we help you?',
              style: AppTextStyle.headline1.copyWith(color: whiteColor),
            ),
            const SizedBox(height: defaultPaddin),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: defaultPaddin),
              child: Text(
                'It look like you are experiencing problems with our process. We are here to help, so please get in touch with us.',
                textAlign: TextAlign.center,
                style: AppTextStyle.headline2,
              ),
            ),
            const SizedBox(height: defaultPaddin * 2),
            _buttonTextWidget(context),
          ],
        ),
      ),
    );
  }

  Widget _buttonTextWidget(BuildContext context) {
    final List<String> buttonText = [
      "Call to Us",
      "Email Us",
    ];
    final List<String> buttonIcon = [
      "assets/icons/phone.svg",
      "assets/icons/e-mail.svg",
    ];

    return Container(
      width: MediaQuery.of(context).size.width,
      color: bgColor,
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: defaultPaddin * 2),
        physics: const BouncingScrollPhysics(),
        mainAxisSpacing: 0,
        crossAxisSpacing: 40,
        childAspectRatio: 1.3,
        children: List.generate(buttonText.length, (index) {
          return InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: secondColor,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: defaultPaddin),
                    child: SvgPicture.asset(
                      buttonIcon[index],
                      color: whiteColor,
                      height: 45,
                    ),
                  ),
                  Text(
                    buttonText[index],
                    style: AppTextStyle.headline1.copyWith(
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
