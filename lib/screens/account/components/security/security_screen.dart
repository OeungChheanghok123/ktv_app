import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/screens/account/components/security/security_view_model.dart';
import 'package:ktv_app/utility/app_bar.dart';
import 'package:ktv_app/utility/button.dart';
import 'package:ktv_app/utility/text_style.dart';
import 'package:ktv_app/utility/widgets.dart';

class SecurityScreen extends StatelessWidget {
  SecurityScreen({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(SecurityViewModel());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBarWidget.simpleAppbarWidget(context, 'Security'),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppWidget.bigImage(context, 'assets/icons/security.svg'),
              const SizedBox(height: defaultPaddin / 2),
              Text(
                'Change new password',
                style: AppTextStyle.headline1.copyWith(color: whiteColor),
              ),
              const SizedBox(height: defaultPaddin / 2),
              Text(
                'Your new password must be different\nfrom previous used passwords.',
                textAlign: TextAlign.center,
                style: AppTextStyle.headline2.copyWith(color: secondGraydColor),
              ),
              const SizedBox(height: defaultPaddin),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _textFieldOldPassword(context),
                  const SizedBox(height: defaultPaddin),
                  _textFieldNewPassword(context),
                  const SizedBox(height: defaultPaddin),
                  _textFieldConfirmPassword(context),
                  const SizedBox(height: defaultPaddin * 2),
                  _buttonSubmit('Change Password'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFieldOldPassword(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: defaultPaddin),
          child: Text(
            "Old Password",
            style: AppTextStyle.headline2,
          ),
        ),
        const SizedBox(height: defaultPaddin / 2),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: defaultPaddin),
          child: Obx(
            () => AppWidget.textField(
              context,
              controller.oldPasswordController,
              obscureText: controller.oldPassword.value ? false : true,
              iconData: controller.oldPassword.value
                  ? Icons.visibility
                  : Icons.visibility_off,
              onTap: () {
                controller.oldPassword.value = !controller.oldPassword.value;
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _textFieldNewPassword(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: defaultPaddin),
          child: Text(
            "New Password",
            style: AppTextStyle.headline2,
          ),
        ),
        const SizedBox(height: defaultPaddin / 2),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: defaultPaddin),
          child: Obx(
            () => AppWidget.textField(
              context,
              controller.newPasswordController,
              obscureText: controller.newPassword.value ? false : true,
              iconData: controller.newPassword.value
                  ? Icons.visibility
                  : Icons.visibility_off,
              onTap: () {
                controller.newPassword.value = !controller.newPassword.value;
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _textFieldConfirmPassword(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: defaultPaddin),
          child: Text(
            "Confirm Password",
            style: AppTextStyle.headline2,
          ),
        ),
        const SizedBox(height: defaultPaddin / 2),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: defaultPaddin),
          child: Obx(
            () => AppWidget.textField(
              context,
              controller.confirmPasswordController,
              obscureText: controller.confirmPassword.value ? false : true,
              iconData: controller.confirmPassword.value
                  ? Icons.visibility
                  : Icons.visibility_off,
              onTap: () {
                controller.confirmPassword.value =
                    !controller.confirmPassword.value;
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buttonSubmit(String txt) {
    return AppButton.button(
      txt,
      leftIcon: Icons.published_with_changes,
      borderRadius: defaultPaddin,
      onTap: () {
        debugPrint('Button is clicked!');
      },
    );
  }
}
