import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/core/utils/constants/sizes.dart';
import 'package:t_store/core/utils/device/device_utility.dart';
import 'package:t_store/presentation/pages/store/store_screen.dart';
import 'package:t_store/presentation/widgets/appbar/appbar.dart';
import 'package:t_store/presentation/widgets/icons/t_circular_icon.dart';
import 'package:t_store/presentation/widgets/products/layouts/grid_layout.dart';
import 'package:t_store/presentation/widgets/products/product_cards/product_card_vertical.dart';

import '../../controllers/product_controller.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrowIcon: false,
        title:
            Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(
              () => const StoreScreen(),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Obx(() {
                final products = ProductController.instance.favoriteProducts();
                return TGridLayout(
                  itemCount: products.length,
                  itemBuilder: (_, index) =>
                      TProductCardVertical(product: products[index]),
                );
              }),
              SizedBox(
                  height: TDeviceUtils.getBottomNavigationBarHeight() +
                      TSizes.defaultSpace),
            ],
          ),
        ),
      ),
    );
  }
}
