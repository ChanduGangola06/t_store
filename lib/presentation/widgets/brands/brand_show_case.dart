import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/core/utils/constants/colors.dart';
import 'package:t_store/core/utils/constants/sizes.dart';
import 'package:t_store/core/utils/helpers/helper_functions.dart';
import 'package:t_store/data/models/brand_model.dart';
import 'package:t_store/presentation/pages/brand/brand.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 'brand_products_count.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({super.key, required this.brand, required this.images});

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(BrandScreen(brand: brand)),
      child: TRoundedContainer(
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        showBorder: true,
        borderColor: TColors.darkGrey,
        backgroundColor: Colors.transparent,
        child: Column(
          children: [
            /// Brand with Products Count
            TBrandWithProductsCount(showBorder: false, brand: brand),
            const SizedBox(height: TSizes.spaceBtwItems / 2),

            /// Brand Top 3 Product Images
            Row(
                children: images
                    .map((e) => brandTopProductImageWidget(e, context))
                    .toList()),
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? TColors.darkerGrey
            : TColors.light,
        margin: const EdgeInsets.only(right: TSizes.sm),
        child: Image(fit: BoxFit.contain, image: AssetImage(image)),
      ),
    );
  }
}
