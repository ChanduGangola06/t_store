import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/core/utils/constants/colors.dart';
import 'package:t_store/core/utils/constants/sizes.dart';
import 'package:t_store/presentation/pages/category/sub_categories.dart';
import 'package:t_store/presentation/widgets/image_text/image_text_vertical.dart';
import 'package:t_store/presentation/widgets/texts/section_heading.dart';

import '../../../controllers/home_controller.dart';

class THeaderCategories extends StatelessWidget {
  const THeaderCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final categories = controller.getFeaturedCategories();
    return Padding(
      padding: const EdgeInsets.only(left: TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// -- Heading
          const TSectionHeading(
              title: 'Popular Categories', textColor: TColors.white),
          const SizedBox(height: TSizes.spaceBtwItems),

          /// -- Categories
          SizedBox(
            height: 80,
            child: ListView.builder(
              itemCount: categories.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final category = categories[index];
                return TImageTextVertical(
                  image: category.image,
                  title: category.name,
                  onTap: () =>
                      Get.to(() => SubCategoriesScreen(category: category)),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
