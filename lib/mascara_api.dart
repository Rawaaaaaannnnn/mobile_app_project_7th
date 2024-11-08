import 'dart:convert';
import 'package:http/http.dart' as http;
import 'MakeupProducts.dart'; // Ensure this import is correct

class MascaraApi {
  static const String _baseUrl = 'https://makeup-api.herokuapp.com/api/v1/products.json';

  /// Fetch mascara products
  Future<List<MakeupProduct>> getMascaraProducts() async {
    final url = Uri.parse('$_baseUrl?product_type=mascara'); // URL for mascara products
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      // Create list of mascara products
      List<MakeupProduct> mascaraProducts = data
          .where((product) => product['product_type'] == 'mascara') // Filter mascara products
          .map((json) => MakeupProduct.fromJson(json))
          .toList();

      if (mascaraProducts.isEmpty) {
        print('No mascara products found');
      }

      return mascaraProducts;
    } else {
      throw Exception('Failed to load mascara products: ${response.statusCode}');
    }
  }
}
