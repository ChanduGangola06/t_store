import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/core/utils/constants/colors.dart';
import 'package:t_store/core/utils/constants/sizes.dart';
import 'package:t_store/core/utils/helpers/helper_functions.dart';
import 'package:t_store/data/datasources/local/dummy_data.dart';
import 'package:t_store/presentation/widgets/appbar/appbar.dart';
import 'package:t_store/presentation/widgets/image_text/image_text_vertical.dart';
import 'package:t_store/presentation/widgets/products/layouts/grid_layout.dart';
import 'package:t_store/presentation/widgets/texts/section_heading.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrowIcon: false,
        title:
            Text('Search', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Cancel'))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Search bar & Filter Button
              Row(
                children: [
                  /// Search
                  Expanded(
                    child: TextFormField(
                      autofocus: true,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.search_normal),
                          hintText: 'Search'),
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),

                  /// Filter
                  OutlinedButton(
                    onPressed: () => filterModalBottomSheet(context),
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey)),
                    child: const Icon(Iconsax.setting, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Brands
              const TSectionHeading(title: 'Brands'),
              Wrap(
                children: DummyData.brands
                    .map((brand) => Padding(
                          padding: const EdgeInsets.only(top: TSizes.md),
                          child: TImageTextVertical(
                            image: brand.image,
                            title: brand.name,
                            textColor: THelperFunctions.isDarkMode(context)
                                ? TColors.white
                                : TColors.dark,
                            backgroundColor:
                                THelperFunctions.isDarkMode(context)
                                    ? TColors.darkerGrey
                                    : TColors.light,
                          ),
                        ))
                    .toList(),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Categories
              const TSectionHeading(title: 'Categories'),
              const SizedBox(height: TSizes.spaceBtwItems),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (_, __) =>
                      const SizedBox(height: TSizes.spaceBtwItems),
                  itemCount: DummyData.categories.length,
                  shrinkWrap: true,
                  itemBuilder: (_, index) => Row(
                        children: [
                          Image(
                            width: 25,
                            height: 25,
                            color: isDark ? TColors.white : TColors.dark,
                            image:
                                AssetImage(DummyData.categories[index].image),
                          ),
                          const SizedBox(width: TSizes.spaceBtwItems / 2),
                          Text(DummyData.categories[index].name)
                        ],
                      )),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> filterModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          left: TSizes.defaultSpace,
          right: TSizes.defaultSpace,
          top: TSizes.defaultSpace,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Heading
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TSectionHeading(title: 'Filter'),
                  IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Iconsax.close_square))
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections / 2),

              /// Sort
              Text('Sort by', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: TSizes.spaceBtwItems / 2),

              TGridLayout(
                mainAxisExtent: 20,
                itemCount: DummyData.sortingFilters.length,
                itemBuilder: (_, index) => Row(
                  children: [
                    const Icon(Icons.circle_outlined, size: 18),
                    const SizedBox(width: TSizes.spaceBtwItems / 2),
                    Flexible(
                        child: Text(DummyData.sortingFilters[index].name,
                            overflow: TextOverflow.ellipsis, maxLines: 1)),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Categories

              Text('Category', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: TSizes.spaceBtwItems),
              TGridLayout(
                mainAxisExtent: 20,
                itemCount: DummyData.categories.length,
                itemBuilder: (_, index) => InkWell(
                  onTap: () {},
                  splashColor: THelperFunctions.isDarkMode(context)
                      ? TColors.darkerGrey
                      : Colors.grey,
                  child: Row(
                    children: [
                      const Icon(Icons.circle_outlined, size: 18),
                      const SizedBox(width: TSizes.spaceBtwItems / 2),
                      Flexible(
                          child: Text(DummyData.categories[index].name,
                              overflow: TextOverflow.ellipsis, maxLines: 1)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Sort by Radios
              Text('Pricing', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: '\$ Lowest'),
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: '\$ Highest'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Apply'),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
