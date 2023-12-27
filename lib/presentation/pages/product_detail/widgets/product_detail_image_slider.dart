import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/presentation/controllers/product_controller.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/helpers/helper_functions.dart';
import '../../../../data/models/product_model.dart';
import '../../../widgets/appbar/appbar.dart';
import '../../../widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../widgets/images/t_rounded_image.dart';
import '../../../widgets/products/favourite_icon/favourite_icon.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final isDark = THelperFunctions.isDarkMode(context);
    final images = controller.getAllProductImages(product);
    return TCurvedEdgesWidget(
      child: Container(
        color: isDark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace * 2),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Center(
                        child: SizedBox(
                          child: Obx(() {
                            final image =
                                controller.selectedProductImage.value.isEmpty
                                    ? product.thumbnail
                                    : controller.selectedProductImage.value;
                            return GestureDetector(
                                onTap: () =>
                                    controller.showEnlargedImage(image),
                                child: Image(
                                    image: AssetImage(image),
                                    fit: BoxFit.contain));
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  // new
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: TSizes.spaceBtwItems),
                  itemCount: images.length,
                  itemBuilder: (_, index) {
                    return Obx(
                      () {
                        final imageSelected =
                            controller.selectedProductImage.value ==
                                images[index];
                        return TRoundedImage(
                          onPressed: () => controller
                              .selectedProductImage.value = images[index],
                          width: 80,
                          fit: BoxFit.contain,
                          padding: const EdgeInsets.all(TSizes.sm),
                          backgroundColor:
                              isDark ? TColors.dark : TColors.white,
                          border: Border.all(
                              color: imageSelected
                                  ? TColors.primary
                                  : Colors.transparent),
                          imageUrl: images[index],
                        );
                      },
                    );
                  },
                ),
              ),
            ),

            /// Appbar Icons
            TAppBar(
              showBackArrowIcon: true,
              actions: [
                TFavouriteIcon(productId: product.id),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
