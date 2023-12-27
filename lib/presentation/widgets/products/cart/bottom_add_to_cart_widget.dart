import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/core/utils/constants/colors.dart';
import 'package:t_store/core/utils/constants/sizes.dart';
import 'package:t_store/core/utils/helpers/helper_functions.dart';
import 'package:t_store/data/models/product_model.dart';
import 'package:t_store/presentation/controllers/product_controller.dart';
import 'add_remove_cart_button.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final productController = ProductController.instance;
    productController.initializeAlreadyAddedProductCount(product);
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? TColors.darkerGrey : TColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg),
        ),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Add OR Remove Cart Product Icon Buttons
            TAddRemoveCartButtons(
              quantity: productController.cartQuantity.value,
              add: () => productController.cartQuantity.value += 1,
              // Disable remove when cart count is less then 1
              remove: () => productController.cartQuantity.value < 1
                  ? null
                  : productController.cartQuantity.value -= 1,
            ),
            // Add to cart button
            ElevatedButton(
              onPressed: productController.cartQuantity.value < 1
                  ? null
                  : () => productController.addProductToCart(product),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: TColors.black,
                side: const BorderSide(color: TColors.black),
              ),
              child: const Row(
                children: [
                  Icon(Iconsax.shopping_bag),
                  SizedBox(width: TSizes.spaceBtwItems / 2),
                  Text('Add to Bag')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
