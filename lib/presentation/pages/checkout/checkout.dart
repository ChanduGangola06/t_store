import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/core/utils/constants/colors.dart';
import 'package:t_store/core/utils/constants/sizes.dart';
import 'package:t_store/core/utils/helpers/helper_functions.dart';
import 'package:t_store/core/utils/helpers/pricing_calculator.dart';
import 'package:t_store/data/datasources/local/dummy_data.dart';
import 'package:t_store/presentation/pages/cart/widgets/cart_items.dart';
import 'package:t_store/presentation/pages/checkout/checkout_successful.dart';
import 'package:t_store/presentation/pages/checkout/widgets/billing_address_section.dart';
import 'package:t_store/presentation/pages/checkout/widgets/billing_payment_section.dart';
import 'package:t_store/presentation/widgets/appbar/appbar.dart';
import 'package:t_store/presentation/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/presentation/widgets/products/cart/billing_amount_section.dart';
import 'package:t_store/presentation/widgets/products/cart/coupon_code.dart';

import '../../controllers/cart_controller.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Order Review'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// -- Items in Cart
              const TCartItems(showAddRemoveButtons: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// -- Coupon TextField
              const TCouponCodeWidget(),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// -- Billing Section
              TRoundedContainer(
                showBorder: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                child: Column(
                  children: [
                    /// Pricing
                    TBillingAmountSection(subTotal: subTotal),

                    /// Divider
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    /// Payment Methods
                    const TBillingPaymentSection(),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    /// Address
                    TBillingAddressSection(
                      name: DummyData.user.fullName,
                      phoneNumber: DummyData.user.formattedPhoneNo,
                      address: DummyData.user.addresses.toString(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
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
              () => const CheckoutSuccessfulScreen(),
            ),
            child: Text(
                'Checkout \$${TPricingCalculator.calculateTotalPrice(subTotal, 'US')}'),
          ),
        ),
      ),
    );
  }
}
