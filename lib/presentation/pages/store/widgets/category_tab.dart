import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/models/category_model.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../controllers/store_controller.dart';
import '../../../widgets/brands/brand_show_case.dart';
import '../../../widgets/products/layouts/grid_layout.dart';
import '../../../widgets/products/product_cards/product_card_vertical.dart';
import '../../../widgets/texts/section_heading.dart';
import '../../all_products/all_products.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = StoreController.instance;
    final categoryBrands = controller.getCategoryBrands(category.id);
    final categoryProducts = controller.getCategoryProducts(category.id);
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Brands
              Column(
                children: categoryBrands
                    .map((brand) => TBrandShowcase(
                          brand: brand,
                          images: controller
                              .getBrandProducts(brand.id)
                              .map((e) => e.thumbnail)
                              .toList(),
                        ))
                    .toList(),
              ),
              const SizedBox(height: TSizes.spaceBtwSections * 2),

              /// -- Products You May Like
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TSectionHeading(
                    title: 'You might like',
                    showActionButton: true,
                    onPressed: () => Get.to(AllProducts(
                        title: category.name, products: categoryProducts)),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TGridLayout(
                    itemCount: categoryProducts.length < 4
                        ? categoryProducts.length
                        : 4,
                    itemBuilder: (_, index) =>
                        TProductCardVertical(product: categoryProducts[index]),
                  ),
                ],
              ),

              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
