import 'package:get/get.dart';
import 'package:t_store/data/datasources/local/dummy_data.dart';
import 'package:t_store/data/models/category_model.dart';
import 'package:t_store/data/models/product_model.dart';
import 'package:t_store/presentation/controllers/categories_controller.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final carousalCurrentIndex = 0.obs;

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  List<CategoryModel> getFeaturedCategories() {
    return CategoryController.instance.getFeaturedCategories(8);
  }

  List<ProductModel> getFeaturedProducts() {
    // Get Featured Products from your data source
    return DummyData.products
        .where((product) => product.isFeatured ?? false)
        .take(6)
        .toList();
  }

  List<ProductModel> getPopularProducts() {
    // Get Popular Products from your data source
    // Currently, I'm just taking last 4 products
    return DummyData.products.sublist(DummyData.products.length - 4).toList();
  }
}
