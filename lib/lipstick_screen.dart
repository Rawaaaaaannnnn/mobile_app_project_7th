import 'package:flutter/material.dart';
import 'MakeUpProducts.dart';
import 'lipstick_api.dart'; // Ensure this path is correct

class LipstickScreen extends StatefulWidget {
  @override
  _LipstickScreenState createState() => _LipstickScreenState();
}

class _LipstickScreenState extends State<LipstickScreen> {
  late Future<List<MakeupProduct>> _lipstickProducts;

  @override
  void initState() {
    super.initState();
    _lipstickProducts = LipstickApi().getLipstickProducts();
  }

  // Custom widget for displaying lipstick product card with a pink background
  Widget _buildLipstickCard(MakeupProduct product) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: Colors.pinkAccent, // Set the background color to pink
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: ListTile(
        leading: product.imageUrl.isNotEmpty
            ? Image.network(
          product.imageUrl,
          width: 50,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Icon(Icons.image_not_supported, size: 50),
        )
            : Icon(Icons.image_not_supported, size: 50),
        title: Text(
          product.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white, // Make text white for better contrast on the pink background
          ),
        ),
        subtitle: Text(
          '${product.brand} - \$${product.price.toStringAsFixed(2)}',
          style: TextStyle(
            color: Colors.white70, // Slightly lighter white for the subtitle
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lipstick Products')),
      body: FutureBuilder<List<MakeupProduct>>(
        future: _lipstickProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No lipstick products found'));
          } else {
            final lipstickProducts = snapshot.data!;
            return ListView.builder(
              itemCount: lipstickProducts.length,
              itemBuilder: (context, index) {
                final product = lipstickProducts[index];
                return _buildLipstickCard(product); // Use the custom card widget
              },
            );
          }
        },
      ),
    );
  }
}
