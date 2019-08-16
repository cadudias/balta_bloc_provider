import 'package:dio/dio.dart';
import 'package:balta_bloc_providers/models/product-details.model.dart';
import 'package:balta_bloc_providers/models/product-list-item.model.dart';
import '../settings.dart';

class ProductRepository
{
  // Future é uma promessa que só é retornado quando termina a operação
  Future<List<ProductListItemModel>> getAll() async 
  {
    var url = "${Settings.apiUrl}/v1/products";

    Response response = await Dio().get(url);
    
    return (response.data as List)
    .map((course) => ProductListItemModel.fromJson(course))
    .toList();
  }

  Future<List<ProductListItemModel>> getByCategory(String category) async 
  {
    var url = "${Settings.apiUrl}/v1/categories/$category/products";
    
    Response response = await Dio().get(url);
    
    return (response.data as List).map((course) => ProductListItemModel.fromJson(course)).toList();
  }

  Future<ProductDetailsModel> get(String tag) async 
  {
    var url = "${Settings.apiUrl}/v1/products/$tag";
    
    Response response = await Dio().get(url);
    
    return ProductDetailsModel.fromJson(response.data);
  }
}