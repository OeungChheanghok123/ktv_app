import 'package:flutter/material.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:ktv_app/utility/text_style.dart';

class AppWidget {
  static Widget largePost(
    BuildContext context, {
    required VoidCallback onPress,
  }) {
    return Container(
      margin: const EdgeInsets.only(left: defaultPaddin),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Material(
          color: secondColor,
          child: InkWell(
            onTap: onPress, 
            splashColor: primaryColor,
            child: Stack(
              children: [
                Ink(
                  padding: const EdgeInsets.all(defaultPaddin / 2),
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 138,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/category_1.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: defaultPaddin / 2),
                              Text(
                                'Best Star KTV (Toul Kok)',
                                style: AppTextStyle.headline2,
                              ),
                              const SizedBox(height: defaultPaddin / 2),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: const Icon(
                                          Icons.star,
                                          color: primaryColor,
                                          size: 21,
                                        ),
                                      ),
                                      const SizedBox(width: 3),
                                      Text(
                                        '5',
                                        style: AppTextStyle.body.copyWith(
                                          color: secondGraydColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: defaultPaddin / 2),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: const Icon(
                                          Icons.monetization_on,
                                          color: primaryColor,
                                          size: 21,
                                        ),
                                      ),
                                      const SizedBox(width: 3),
                                      Text(
                                        'From \$50/set',
                                        style: AppTextStyle.body.copyWith(
                                          color: secondGraydColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: defaultPaddin / 2),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: const Icon(
                                          Icons.motorcycle,
                                          color: primaryColor,
                                          size: 21,
                                        ),
                                      ),
                                      const SizedBox(width: 3),
                                      Text(
                                        '10-20min',
                                        style: AppTextStyle.body.copyWith(
                                          color: secondGraydColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: defaultPaddin / 2),
                            child: Icon(Icons.favorite, color: primaryColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: 55,
                    height: 35,
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
        ),
      ),
    );
  }
}