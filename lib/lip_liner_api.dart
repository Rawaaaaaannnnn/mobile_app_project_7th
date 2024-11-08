import 'dart:convert';
import 'package:http/http.dart' as http;
import 'MakeupProducts.dart';

class LipLinerApi {
  static const String _baseUrl = 'https://makeup-api.herokuapp.com/api/v1/products.json';

  /// Fetch lip liner products
  Future<List<MakeupProduct>> getLipLinerProducts() async {
    final url = Uri.parse('$_baseUrl?product_type=lip_liner');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((json) => MakeupProduct.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load lip liner products');
    }
  }
}
