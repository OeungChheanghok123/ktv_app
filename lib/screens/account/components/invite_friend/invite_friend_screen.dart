import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/screens/account/components/invite_friend/components/qr_code_screen.dart';
import 'package:ktv_app/screens/account/components/invite_friend/invite_friend_view_model.dart';
import 'package:ktv_app/utility/app_bar.dart';
import 'package:ktv_app/utility/button.dart';
import 'package:ktv_app/utility/text_style.dart';
import 'package:ktv_app/utility/widgets.dart';

class InviteFriendScreen extends StatelessWidget {
  InviteFriendScreen({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InviteFriendViewModel());

  Future<void> shareLink() async {
    await FlutterShare.share(
      title: 'Share link to your friend',
      text: 'Blang Vibol',
      linkUrl: 'https://flutter.dev/',
      chooserTitle: 'KTV App',
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBarWidget.simpleAppbarWidget(context, 'Invite Friends'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppWidget.bigImage(context, 'assets/icons/invite-friend.svg'),
            const SizedBox(height: defaultPaddin / 2),
            _listInviteFriend(context),
            _buttonRow(context),
          ],
        ),
      ),
    );
  }

  Widget _listInviteFriend(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: defaultPaddin,
        vertical: defaultPaddin,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Material(
          color: secondColor,
          child: Ink(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(defaultPaddin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Invite friend, Get 3\$",
                    style: AppTextStyle.headline1.copyWith(color: whiteColor),
                  ),
                ),
                const SizedBox(height: defaultPaddin / 2),
                _buildListText(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonRow(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: defaultPaddin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: AppButton.button(
              'Share link',
              leftIcon: Icons.share,
              borderRadius: defaultPaddin,
              onTap: () => shareLink(),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: AppButton.button(
              'Scan QR code',
              leftIcon: Icons.qr_code,
              borderRadius: defaultPaddin,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const QRCodeScreen(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListText() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: defaultPaddin / 2),
            Text(
              "${index + 1}. Invite friend, Get 3\$",
              style: AppTextStyle.headline2,
            ),
          ],
        );
      },
    );
  }
}
