import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/screens/account/components/profile/profile_view_model.dart';
import 'package:ktv_app/utility/app_bar.dart';
import 'package:ktv_app/utility/button.dart';
import 'package:ktv_app/utility/text_style.dart';
import 'package:ktv_app/utility/widgets.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(ProfileViewModel());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBarWidget.simpleAppbarWidget(context, 'Profile'),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _profileImage(context),
              const SizedBox(height: defaultPaddin),
              _textFieldWidget(
                context,
                txt: "Name",
                controller: controller.nameController,
                width: MediaQuery.of(context).size.width,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _textFieldWidget(
                    context,
                    txt: "Sex",
                    controller: controller.sexController,
                    width: MediaQuery.of(context).size.width / 3,
                  ),
                  _textFieldWidget(
                    context,
                    txt: "Birthday",
                    controller: controller.birthdayController,
                    width: MediaQuery.of(context).size.width / 2,
                    textInputType: TextInputType.datetime,
                  ),
                ],
              ),
              _textFieldWidget(
                context,
                txt: "Phone Number *",
                controller: controller.phoneController,
                width: MediaQuery.of(context).size.width,
                textInputType: TextInputType.phone,
                iconData: Icons.check_circle,
                suffixText: "verified",
              ),
              _textFieldWidget(
                context,
                txt: "Email",
                controller: controller.emailController,
                width: MediaQuery.of(context).size.width,
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: defaultPaddin),
              AppButton.button(
                'Edit',
                borderRadius: defaultPaddin,
                leftIcon: Icons.edit,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileImage(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: defaultPaddin * 4,
        vertical: defaultPaddin / 2,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Material(
          color: secondColor,
          child: Ink(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(
              vertical: defaultPaddin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 89,
                  child: Image.asset(
                    'assets/images/map_currentLocation.png',
                  ),
                ),
                const SizedBox(height: defaultPaddin / 2),
                Text(
                  'Blang Vibol',
                  style: AppTextStyle.headline1.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: defaultPaddin / 4),
                Text(
                  '#yuf6582hg',
                  style: AppTextStyle.headline2.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textFieldWidget(
    BuildContext context, {
    required String txt,
    required TextEditingController controller,
    required double width,
    TextInputType textInputType = TextInputType.text,
    IconData? iconData,
    String? suffixText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: defaultPaddin),
          child: Text(
            txt,
            style: AppTextStyle.headline2,
          ),
        ),
        const SizedBox(height: defaultPaddin / 2),
        Container(
          width: width,
          margin: const EdgeInsets.symmetric(horizontal: defaultPaddin),
          child: AppWidget.textField(
            context,
            controller,
            textInputType: textInputType,
            iconData: iconData,
            suffixText: suffixText,
          ),
        ),
        const SizedBox(height: defaultPaddin),
      ],
    );
  }
}
