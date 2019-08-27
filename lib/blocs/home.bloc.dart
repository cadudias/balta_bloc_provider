import 'package:balta_bloc_providers/models/product-list-item.model.dart';
import 'package:balta_bloc_providers/repositories/category.repository.dart';
import 'package:balta_bloc_providers/repositories/product.repository.dart';

import '../models/category-list-item.model.dart';
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
