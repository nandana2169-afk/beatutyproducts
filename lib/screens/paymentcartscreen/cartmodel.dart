import 'package:beautyproducts/detailpages/detailpageone.dart';

class CartItem {
  final Products product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': product.name,
      'price': product.price,
      'image': product.images.first,
      'quantity': quantity,
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      product: Products(
        name: json['name'],
        description: '',
        features: '',
        images: [json['image']],
        rating: 0.0,
        boughtCount: '',
        price: json['price'],
        discountPrice: json['price'],
        offer: '',
      ),
      quantity: json['quantity'],
    );
  }
}
