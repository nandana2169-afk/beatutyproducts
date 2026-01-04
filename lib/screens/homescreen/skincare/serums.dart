import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/detailpages/detailpageone.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/likes.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/notifications.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/shopingbag.dart';
import 'package:flutter/material.dart';

class Serums extends StatefulWidget {
  const Serums({super.key});

  @override
  State<Serums> createState() => _SerumsState();
}

class _SerumsState extends State<Serums> {
  final List<Products> products = [
    Products(
      name: " Hyphen ",

      description:
          "This beauty product is crafted to enhance your natural glow while gently caring for your skin. Its lightweight formula absorbs quickly and provides long-lasting hydration. With regular use, your skin feels soft, smooth, and refreshed. Suitable for everyday use and all skin types.",
      features:
          ' A unique formula with HELO SYSTEM that binds water to the skin, preventing moisture loss,Hypoallergenic, Non-comedogenic formula free from Fragrances, Parabens and Sulfates for Dry, Normal Sensitive Skin',
      images: ['assets/serumone.jpg'],
      rating: 4.5,
      boughtCount: "50k+",

      price: 1859,
      discountPrice: 1529,
      offer: "5% OFF",
    ),
    Products(
      name: "CETAPHIL  ",

      description:
          "Enriched with nourishing ingredients, this product helps improve skin texture and maintain moisture balance. It works gently yet effectively to support healthy-looking skin. The non-greasy formula leaves your skin feeling comfortable and radiant. Perfect for daily skincare routines.",
      features:
          'Contains 2% niacinamide to fade blemishes & dark spots, Rice water brightens and evens skin tone,Lightweight gel cream absorbs quickly',
      images: ['assets/serumtwo.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 525,
      discountPrice: 472,
      offer: "15% OFF",
    ),
    Products(
      name: "Lakme  ",
      description:
          "Designed for modern beauty needs, this product blends care and performance in one simple step. It helps protect and nourish your skin throughout the day. With a soft, refreshing feel, it enhances your natural beauty effortlessly. Ideal for daily use.",
      features:
          'PRO-CERAMIDES, PEPTIDES, AND VITAMIN E are clinically proven to reduce redness, inflammation, and patchy dull skin for a healthy glow.',
      images: ['assets/serumthree.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 279,
      discountPrice: 279,
      offer: "15% OFF",
    ),
    Products(
      name: "Lakme Vitamin C+ ",

      description:
          "This formula delivers deep nourishment while keeping your skin light and breathable. It helps restore softness and adds a natural glow. Gentle enough for regular use, it supports healthy, well-cared-for skin. A perfect addition to your beauty routine.",
      features:
          '7x barrier repair power, Visibly repairs dryness from 1st use,Spreads Easily & Instantly absorbs.',
      images: ['assets/serumfour.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 284,
      discountPrice: 212,
      offer: "15% OFF",
    ),
    Products(
      name: "Plum 15%  ",

      description:
          "Carefully formulated to suit everyday beauty needs, this product helps keep your skin nourished and balanced. Its gentle texture feels light on the skin while delivering lasting comfort. Regular use leaves your skin looking fresh, smooth, and naturally radiant.",
      features:
          '3 Refreshing Fragrances, Helps Beat Underarm Odour, Natural Ingredients, No Harmful Chemicals, Reduces Pigmentation3 Refreshing Fragrances, Helps Beat Underarm Odour, Natural Ingredients, No Harmful Chemicals, Reduces Pigmentation',
      images: ['assets/serumfive.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 395,
      discountPrice: 316,
      offer: "15% OFF",
    ),
    Products(
      name: "The Derma Co ",

      description:
          "This beauty essential is designed to provide simple yet effective care. It helps maintain hydration and supports healthy-looking skin throughout the day. The smooth, non-sticky formula makes it easy to use daily. Perfect for a clean and confident beauty routine.",
      features:
          'uitable for all skin types, this face moisturizer is for anyone looking to fight oil-free hydration without any greasy shine.',
      images: ['assets/serumsix.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 249,
      discountPrice: 144,
      offer: "15% OFF",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Serums ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
          ), // Changed from AppIcon.iconsapp for stability
        ),
        backgroundColor: Appcolor.textcolor,
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Notifications()),
            ),
            icon: Icon(Icons.notifications, color: Appcolor.backcolor),
          ),
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Likes()),
            ),
            icon: Icon(Icons.favorite, color: Appcolor.backcolor),
          ),
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Shopingbag()),
            ),
            icon: Icon(Icons.shopping_bag, color: Appcolor.backcolor),
          ),
        ],
      ),
      backgroundColor: Appcolor.appcolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  'assets/serumbanner.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                ),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                itemCount: products.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final item = products[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailPage(product: item),
                        ),
                      );
                    },
                    child: Card(
                      color: Appcolor.lightwhite,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Image.asset(
                              item.images[0],
                              fit: BoxFit.contain,
                              width: double.infinity,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            child: Text(
                              item.name,
                              maxLines: 1,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Row(
                              children: [
                                Text(
                                  "₹${item.discountPrice} ",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "₹${item.price}",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Text(
                              item.offer,
                              style: TextStyle(
                                color: Appcolor.introtext,
                                fontSize: 11,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 14,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  item.rating.toString(),
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6, bottom: 5),
                            child: Text(
                              "${item.boughtCount} bought",
                              style: TextStyle(
                                fontSize: 12,
                                color: Appcolor.introtext,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final Products product;
  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Appcolor.textcolor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                    style: const TextStyle(fontSize: 15, height: 1.6),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Features",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.features,
                    style: const TextStyle(fontSize: 15, height: 1.6),
                  ),

                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Appcolor.appcolor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_border,
                            color: Appcolor.appcolor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
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
}
