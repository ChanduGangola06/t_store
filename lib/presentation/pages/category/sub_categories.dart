import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/core/utils/constants/image_strings.dart';
import 'package:t_store/core/utils/constants/sizes.dart';
import 'package:t_store/presentation/pages/all_products/all_products.dart';
import 'package:t_store/presentation/widgets/appbar/appbar.dart';
import 'package:t_store/presentation/widgets/images/t_rounded_image.dart';
import 'package:t_store/presentation/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:t_store/presentation/widgets/texts/section_heading.dart';

import '../../../data/models/category_model.dart';
import '../../controllers/categories_controller.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrowIcon: true,
        title: Text(category.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const TRoundedImage(
                  width: double.infinity,
                  height: null,
                  imageUrl: TImages.banner3,
                  clip: true),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Sub Categories
              Column(
                children:
                    controller.getSubCategories(category.id).map((subCategory) {
                  final subCategoryProducts =
                      controller.getSubCategoryProducts(subCategory.id, 4);
                  return Column(
                    children: [
                      /// Sub Category Heading
                      TSectionHeading(
                        title: subCategory.name,
                        showActionButton: true,
                        onPressed: () => Get.to(
                          () => AllProducts(
                            title: subCategory.name,
                            products: controller.getSubCategoryProducts(
                                subCategory.id, 50),
                          ),
                        ),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 2),

                      /// Sub Category Products
                      SizedBox(
                        height: 120,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: subCategoryProducts.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: TSizes.spaceBtwItems),
                          itemBuilder: (context, index) =>
                              TProductCardHorizontal(
                                  product: subCategoryProducts[index]),
                        ),
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
