class Products {
  final String name;
  final String description;
  final String features;
  final List<String> images;
  final double rating;
  final String boughtCount;
  final int price;
  final int discountPrice;
  final String offer;

  Products({
    required this.name,
    required this.description,
    required this.features,
    required this.images,
    required this.rating,
    required this.boughtCount,
    required this.price,
    required this.discountPrice,
    required this.offer,
  });

  // --- ADD THIS: Convert Product to a Map (JSON) ---
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'features': features,
      'images': images,
      'rating': rating,
      'boughtCount': boughtCount,
      'price': price,
      'discountPrice': discountPrice,
      'offer': offer,
    };
  }
  

  // --- ADD THIS: Create a Product from a Map (JSON) ---
  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      name: json['name'],
      description: json['description'],
      features: json['features'],
      images: List<String>.from(json['images']),
      rating: json['rating'].toDouble(),
      boughtCount: json['boughtCount'],
      price: json['price'],
      discountPrice: json['discountPrice'],
      offer: json['offer'],
    );
  }
}
