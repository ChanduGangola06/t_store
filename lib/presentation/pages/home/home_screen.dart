import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/core/utils/constants/image_strings.dart';
import 'package:t_store/core/utils/constants/sizes.dart';
import 'package:t_store/core/utils/constants/text_strings.dart';
import 'package:t_store/core/utils/device/device_utility.dart';
import 'package:t_store/data/datasources/local/dummy_data.dart';
import 'package:t_store/presentation/pages/all_products/all_products.dart';
import 'package:t_store/presentation/pages/home/widgets/header_categories.dart';
import 'package:t_store/presentation/pages/home/widgets/header_search_container.dart';
import 'package:t_store/presentation/pages/home/widgets/promo_slider.dart';
import 'package:t_store/presentation/pages/profile/profile_screen.dart';
import 'package:t_store/presentation/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/presentation/widgets/products/layouts/grid_layout.dart';
import 'package:t_store/presentation/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/presentation/widgets/texts/section_heading.dart';
import 'package:t_store/presentation/widgets/user/user_appbar_profile_card.dart';

import '../../controllers/home_controller.dart';
import '../cart/cart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final featuredProducts = controller.getFeaturedProducts();
    final popularProducts = controller.getPopularProducts();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            TPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- Appbar
                  TUserAppBarProfileCard(
                    title: TTexts.homeAppbarTitle,
                    subTitle: TTexts.homeAppbarSubTitle,
                    userCardOnPressed: () => Get.to(
                      () => const ProfileScreen(),
                    ),
                    actionButtonOnPressed: () => Get.to(
                      () => const CartScreen(),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Searchbar
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                    child: THeaderSearchContainer(showBackground: true),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Categories
                  const THeaderCategories(),
                  const SizedBox(height: TSizes.spaceBtwSections * 2),
                ],
              ),
            ),

            /// -- Body
            Container(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- Promo Slider 1
                  const TPromoSlider(banners: [
                    TImages.promoBanner1,
                    TImages.promoBanner2,
                    TImages.promoBanner3
                  ]),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Popular Products
                  TSectionHeading(
                    title: TTexts.popularProducts,
                    showActionButton: true,
                    onPressed: () => Get.to(() => AllProducts(
                        title: TTexts.popularProducts,
                        products: DummyData.products)),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TGridLayout(
                    itemCount: featuredProducts.length,
                    itemBuilder: (_, index) =>
                        TProductCardVertical(product: featuredProducts[index]),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections * 2),

                  /// -- Promo Slider 2
                  const TPromoSlider(banners: [
                    TImages.banner2,
                    TImages.banner3,
                    TImages.banner4
                  ]),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Popular Products
                  TSectionHeading(
                    title: TTexts.popularProducts,
                    showActionButton: true,
                    onPressed: () => Get.to(
                      () => AllProducts(
                          title: TTexts.popularProducts,
                          products: DummyData.products),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TGridLayout(
                    itemCount: popularProducts.length,
                    itemBuilder: (_, index) =>
                        TProductCardVertical(product: popularProducts[index]),
                  ),
                  SizedBox(
                      height: TDeviceUtils.getBottomNavigationBarHeight() +
                          TSizes.defaultSpace),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
