import 'dart:convert';
import 'package:http/http.dart' as http;
import 'MakeUpProducts.dart';

class LipstickApi {
  static const String _baseUrl = 'https://makeup-api.herokuapp.com/api/v1/products.json';

  Future<List<MakeupProduct>> getLipstickProducts() async {
    try {
      final url = Uri.parse('$_baseUrl?product_type=lipstick');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        print('Data received: $data'); // Log the raw data
        return data.map((json) => MakeupProduct.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load lipstick products. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching lipstick products: $e');
    }
  }
}
