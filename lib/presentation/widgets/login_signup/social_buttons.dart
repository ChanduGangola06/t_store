import 'package:flutter/material.dart';
import 'package:t_store/core/utils/constants/colors.dart';
import 'package:t_store/core/utils/constants/image_strings.dart';
import 'package:t_store/core/utils/constants/sizes.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(TSizes.xs),
          decoration: BoxDecoration(
              border: Border.all(color: TColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                width: TSizes.iconMd + 4,
                height: TSizes.iconMd + 4,
                image: AssetImage(TImages.google),
              )),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Container(
          padding: const EdgeInsets.all(TSizes.xs),
          decoration: BoxDecoration(
              border: Border.all(color: TColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                width: TSizes.iconMd + 4,
                height: TSizes.iconMd + 4,
                image: AssetImage(TImages.facebook),
              )),
        ),
      ],
    );
  }
}
