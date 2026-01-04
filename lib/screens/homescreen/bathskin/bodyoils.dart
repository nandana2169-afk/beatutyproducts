import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/detailpages/detailpageone.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/notifications.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/likes.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/shopingbag.dart';
import 'package:flutter/material.dart';

class Bodyoils extends StatefulWidget {
  const Bodyoils({super.key});

  @override
  State<Bodyoils> createState() => _BodyoilsState();
}

class _BodyoilsState extends State<Bodyoils> {
   final List<Products> products = [
    Products(
      name: " OSEA Undaria ",

      description:
          "For those seeking a lightweight, non-greasy body oil that delivers deep hydration and skin-firming benefits, the OSEA Undaria Algae™ Body Oil 5 oz is an excellent choice. Enriched with nourishing Undaria Algae, it boosts skin elasticity and leaves skin soft, smooth, and glowing. Perfect for dry skin, it acts as a moisturizer and spa-like treatment, absorbing quickly without residue.",
      features:
          'individuals seeking a lightweight, deeply hydrating, and skin-firming body oil with a fresh citrus scent, suitable for dry skin and those who prefer clean, vegan, and cruelty-free skincare products.',
      images: ['assets/sofaoi.jpg'],
      rating: 4.5,
      boughtCount: "50k+",

      price:  799,
      discountPrice: 579,
      offer: "5% OFF",
    ),
    Products(
      name: " Palmers Cocoa Butter",

      description:
          " looking for a lightweight, fast-absorbing body oil that deeply hydrates dry and rough skin, Palmers Cocoa Butter Body Oil with Vitamin E is an excellent choice. It’s formulated with pure cocoa butter, Vitamin E, and nourishing oils like soybean, sesame, and safflower, delivering up to 48 hours of moisture. I love how quickly it absorbs without feeling greasy, leaving my skin soft, smooth, and glowing.",
      features:
          'A lightweight, fast-absorbing body oil that provides long-lasting hydration and improves skin softness, especially suitable for dry, rough, and eczema-prone skin.',
      images: ['assets/twenty.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 349,
      discountPrice: 529,
      offer: "15% OFF",
    ),
    Products(
      name: "KYDA Body Glow",
      description:
          "KYDA Body Glow Oil with SPF 45 is an ideal choice for anyone seeking a lightweight, multi-tasking body oil that combines sun protection with a radiant glow. It’s non-sticky, water- and sweat-resistant, and absorbs quickly, leaving skin refreshed and smooth without greasiness. Enriched with coconut oil and floral extracts, it nourishes while giving a subtle shimmer thanks to gold mica, perfect for daily wear or outdoor outings.",
      features:
          'A lightweight, nourishing body oil with sun protection and a radiant glow for daily use, outdoor activities, or vacations.',
      images: ['assets/kiaoil.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 270,
      discountPrice: 504,
      offer: "15% OFF",
    ),
    Products(
      name: " Vaseline Illuminate",

      description:
          "Vaseline Illuminate Me Shimmering Body Oil stands out as an ideal choice for those with melanin-rich skin seeking a natural, radiant glow. I love how it delivers a warm copper shimmer that enhances my skin’s natural beauty without feeling greasy or heavy. The lightweight formula absorbs quickly, leaving my skin soft, hydrated, and lightly scented. It’s perfect for highlighting shoulders or collarbones, whether I’m heading out or just want a subtle glow at home.",
      features:
          'individuals with melanin-rich skin seeking a natural, luminous glow that enhances their natural beauty without heaviness or greasiness.',
      images: ['assets/vasoil.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 899,
      discountPrice: 419,
      offer: "15% OFF",
    ),
    Products(
      name: "Palmer's Cocoa ",

      description:
                  'If you are looking for a body oil that adds a radiant glow while nourishing your skin, Palmer’s Cocoa Butter Shimmer Body Oil with Vitamin E is a perfect choice. It creates a beautiful, golden shimmer that enhances dark skin tones, tans, or summer skin, making you look effortlessly luminous. Formulated with cocoa butter and Vitamin E, it delivers 48 hours of hydration, softening and nourishing your skin.',
      features:
          'individuals seeking a luminous, hydrating body oil that enhances dark skin tones, tans, or summer skin with a natural, subtle shimmer for special occasions or everyday radiance.',
      images: ['assets/cocaoil.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 249,
      discountPrice: 161,
      offer: "15% OFF",
    ),
    Products(
      name: "Magic Body Oil",

      description:
          "Magic Body Oil stands out as a luxurious choice for women seeking intense hydration and skin revitalization. I love how it combines seven cold-pressed oils like sweet almond, rosehip, and evening primrose, delivering deep nourishment without feeling greasy. It absorbs quickly, leaving my skin soft, smooth, and glowing, with a rich, calming scent of patchouli, lavender, and geranium. ",
      features:
          'Natural body oil that provides deep hydration, skin firming, and revitalization, especially those with sensitive or dry skin.',
      images: ['assets/besque.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 549,
      discountPrice: 244,
      offer: "15% OFF",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text(
          'Body Oils',
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
                  'assets/theoils.jpg',
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