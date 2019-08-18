import '../models/category-list-item.model.dart';
import '../models/product-list-item.model.dart';
import '../repositories/category.repository.dart';
import '../repositories/product.repository.dart';
import 'package:flutter/widgets.dart';

// ChangeNotifier - unciona como pub/sub, se o estado alterar avisa a tela pra alterar
class HomeBloc extends ChangeNotifier {
  final categoryRepository = new CategoryRepository();
  final productRepository = new ProductRepository();

  List<ProductListItemModel> products;
  List<CategoryListItemModel> categories;
  String selectedCategory = 'todos';

  HomeBloc() {
    getCategories();
    getProducts();
  }

  getCategories() {
    categoryRepository.getAll().then((data) {
      this.categories = data;
      notifyListeners(); // notifica que o estado mudou e a tela tem que refletir a mudança
    });
  }

  getProducts() {
    productRepository.getAll().then((data) {
      this.products = data;
      notifyListeners(); // notifica que o estado mudou e a tela tem que refletir a mudança
    });
  }

  getProductsByCategory() {
    productRepository.getByCategory(selectedCategory).then((data) {
      this.products = data;
      notifyListeners(); // notifica que o estado mudou e a tela tem que refletir a mudança
    });
  }

  changeCategory(tag) {
    selectedCategory = tag;
    products = null;
    getProductsByCategory();
    notifyListeners(); // notifica que o estado mudou e a tela tem que refletir a mudança
  }
}
