import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/core/utils/constants/colors.dart';
import 'package:t_store/core/utils/constants/sizes.dart';
import 'package:t_store/presentation/widgets/images/t_rounded_image.dart';

import '../../../controllers/home_controller.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({super.key, required this.banners});

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
          items: [
            TRoundedImage(
                clip: true,
                height: null,
                width: double.infinity,
                imageUrl: banners[0],
                backgroundColor: Colors.transparent),
            TRoundedImage(
              clip: true,
              height: null,
              width: double.infinity,
              imageUrl: banners[1],
              backgroundColor: Colors.transparent,
            ),
            TRoundedImage(
              clip: true,
              height: null,
              width: double.infinity,
              imageUrl: banners[2],
              backgroundColor: Colors.transparent,
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < 3; i++)
                  Container(
                    width: 20,
                    height: 4,
                    margin: EdgeInsets.only(right: i == 2 ? 0 : 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: controller.carousalCurrentIndex.value == i
                          ? TColors.primary
                          : Colors.grey,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
