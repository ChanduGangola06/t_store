import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/core/utils/constants/sizes.dart';
import 'package:t_store/presentation/widgets/appbar/appbar.dart';
import 'package:t_store/presentation/widgets/brands/brand_products_count.dart';
import 'package:t_store/presentation/widgets/products/layouts/grid_layout.dart';
import 'package:t_store/presentation/widgets/texts/section_heading.dart';

import '../../controllers/brand_controller.dart';
import 'brand.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    final brands = controller.getAllBrands();
    return Scaffold(
      appBar: const TAppBar(showBackArrowIcon: true, title: Text('Brand')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Sub Categories
              const TSectionHeading(title: 'Brands'),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// -- Brands
              TGridLayout(
                itemCount: brands.length,
                mainAxisExtent: 80,
                itemBuilder: (_, index) {
                  final brand = brands[index];
                  return TBrandWithProductsCount(
                    brand: brand,
                    showBorder: true,
                    onTap: () => Get.to(
                      () => BrandScreen(brand: brand),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
