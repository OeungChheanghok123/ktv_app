import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/models/remote_data.dart';
import 'package:ktv_app/models/sort_by_model.dart';
import 'package:ktv_app/screens/search/search_view_model.dart';
import 'package:ktv_app/utility/processing.dart';
import 'package:ktv_app/utility/text_style.dart';
import 'package:ktv_app/utility/widgets.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  final searchViewModel = Get.put(SearchViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: getAppBar,
        body: getBody(context),
      ),
    );
  }

  List<Widget> getAppBar(context, innerBoxIsScrolled) {
    return [
      SliverAppBar(
        floating: true,
        snap: true,
        backgroundColor: bgColor,
        centerTitle: true,
        titleSpacing: 0,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: defaultPaddin),
          child: SizedBox(
            height: 40,
            child: Form(
              key: searchViewModel.searchFormKey,
              child: TextField(
                controller: searchViewModel.query,
                onSubmitted: (value) {
                  searchViewModel.search(value);
                },
                onChanged: (value) {
                  if (value.isEmpty) {
                    searchViewModel.setIsQuery(false);
                  }
                },
                style: AppTextStyle.headline2,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: AppTextStyle.headline2.copyWith(
                    color: secondGraydColor,
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(defaultPaddin * 2),
                    ),
                  ),
                  filled: true,
                  fillColor: secondColor,
                  contentPadding: EdgeInsets.zero,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: secondGraydColor,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () => searchViewModel.search(''),
                    child: const Icon(
                      Icons.close_rounded,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: bgColor.withOpacity(0),
              builder: (BuildContext context) {
                return getFilter(context);
              },
            ),
            child: Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(defaultPaddin / 1.5),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor,
              ),
              child: SvgPicture.asset(
                'assets/icons/filter.svg',
                height: 21,
                color: whiteColor,
              ),
            ),
          ),
          const SizedBox(width: defaultPaddin)
        ],
      ),
    ];
  }

  Widget getBody(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
        child: Column(
          children: [
            if (searchViewModel.isQuery == false) getSeacrchHistory(context),
            if (searchViewModel.isQuery == true) loadSearch(context),
          ],
        ),
      );
    });
  }

  Widget getFilter(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      margin: const EdgeInsets.symmetric(horizontal: defaultPaddin),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(13),
          topRight: Radius.circular(13),
        ),
        color: bgColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: defaultPaddin / 2),
            child: const Center(
              child: Icon(
                Icons.expand_more_rounded,
                color: primaryColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPaddin),
            child: Text(
              'Sort by',
              style: AppTextStyle.headline2,
            ),
          ),
          Column(
            children: SortByModel.data()
                .map(
                  (item) => sortBySelectCard(
                    value: item.value!,
                    text: item.text,
                    icon: item.icon,
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }

  Widget sortBySelectCard({
    required SortByModelValue value,
    required String text,
    required IconData icon,
  }) {
    return Obx(
      () {
        final selectedValue = searchViewModel.selectedSortBy;
        return GestureDetector(
          onTap: () => searchViewModel.setSortByIndex(value),
          child: Container(
            padding: const EdgeInsets.all(defaultPaddin),
            margin: const EdgeInsets.symmetric(
              horizontal: defaultPaddin,
              vertical: defaultPaddin / 4,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: value == selectedValue ? primaryColor : secondColor,
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: value == selectedValue ? whiteColor : secondGraydColor,
                ),
                const SizedBox(
                  width: defaultPaddin,
                ),
                Text(
                  text,
                  style: AppTextStyle.headline2.copyWith(
                    color:
                        value == selectedValue ? whiteColor : secondGraydColor,
                  ),
                ),
                const Spacer(),
                if (value == selectedValue)
                  const Icon(
                    Icons.check_rounded,
                    color: whiteColor,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget loadSearch(BuildContext context) {
    return Obx(() {
      final status = searchViewModel.searchData.status;
      if (status == RemoteDataStatus.processing) {
        return Column(
          children: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
              .map((item) => AppProcessing.smallPost(context))
              .toList(),
        );
      }
      if (status == RemoteDataStatus.error) {
        return Column(
          children: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
              .map((item) => AppProcessing.smallPost(context))
              .toList(),
        );
      } else {
        final searchData = searchViewModel.searchData.data;
        return Column(
          children:
              searchData!.map((item) => AppWidget.smallPost(context)).toList(),
        );
      }
    });
  }

  Widget getSeacrchHistory(BuildContext context) {
    return Obx(() {
      final status = searchViewModel.searchHistoryData.status;
      if (status == RemoteDataStatus.processing) {
        return const Center(child: Text('processing'));
      }
      if (status == RemoteDataStatus.error) {
        return const Center(child: Text('error'));
      } else {
        final searchHistoryData = searchViewModel.searchHistoryData.data;
        return Column(
          children: searchHistoryData!
              .map(
                (item) => ListTile(
                  title: GestureDetector(
                    onTap: () {
                      searchViewModel.setIsQuery(true);
                      searchViewModel.search(item);
                    },
                    child: Text(
                      item,
                      style: AppTextStyle.headline2,
                    ),
                  ),
                  leading: const Icon(
                    Icons.history_rounded,
                    color: secondGraydColor,
                  ),
                  trailing: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.close_rounded,
                      color: secondGraydColor,
                    ),
                  ),
                ),
              )
              .toList(),
        );
      }
    });
  }
}
