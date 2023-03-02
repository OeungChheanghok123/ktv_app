import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/screens/detail/detail_screen_view_model.dart';
import 'package:ktv_app/screens/detail/view_set/view_set.dart';
import 'package:ktv_app/screens/home/components/view_all.dart';
import 'package:ktv_app/screens/home/home_view_model.dart';
import 'package:ktv_app/utility/app_bar.dart';
import 'package:ktv_app/utility/map_style.dart';
import 'package:ktv_app/utility/text_style.dart';
import 'package:ktv_app/utility/widgets.dart';

class DetailScreen extends StatelessWidget {
  final int selectedIndex;
  DetailScreen({Key? key, required this.selectedIndex}) : super(key: key);

  final CarouselController carouselController = CarouselController();
  final viewModel = Get.put(DetailScreenViewModel());
  final homeViewModel = Get.put(HomeViewModel());

  Widget imagePost(BuildContext context) {
    viewModel.imageIndex.value = 0;
    final imageData = homeViewModel.popularList[selectedIndex].images!;

    return Stack(
      children: [
        CarouselSlider(
          carouselController: carouselController,
          options: CarouselOptions(
            height: 220.0,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: imageData.length > 1 ? true : false,
            disableCenter: true,
            reverse: false,
            enlargeCenterPage: true,
            enlargeFactor: 0.2,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              viewModel.imageIndex.value = index;
            },
          ),
          items: imageData.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: secondGraydColor,
                    image: DecorationImage(
                      image: AssetImage(i.path),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        imageData.length > 1
            ? Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: InkWell(
                  onTap: () {
                    carouselController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.fastOutSlowIn,
                    );
                  },
                  child: Center(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: const BoxDecoration(
                        color: secondGraydColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(3),
                          bottomRight: Radius.circular(3),
                        ),
                      ),
                      width: 40,
                      height: 40,
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back_rounded,
                          size: 28,
                          color: secondColor,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Container(),
        imageData.length > 1
            ? Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: InkWell(
                  onTap: () {
                    carouselController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.fastOutSlowIn,
                    );
                  },
                  child: Center(
                    child: Container(
                      alignment: Alignment.centerRight,
                      decoration: const BoxDecoration(
                        color: secondGraydColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(3),
                          bottomLeft: Radius.circular(3),
                        ),
                      ),
                      width: 40,
                      height: 40,
                      child: const Center(
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          size: 28,
                          color: secondColor,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Container(),
        Positioned(
          bottom: 5,
          right: 5,
          child: Container(
            width: 55,
            height: 35,
            decoration: BoxDecoration(
              color: whiteColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => Text(
                    '${viewModel.imageIndex.value + 1}/',
                    style: AppTextStyle.title2.copyWith(
                      letterSpacing: 3,
                    ),
                  ),
                ),
                Text(
                  "${imageData.length}",
                  style: AppTextStyle.title2,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget detailPost(BuildContext context) {
    viewModel.favoriteIcon.value =
        homeViewModel.popularList[selectedIndex].isFavorite;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: defaultPaddin / 2),
      padding: const EdgeInsets.symmetric(horizontal: defaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: List.generate(
                    homeViewModel
                        .popularList[selectedIndex].postCategory.length, (i) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: defaultPaddin / 2,
                      vertical: defaultPaddin / 4,
                    ),
                    margin: const EdgeInsets.only(right: defaultPaddin / 2),
                    decoration: BoxDecoration(
                      color: secondColor,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Text(
                      homeViewModel
                          .popularList[selectedIndex].postCategory[i].name,
                      style: AppTextStyle.title2.copyWith(fontSize: 10),
                    ),
                  );
                }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  homeViewModel.popularList[selectedIndex].rating.toInt(),
                  (index) => const Icon(
                    Icons.star,
                    color: primaryColor,
                    size: 18,
                  ),
                ),
              ),
              _iconAndText(Icons.two_wheeler, '10-20min'),
              const Spacer(),
              Obx(
                () => InkWell(
                  onTap: () {
                    viewModel.favoriteIcon.value =
                        !viewModel.favoriteIcon.value;
                    homeViewModel.popularList[selectedIndex].isFavorite =
                        viewModel.favoriteIcon.value;
                  },
                  child: Icon(
                    viewModel.favoriteIcon.value
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_rounded,
                    color: viewModel.favoriteIcon.value
                        ? primaryColor
                        : secondGraydColor,
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultPaddin / 2),
          Text(
            homeViewModel.popularList[selectedIndex].name,
            style: AppTextStyle.headline1,
          ),
          const SizedBox(height: defaultPaddin / 4),
          Text.rich(
            textAlign: TextAlign.justify,
            TextSpan(
              children: [
                const WidgetSpan(
                  child: Icon(
                    Icons.location_on_rounded,
                    color: primaryColor,
                    size: 16,
                  ),
                ),
                TextSpan(
                  text: ' ${homeViewModel.popularList[selectedIndex].address}',
                  style: AppTextStyle.body,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonBooking(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPaddin),
      margin: const EdgeInsets.symmetric(horizontal: defaultPaddin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: primaryColor,
      ),
      child: Center(
        child: Text(
          'Book Now',
          style: AppTextStyle.headline2,
        ),
      ),
    );
  }

  Widget description(BuildContext context) {
    if (homeViewModel.popularList[selectedIndex].description != null) {
      return Container(
        color: secondColor,
        padding: const EdgeInsets.all(defaultPaddin),
        margin: const EdgeInsets.only(top: defaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description',
              style: AppTextStyle.headline2,
            ),
            const SizedBox(height: defaultPaddin / 2),
            Text(
              '${homeViewModel.popularList[selectedIndex].description}',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
              style: AppTextStyle.title2,
            ),
            const SizedBox(height: defaultPaddin / 2),
            Text(
              'Read more',
              textAlign: TextAlign.justify,
              style: AppTextStyle.title2.copyWith(
                color: primaryColor,
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  Widget specialService(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(defaultPaddin),
      margin: const EdgeInsets.symmetric(vertical: defaultPaddin / 2),
      color: secondColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Special Service',
            style: AppTextStyle.headline2,
          ),
          const SizedBox(height: defaultPaddin / 2),
          Container(
            padding: const EdgeInsets.only(left: defaultPaddin / 6),
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              padding: const EdgeInsets.all(0),
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 15,
              mainAxisSpacing: 5,
              childAspectRatio: 8,
              children: List.generate(
                viewModel.specialServiceIconList.length,
                (index) => Container(
                  alignment: Alignment.topLeft,
                  child: _iconAndText(
                    viewModel.specialServiceIconList[index],
                    viewModel.specialServiceTitleList[index],
                    color: whiteColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget googleMap(BuildContext context) {
    final id = homeViewModel.popularList[selectedIndex].id;
    BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;

    return Padding(
      padding: const EdgeInsets.all(defaultPaddin),
      child: SizedBox(
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: GoogleMap(
            myLocationEnabled: false,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
            tiltGesturesEnabled: false,
            initialCameraPosition: const CameraPosition(
              target: LatLng(11.551088453367658, 104.93626745546725),
              zoom: 16,
            ),
            markers: {
              Marker(
                markerId: MarkerId(id.toString()),
                position: const LatLng(11.551088453367658, 104.93626745546725),
                icon: sourceIcon,
              )
            },
            onMapCreated: (GoogleMapController mapController) {
              mapController.setMapStyle(AppMap.map);
            },
          ),
        ),
      ),
    );
  }

  Widget gridViewMenuBar(BuildContext context) {
    final List<String> menuText = [
      "All Set",
      "Popular",
      "Discount",
    ];
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: defaultPaddin,
        vertical: defaultPaddin / 2,
      ),
      decoration: BoxDecoration(
        color: secondColor,
        borderRadius: BorderRadius.circular(13),
      ),
      child: GridView.count(
        crossAxisCount: menuText.length,
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        physics: const BouncingScrollPhysics(),
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 3.5,
        children: List.generate(
          menuText.length,
          (index) {
            return Obx(
              () => InkWell(
                onTap: () => viewModel.menuIndex.value = index,
                child: Container(
                  decoration: BoxDecoration(
                    color: index == viewModel.menuIndex.value
                        ? primaryColor
                        : secondColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 2,
                      color: noneColor,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      menuText[index],
                      style: AppTextStyle.headline2.copyWith(
                        color: index == viewModel.menuIndex.value
                            ? whiteColor
                            : secondGraydColor,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget detailListView(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: homeViewModel.popularList[selectedIndex].itemSet!.length,
      itemBuilder: (context, index) {
        return _detailListViewItems(context, index);
      },
    );
  }

  Widget similarListView(BuildContext context) {
    return Column(
      children: [
        ViewAll(
          tilte: 'Similar',
          onPress: () {},
        ),
        SizedBox(
          height: 207,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return AppWidget.largePost(
                context,
                image: homeViewModel.popularList[index].backgroundImage,
                name: homeViewModel.popularList[index].name,
                rating: homeViewModel.popularList[index].rating,
                isFavorite: homeViewModel.popularList[index].isFavorite,
                onPress: () {},
              );
            },
          ),
        ),
      ],
    );
  }

  Widget navigationButton(BuildContext context) {
    return Obx(
      () {
        if (viewModel.buttonClicked.isTrue) {
          return InkWell(
            onTap: () {
              _buildModalBottomSheet(context);
            },
            child: Container(
              margin: const EdgeInsets.all(defaultPaddin),
              padding: const EdgeInsets.all(defaultPaddin),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'View Booking',
                textAlign: TextAlign.center,
                style: AppTextStyle.headline2,
              ),
            ),
          );
        } else {
          return Container(
            height: 0.5,
          );
        }
      },
    );
  }

  Widget _detailListViewItems(BuildContext context, int i) {
    final setItems = homeViewModel.popularList[selectedIndex].itemSet![i];
    return InkWell(
      splashColor: primaryColor,
      onTap: () {
        viewModel.setIndex.value = i;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewSet(selectedIndex: i),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(
          horizontal: defaultPaddin,
          vertical: defaultPaddin / 2,
        ),
        decoration: BoxDecoration(
          color: secondColor,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.all(defaultPaddin / 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(setItems.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(defaultPaddin / 2),
                    padding: const EdgeInsets.only(right: defaultPaddin / 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              setItems.title,
                              style: AppTextStyle.headline2.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: defaultPaddin / 2),
                            setItems.popular == true
                                ? Container(
                                    padding:
                                        const EdgeInsets.all(defaultPaddin / 4),
                                    decoration: BoxDecoration(
                                      color: bgColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.whatshot,
                                          size: 13,
                                          color: secondGraydColor,
                                        ),
                                        const SizedBox(
                                            width: defaultPaddin / 6),
                                        Text(
                                          'Popular',
                                          style:
                                              AppTextStyle.headline2.copyWith(
                                            color: secondGraydColor,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                        const SizedBox(height: defaultPaddin / 4),
                        Text(
                          setItems.subTitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                          style: AppTextStyle.body.copyWith(
                            color: secondGraydColor,
                          ),
                        ),
                        const SizedBox(height: defaultPaddin),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              style: AppTextStyle.headline2,
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '\$${setItems.price}',
                                  ),
                                  const WidgetSpan(
                                    child: SizedBox(width: defaultPaddin / 4),
                                  ),
                                  const TextSpan(
                                    text: '\$35.00',
                                    style: TextStyle(
                                      color: secondGraydColor,
                                      decorationThickness: 2,
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: secondGraydColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            _buttonAdd(context, i),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 45,
                height: 25,
                decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Center(
                  child: Text('50%', style: AppTextStyle.headline2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconAndText(
    IconData iconData,
    String text, {
    Color color = secondGraydColor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        color == secondGraydColor
            ? const SizedBox(width: defaultPaddin / 2)
            : const SizedBox.shrink(),
        Icon(
          iconData,
          size: 21,
          color: color,
        ),
        const SizedBox(width: defaultPaddin / 2),
        Text(
          text,
          style: AppTextStyle.headline2.copyWith(
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buttonAdd(BuildContext context, int i) {
    return Obx(
      () {
        if (viewModel.buttonClicked.isFalse) {
          return InkWell(
            onTap: () {
              viewModel.buttonClicked.value = true;
            },
            child: Container(
              decoration: BoxDecoration(
                color: bgColor,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2,
                  color: bgColor,
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.add,
                  color: whiteColor,
                  size: 21,
                ),
              ),
            ),
          );
        } else {
          return _buttonIncreaseAndDecrease(context);
        }
      },
    );
  }

  Widget _buttonIncreaseAndDecrease(BuildContext context) {
    var qty = 1.obs;
    return Row(
      children: [
        InkWell(
          onTap: () {
            if (qty.value > 1) {
              qty.value = qty.value - 1;
            } else {
              qty.value = 1;
              viewModel.buttonClicked.value = false;
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: bgColor,
              border: Border.all(
                width: 2,
                color: bgColor,
              ),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.remove,
                color: whiteColor,
                size: 16,
              ),
            ),
          ),
        ),
        Obx(
          () => Text(
            '   $qty   ',
            style: AppTextStyle.body.copyWith(fontSize: 11),
          ),
        ),
        InkWell(
          onTap: () {
            qty.value = qty.value + 1;
          },
          child: Container(
            decoration: BoxDecoration(
              color: bgColor,
              border: Border.all(
                width: 2,
                color: bgColor,
              ),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.add,
                color: whiteColor,
                size: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future _buildModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (ctx) => Container(
        padding: const EdgeInsets.all(defaultPaddin),
        color: bgColor,
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(
              child: Container(
                width: 100,
                height: 3,
                color: secondGraydColor,
              ),
            ),
            const SizedBox(height: defaultPaddin),
            Container(
              margin: const EdgeInsets.only(
                left: defaultPaddin / 2,
                bottom: defaultPaddin / 2,
              ),
              child: Text(
                'Your Item',
                textAlign: TextAlign.left,
                style: AppTextStyle.headline2.copyWith(
                  color: whiteColor,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: defaultPaddin / 2,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPaddin,
                vertical: defaultPaddin / 2,
              ),
              decoration: BoxDecoration(
                color: secondColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  top: defaultPaddin / 2,
                ),
                child: Column(
                  children: List.generate(
                    3,
                    (index) => Container(
                      margin: const EdgeInsets.only(
                        bottom: defaultPaddin / 2,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${index + 1}.',
                              style: AppTextStyle.headline2,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              ' Set Battambong X1',
                              style: AppTextStyle.headline2,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '\$35.00',
                            style: AppTextStyle.headline2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: defaultPaddin),
            Container(
              margin: const EdgeInsets.only(
                left: defaultPaddin / 2,
                bottom: defaultPaddin / 2,
              ),
              child: Text(
                'Time',
                style: AppTextStyle.headline2.copyWith(
                  color: whiteColor,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: defaultPaddin / 2,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPaddin * 4,
                vertical: defaultPaddin,
              ),
              decoration: BoxDecoration(
                color: secondColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Text(
                    'Start',
                    style: AppTextStyle.headline2,
                  ),
                  const SizedBox(width: defaultPaddin),
                  Text(
                    '10:30PM',
                    style: AppTextStyle.headline2,
                  ),
                  const Spacer(),
                  Text(
                    'To',
                    style: AppTextStyle.headline2,
                  ),
                  const SizedBox(width: defaultPaddin),
                  Text(
                    '12:30AM',
                    style: AppTextStyle.headline2,
                  ),
                ],
              ),
            ),
            const SizedBox(height: defaultPaddin * 2),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: defaultPaddin,
                  horizontal: defaultPaddin / 2,
                ),
                padding: const EdgeInsets.all(defaultPaddin),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Book Now',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.headline2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: bgColor,
      appBar: AppBarWidget.simpleAppbarWidget(
        context,
        homeViewModel.popularList[selectedIndex].name,
        actionIcon: "assets/icons/map.svg",
        height: 21,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: RawScrollbar(
          thumbVisibility: false,
          scrollbarOrientation: ScrollbarOrientation.right,
          thumbColor: secondColor,
          radius: const Radius.circular(20),
          thickness: 5,
          child: ListView(
            children: [
              imagePost(context),
              detailPost(context),
              buttonBooking(context),
              description(context),
              specialService(context),
              googleMap(context),
              gridViewMenuBar(context),
              detailListView(context),
              similarListView(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: defaultPaddin),
        child: navigationButton(context),
      ),
    );
  }
}
