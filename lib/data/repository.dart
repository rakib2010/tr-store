import 'package:http/http.dart' as http;
import 'dart:convert';




class Repository {
  static Future<List<Map<String, dynamic>>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      return json.decode(response.body).cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load products');
    }
  }

  static Future<Map<String, dynamic>> fetchProductDetails(int id) async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts?id=$id'));
    if (response.statusCode == 200) {
      return json.decode(response.body).cast<Map<String, dynamic>>().first;
    } else {
      throw Exception('Failed to load product details');
    }
  }
}
