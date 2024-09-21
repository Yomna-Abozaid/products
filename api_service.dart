import 'dart:convert';

import 'package:untitled27/product_Model.dart';
import 'package:http/http.dart' as http;
class ApiService{
  final String beseUrl='https://fakestoreapi.com/products';
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(beseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

}