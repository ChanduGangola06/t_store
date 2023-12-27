import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/core/utils/constants/colors.dart';
import 'package:t_store/core/utils/constants/enums.dart';
import 'package:t_store/core/utils/constants/sizes.dart';
import 'package:t_store/core/utils/helpers/helper_functions.dart';
import 'package:t_store/data/models/product_model.dart';
import 'package:t_store/data/models/product_variation_model.dart';
import 'package:t_store/presentation/controllers/cart_controller.dart';
import 'package:t_store/presentation/controllers/product_controller.dart';
import '../../../pages/product_detail/product_detail.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../texts/t_brand_title_text_with_verified_icon.dart';
import '../../texts/t_product_price_text.dart';
import '../../texts/t_product_title_text.dart';
import '../favourite_icon/favourite_icon.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final salePercentage = ProductController.instance
        .calculateSalePercentage(product.price, product.salePrice);
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetail(product: product)),

      /// Container with side paddings, color, edges, radius and shadow.
      child: Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.lightContainer,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Thumbnail
            TRoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: isDark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  /// -- Thumbnail Image
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(TSizes.productImageRadius),
                      child: Image(
                          image: AssetImage(product.thumbnail),
                          fit: BoxFit.contain),
                    ),
                  ),

                  /// -- Sale Tag
                  if (salePercentage != null)
                    Positioned(
                      top: 12,
                      left: 0,
                      child: TRoundedContainer(
                        backgroundColor: isDark
                            ? TColors.secondary.withOpacity(0.8)
                            : TColors.secondary.withOpacity(0.8),
                        radius: TSizes.sm,
                        padding: const EdgeInsets.symmetric(
                            horizontal: TSizes.sm, vertical: TSizes.xs),
                        child: Text('$salePercentage%',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: TColors.black)),
                      ),
                    ),

                  /// -- Favourite Icon Button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: TFavouriteIcon(productId: product.id),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),

            /// -- Details, Add to Cart, & Pricing
            Container(
              padding: const EdgeInsets.only(left: TSizes.sm),
              width: 172,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- Details
                  Padding(
                    padding: const EdgeInsets.only(top: TSizes.sm),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TProductTitleText(
                          title: product.title,
                          smallSize: true,
                          maxLines: 2,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems / 2),
                        TBrandTitleWithVerifiedIcon(
                            title: product.brand!.name,
                            brandTextSize: TextSizes.small),
                      ],
                    ),
                  ),

                  /// Price & Add to cart button
                  /// Use Spacer() to utilize all the space and set the price and cart button at the bottom.
                  /// This usually happens when Product title is in single line or 2 lines (Max)
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Pricing
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Actual Price if sale price not null
                            if (product.productVariations == null &&
                                product.salePrice != null &&
                                product.salePrice! > 0)
                              Padding(
                                padding: const EdgeInsets.only(left: TSizes.sm),
                                child: Text(
                                  product.price.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .apply(
                                          decoration:
                                              TextDecoration.lineThrough),
                                ),
                              ),

                            /// Price, Show sale price as main price if sale exist.
                            Padding(
                              padding: const EdgeInsets.only(left: TSizes.sm),
                              child: TProductPriceText(
                                  price: ProductController.instance
                                      .getProductPrice(product)),
                            ),
                          ],
                        ),
                      ),

                      /// Add to cart
                      GestureDetector(
                        onTap: () {
                          // If the product have variations then show the product Details for variation selection.
                          // ELse add product to the cart.
                          if (product.productVariations == null) {
                            cartController.addSingleItemToCart(
                                product, ProductVariationModel.empty());
                          } else {
                            Get.to(() => ProductDetail(product: product));
                          }
                        },
                        child: Obx(
                          () {
                            final productQuantityInCart = cartController
                                .calculateSingleProductCartEntries(
                                    product.id, '');

                            return AnimatedContainer(
                              curve: Curves.easeInOutCubicEmphasized,
                              decoration: BoxDecoration(
                                color: productQuantityInCart > 0
                                    ? TColors.primary
                                    : TColors.dark,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(TSizes.cardRadiusMd),
                                  bottomRight: Radius.circular(
                                      TSizes.productImageRadius),
                                ),
                              ),
                              duration: const Duration(milliseconds: 300),
                              child: SizedBox(
                                width: TSizes.iconLg * 1.2,
                                height: TSizes.iconLg * 1.2,
                                child: Center(
                                  child: productQuantityInCart > 0
                                      ? Text(productQuantityInCart.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .apply(color: TColors.white))
                                      : const Icon(Iconsax.add,
                                          color: TColors.white),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
