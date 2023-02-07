import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/utility/text_style.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      backgroundColor: bgColor,
      appBar: BackdropAppBar(
        backgroundColor: bgColor,
        title: const Text('Backdrop demo'),
      ),
      headerHeight: MediaQuery.of(context).size.height - 500,
      frontLayerBorderRadius: BorderRadius.zero,
      frontLayerBackgroundColor: bgColor,
      frontLayer: Center(
        child: Text(
          '(front layer) \n Click top-right button to show back layer.\n\n'
          "There's no flutter official backdrop widget, this demo uses the "
          "'backdrop' package.",
          style: AppTextStyle.headline2,
        ),
      ),
      backLayerBackgroundColor: primaryColor,
      backLayer: const Center(child: Text('(back layer)')),
    );
  }
}
