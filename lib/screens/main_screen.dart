import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/screens/main_screen_view_model.dart';
import 'package:ktv_app/utility/app_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: AppBarWidget.homeScreenAppBar,
        body: getBody,
      ),
      bottomNavigationBar: getBottomBar,
    );
  }

  Widget get getBody {
    return Obx(
      () => MainScreenViewModel.pageWidgets.elementAt(
        MainScreenViewModel.tabIndex.value,
      ),
    );
  }

  Widget get getBottomBar {
    return Obx(
      () => BottomNavigationBar(
        backgroundColor: secondColor,
        unselectedItemColor: secondGraydColor,
        selectedItemColor: primaryColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: MainScreenViewModel.tabIndex.value,
        items: MainScreenViewModel.bottomBarItem,
        onTap: (index) => MainScreenViewModel.tabIndex.value = index,
      ),
    );
  }
}
