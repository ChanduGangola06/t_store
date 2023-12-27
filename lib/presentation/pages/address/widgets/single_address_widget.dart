import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/core/utils/constants/colors.dart';
import 'package:t_store/core/utils/constants/sizes.dart';
import 'package:t_store/core/utils/helpers/helper_functions.dart';
import 'package:t_store/data/models/address_model.dart';
import 'package:t_store/presentation/controllers/address_controller.dart';

class TSingleAddressWidget extends StatelessWidget {
  const TSingleAddressWidget({
    super.key,
    required this.address,
    required this.onTap,
  });

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Obx(
      () {
        final selectedAddressId = controller.selectedAddress.value.id;
        return GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: TSizes.defaultSpace,
                vertical: TSizes.defaultSpace / 2),
            child: Row(
              children: [
                Icon(
                  selectedAddressId == address.id
                      ? Iconsax.tick_circle1
                      : Iconsax.tick_circle1,
                  color: selectedAddressId == address.id
                      ? TColors.primary
                      : dark
                          ? TColors.darkerGrey
                          : TColors.grey,
                ),
                const SizedBox(width: TSizes.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(address.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: TSizes.sm / 2),
                      Text(address.formattedPhoneNo,
                          maxLines: 1, overflow: TextOverflow.ellipsis),
                      const SizedBox(height: TSizes.sm / 2),
                      Text(address.toString(), softWrap: true),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
