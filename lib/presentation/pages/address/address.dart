import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/core/utils/constants/sizes.dart';
import 'package:t_store/data/datasources/local/dummy_data.dart';
import 'package:t_store/presentation/controllers/address_controller.dart';
import 'package:t_store/presentation/pages/address/add_new_address.dart';
import 'package:t_store/presentation/pages/address/widgets/single_address_widget.dart';
import 'package:t_store/presentation/widgets/appbar/appbar.dart';
import 'package:t_store/presentation/widgets/icons/t_circular_icon.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrowIcon: true,
        title:
            Text('Addresses', style: Theme.of(context).textTheme.headlineSmall),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(
              () => const AddNewAddressScreen(),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: DummyData.user.addresses!
                .map(
                  (address) => TSingleAddressWidget(
                      address: address,
                      onTap: () => controller.selectedAddress.value = address),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
