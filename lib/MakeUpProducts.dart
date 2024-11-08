class MakeupProduct {
  final String name;
  final String brand;
  final double price;
  final String imageUrl;

  MakeupProduct({
    required this.name,
    required this.brand,
    required this.price,
    required this.imageUrl,
  });

  factory MakeupProduct.fromJson(Map<String, dynamic> json) {
    return MakeupProduct(
      name: json['name'] as String? ?? 'No name', // Handle null
      brand: json['brand'] as String? ?? 'Unknown', // Handle null
      price: (json['price'] is String)
          ? double.tryParse(json['price']) ?? 0.0
          : (json['price'] is num) ? json['price'].toDouble() : 0.0,
      imageUrl: json['image_link'] as String? ?? '', // Handle null
    );
  }
}
