import 'package:flutter/material.dart';
import 'mascara_api.dart'; // Import Mascara API
import 'MakeupProducts.dart'; // Import the MakeupProduct model

class MascaraScreen extends StatefulWidget {
  @override
  _MascaraScreenState createState() => _MascaraScreenState();
}

class _MascaraScreenState extends State<MascaraScreen> {
  late Future<List<MakeupProduct>> _mascaraProducts;

  @override
  void initState() {
    super.initState();
    _mascaraProducts = MascaraApi().getMascaraProducts(); // Initialize the Future for mascara products
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mascara Products')),
      body: FutureBuilder<List<MakeupProduct>>(
        future: _mascaraProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No mascara products found'));
          } else {
            final mascaraProducts = snapshot.data!;
            return ListView.builder(
              itemCount: mascaraProducts.length,
              itemBuilder: (context, index) {
                final product = mascaraProducts[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: product.imageUrl.isNotEmpty
                        ? Image.network(
                      product.imageUrl,
                      width: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.image_not_supported, size: 50),
                    )
                        : Icon(Icons.image_not_supported, size: 50),
                    title: Text(product.name),
                    subtitle: Text('${product.brand} - \$${product.price.toStringAsFixed(2)}'),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
