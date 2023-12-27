import 'package:get/get.dart';
import 'package:t_store/presentation/controllers/checkout_controller.dart';
import 'package:t_store/presentation/controllers/product_controller.dart';

import '../controllers/address_controller.dart';
import '../controllers/brand_controller.dart';
import '../controllers/cart_controller.dart';
import '../controllers/categories_controller.dart';
import '../controllers/user_controller.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    /// -- Product Controllers
    Get.put(ProductController());
    Get.put(CartController());
    Get.put(CheckoutController());
    Get.put(CategoryController());
    Get.put(BrandController());

    /// -- User Controllers
    Get.put(UserController());
    Get.put(AddressController());
  }
}
