import 'package:http/http.dart' as http;
import 'package:flutter_bloc_api/models/product_models.dart';
class ProductRepo {

  Future<List<ProductsModel>> getProducts() async {
    var response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      return ProductsModelFromJson(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }
}