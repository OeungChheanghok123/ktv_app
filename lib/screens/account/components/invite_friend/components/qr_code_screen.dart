import 'package:flutter/material.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/utility/app_bar.dart';
import 'package:ktv_app/utility/button.dart';
import 'package:ktv_app/utility/text_style.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeScreen extends StatelessWidget {
  const QRCodeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBarWidget.simpleAppbarWidget(context, 'Scan QR Code'),
        body: _body(context),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: defaultPaddin,
            vertical: defaultPaddin,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Material(
              color: whiteColor,
              child: Ink(
                width: MediaQuery.of(context).size.width,
                child: _buildQRCode(context),
              ),
            ),
          ),
        ),
        _buttonRow(context),
        const SizedBox(height: defaultPaddin * 4),
      ],
    );
  }

  Widget _buildQRCode(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          color: secondColor,
          child: Center(
            child: Text(
              "KTV App",
              style: AppTextStyle.headline1.copyWith(color: primaryColor),
            ),
          ),
        ),
        const SizedBox(height: defaultPaddin * 2),
        Text(
          "Scan QR Code",
          style: AppTextStyle.headline1.copyWith(color: blackColor),
        ),
        const SizedBox(height: defaultPaddin / 2),
        Text(
          "Ask your friend to open smart phone camera\nand shoot it!",
          textAlign: TextAlign.center,
          style: AppTextStyle.headline2.copyWith(color: blackColor),
        ),
        const SizedBox(height: defaultPaddin),
        QrImage(
          data: "https://www.youtube.com/",
          version: QrVersions.auto,
          backgroundColor: noneColor,
          foregroundColor: primaryColor,
          size: 300.0,
          gapless: false,
          errorCorrectionLevel: QrErrorCorrectLevel.L,
        ),
        const SizedBox(height: defaultPaddin * 2),
      ],
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
              'Download',
              leftIcon: Icons.download,
              borderRadius: defaultPaddin,
              onTap: () {},
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: AppButton.button(
              'Share',
              leftIcon: Icons.share,
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
}
