import 'package:flutter/material.dart';
import 'package:t_store/core/utils/constants/sizes.dart';
import 'package:t_store/data/models/brand_model.dart';
import 'package:t_store/presentation/pages/all_products/all_products.dart';
import 'package:t_store/presentation/widgets/appbar/appbar.dart';
import 'package:t_store/presentation/widgets/brands/brand_products_count.dart';
import 'package:t_store/presentation/widgets/texts/section_heading.dart';

import '../../controllers/brand_controller.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    final brandProducts = controller.getBrandProducts(brand.id);
    return Scaffold(
      appBar: const TAppBar(showBackArrowIcon: true, title: Text('Brand')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              TBrandWithProductsCount(brand: brand, showBorder: true),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Sub Categories
              const TSectionHeading(title: 'Products'),
              const SizedBox(height: TSizes.spaceBtwItems),
              TSortableProductList(products: brandProducts)
            ],
          ),
        ),
      ),
    );
  }
}
