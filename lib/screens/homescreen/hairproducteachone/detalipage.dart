import 'package:flutter/material.dart';
import 'package:beautyproducts/Colors/colors.dart';

// --- THE PRODUCT MODEL ---
class Product {
  final String name;
  final String subtitle;
  final String description;
  final List<String> images;
  final double rating;
  final String boughtCount;
  final List<String> ingredients;
  final String concern;
  final String hairType;
  final String scalpType;
  final String formulation;
  final String preference;
  final int price;
  final int discountPrice;
  final String offer;

  Product({
    required this.name,
    required this.subtitle,
    required this.description,
    required this.images,
    required this.rating,
    required this.boughtCount,
    required this.ingredients,
    required this.concern,
    required this.hairType,
    required this.scalpType,
    required this.formulation,
    required this.preference,
    required this.price,
    required this.discountPrice,
    required this.offer,
  });
}

// --- THE DETAIL PAGE UI ---
class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.textcolor,
      appBar: AppBar(
        title: Text(
          product.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Appcolor.textcolor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Container(
              height: 350,
              width: double.infinity,
              color: Appcolor.lightwhite,
              child: Image.asset(product.images[0], fit: BoxFit.contain),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    product.subtitle,
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                  ),

                  const SizedBox(height: 15),

                  Row(
                    children: [
                      Text(
                        "₹${product.discountPrice}",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "₹${product.price}",
                        style: const TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        product.offer,
                        style: TextStyle(
                          color: Appcolor.introtext,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const Divider(height: 30),

                  const Text(
                    "Product Description",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 15, height: 1.4),
                  ),

                  const SizedBox(height: 20),

                  // Specification List
                  _infoRow("Concern", product.concern),
                  _infoRow("Hair Type", product.hairType),
                  _infoRow("Preference", product.preference),
                  _infoRow("Formulation", product.formulation),

                  const SizedBox(height: 20),

                  const Text(
                    "Ingredients",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    product.ingredients.join(", "),
                    style: const TextStyle(color: Colors.black54),
                  ),

                  const SizedBox(height: 30),

                  // --- FAVORITE AND ADD TO BAG ROW ---
                  Row(
                    children: [
                      // Favorite Icon Button
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Appcolor.appcolor, width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          onPressed: () {
                            // Add logic for wishlisting
                          },
                          icon: Icon(
                            Icons.favorite_border,
                            color: Appcolor.appcolor,
                          ),
                        ),
                      ),
                      
                      const SizedBox(width: 12),

                      // Add to Bag Button
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Appcolor.appcolor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "ADD TO BAG",
                              style: TextStyle(
                                color: Appcolor.backcolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black, fontSize: 15),
          children: [
            TextSpan(
              text: "$label: ",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}