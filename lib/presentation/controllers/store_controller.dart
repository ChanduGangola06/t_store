import 'package:get/get.dart';
import 'package:t_store/data/datasources/local/dummy_data.dart';
import 'package:t_store/data/models/brand_model.dart';
import 'package:t_store/data/models/category_model.dart';
import 'package:t_store/data/models/product_model.dart';
import 'package:t_store/presentation/controllers/categories_controller.dart';

class StoreController extends GetxController {
  static StoreController get instance => Get.find();

  List<CategoryModel> getFeaturedCategories() {
    return CategoryController.instance.getFeaturedCategories(8);
  }

  List<BrandModel> getFeaturedBrands() {
    // Get Featured Brands from your data source
    return DummyData.brands
        .where((brand) => brand.isFeatured ?? false)
        .take(4)
        .toList();
  }

  List<ProductModel> getBrandProducts(String brandId) {
    // Get Featured Brands from your data source
    return DummyData.products
        .where((product) => product.brand!.id == brandId)
        .take(3)
        .toList();
  }

  List<BrandModel> getCategoryBrands(String categoryId) {
    // Get Brands
    final brands = DummyData.brandCategories
        .where((brandCategory) => brandCategory.categoryId == categoryId)
        .map((e) =>
            DummyData.brands.where((brand) => brand.id == e.brandId).single)
        .take(2)
        .toList();

    return brands;
  }

  List<ProductModel> getCategoryProducts(String categoryId) {
    // Use .toSet() to get unique products.
    // First we have to get all subCategories of this Category if any.
    // Example: Category is Sports -> Sub Categories are Running Shoes, Tracksuits etc
    final subCategoryIds = DummyData.categories
        .where((element) => element.parentId == categoryId)
        .map((e) => e.id)
        .toList();

    // Get products based on category and sub Categories
    final products = DummyData.productCategories
        .where((productCategory) =>
            productCategory.categoryId == categoryId ||
            subCategoryIds.contains(productCategory.categoryId))
        .map((e) => DummyData.products
            .where((product) => product.id == e.productId)
            .single)
        .toSet()
        .toList();

    return products;
  }
}
