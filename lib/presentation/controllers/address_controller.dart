import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/core/utils/constants/sizes.dart';
import 'package:t_store/data/datasources/local/dummy_data.dart';
import 'package:t_store/data/models/address_model.dart';
import 'package:t_store/presentation/pages/address/add_new_address.dart';
import 'package:t_store/presentation/pages/address/widgets/single_address_widget.dart';
import 'package:t_store/presentation/widgets/texts/section_heading.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;

  // Add init to initialize some address by default.
  @override
  void onInit() {
    selectedAddress.value = DummyData.user.addresses![0];
    super.onInit();
  }

  Future<dynamic> selectNewAddress(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(TSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TSectionHeading(title: 'Select Address'),
              Column(
                children: DummyData.user.addresses!
                    .map((address) => TSingleAddressWidget(
                          address: address,
                          onTap: () {
                            selectedAddress.value = address;
                            Get.back();
                          },
                        ))
                    .toList(),
              ),
              const SizedBox(height: TSizes.defaultSpace * 2),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(
                          () => const AddNewAddressScreen(),
                        ),
                    child: const Text('Add new address')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
