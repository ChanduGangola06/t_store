import 'package:get/get.dart';
import 'package:t_store/data/datasources/local/dummy_data.dart';
import 'package:t_store/data/models/brand_model.dart';
import 'package:t_store/data/models/product_model.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  /// -- Get All Brands
  List<BrandModel> getAllBrands() {
    final brands = DummyData.brands.toList();
    return brands;
  }

  /// -- Get Brand Products
  List<ProductModel> getBrandProducts(String brandId) {
    // Fetch products against each brand;
    final products = DummyData.products
        .where((product) => product.brand?.id == brandId)
        .toList();
    return products;
  }
}
