import 'package:get/get.dart';
import 'package:t_store/data/datasources/local/dummy_data.dart';
import 'package:t_store/data/models/category_model.dart';
import 'package:t_store/data/models/product_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  /// -- Load selected category data
  List<CategoryModel> getFeaturedCategories(int take) {
    // Get Featured Brands from your data source
    return DummyData.categories
        .where((category) =>
            (category.isFeatured ?? false) && category.parentId == null)
        .take(take)
        .toList();
  }

  /// -- Load selected category data
  List<CategoryModel> getSubCategories(String categoryId) {
    // Fetch all categories where ParentId = categoryId;
    final subCategories = DummyData.categories
        .where((category) => category.parentId == categoryId)
        .toList();
    return subCategories;
  }

  /// -- Get Sub-Category Products
  List<ProductModel> getSubCategoryProducts(String subCategoryId, int take) {
    // Fetch limited (4) products against each subCategory;
    final products = DummyData.products
        .where((product) => product.categoryId == subCategoryId)
        .take(take)
        .toList();
    return products;
  }
}
