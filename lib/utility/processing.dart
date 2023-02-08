import 'package:flutter/material.dart';
import 'package:ktv_app/constants/constants.dart';
import 'package:skeletons/skeletons.dart';

class AppProcessing {
    static Widget smallPost(BuildContext context) {
    return Container(
      height: 89,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
          horizontal: defaultPaddin, vertical: defaultPaddin / 2),
      padding: const EdgeInsets.all(defaultPaddin / 2),
      decoration: BoxDecoration(
        color: secondColor,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          SkeletonAvatar(
            style: SkeletonAvatarStyle(
              borderRadius: BorderRadius.circular(13),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.3,
            ),
          ),
          const SizedBox(
            width: defaultPaddin / 2,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SkeletonLine(
                  style: SkeletonLineStyle(
                    height: 21,
                    width: MediaQuery.of(context).size.width * 0.4,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SkeletonLine(
                  style: SkeletonLineStyle(
                    height: 21,
                    width: MediaQuery.of(context).size.width * 0.3,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Row(
                  children: [
                    SkeletonLine(
                      style: SkeletonLineStyle(
                        height: 21,
                        width: MediaQuery.of(context).size.width * 0.1,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(
                      width: defaultPaddin / 4,
                    ),
                    SkeletonLine(
                      style: SkeletonLineStyle(
                        height: 21,
                        width: MediaQuery.of(context).size.width * 0.1,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SkeletonAvatar(
            style: SkeletonAvatarStyle(
              shape: BoxShape.circle,
              height: 34,
              width: 34,
            ),
          ),
        ],
      ),
    );
  }

}