import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/core/utils/constants/sizes.dart';
import 'package:t_store/presentation/pages/cart/widgets/cart_items.dart';
import 'package:t_store/presentation/pages/checkout/checkout.dart';
import 'package:t_store/presentation/widgets/appbar/appbar.dart';

import '../../controllers/cart_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      /// -- AppBar
      appBar: TAppBar(
          title:
              Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// -- Items in Cart
              TCartItems(),
              SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ),

      /// -- Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Get.to(
              () => const CheckoutScreen(),
            ),
            child: Obx(
              () => Text('Checkout \$${controller.totalCartPrice.value}'),
            ),
          ),
        ),
      ),
    );
  }
}
