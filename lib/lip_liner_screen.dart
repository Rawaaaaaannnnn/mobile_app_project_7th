import 'package:flutter/material.dart';
import 'lip_liner_api.dart'; // Import the Lip Liner API
import 'MakeupProducts.dart'; // Import the MakeupProduct model

class LipLinerScreen extends StatefulWidget {
  @override
  _LipLinerScreenState createState() => _LipLinerScreenState();
}

class _LipLinerScreenState extends State<LipLinerScreen> {
  late Future<List<MakeupProduct>> _lipLinerProducts;

  @override
  void initState() {
    super.initState();
    _lipLinerProducts = LipLinerApi().getLipLinerProducts(); // Fetch lip liner products
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lip Liner Products')),
      body: FutureBuilder<List<MakeupProduct>>(
        future: _lipLinerProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No lip liner products found'));
          } else {
            final lipLinerProducts = snapshot.data!;
            return ListView.builder(
              itemCount: lipLinerProducts.length,
              itemBuilder: (context, index) {
                final product = lipLinerProducts[index];
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
