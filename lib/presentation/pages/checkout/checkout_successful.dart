import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/core/utils/constants/image_strings.dart';
import 'package:t_store/core/utils/constants/sizes.dart';
import 'package:t_store/core/utils/device/device_utility.dart';
import 'package:t_store/presentation/pages/menu/home_menu.dart';

class CheckoutSuccessfulScreen extends StatelessWidget {
  const CheckoutSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TDeviceUtils.getAppBarHeight()),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: TSizes.spaceBtwSections * 4),
              Image(
                image: const AssetImage(TImages.successfulPaymentIcon),
                width: TDeviceUtils.getScreenWidth(context) * 0.5,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Text('Payment Success!',
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text('Your item will be shipped soon!',
                  style: Theme.of(context).textTheme.labelMedium),
              const SizedBox(height: TSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(
                    const MenuScreen(),
                  ),
                  child: const Text('Continue Shopping'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
