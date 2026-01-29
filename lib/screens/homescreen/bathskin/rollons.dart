import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/detailpages/detailpageone.dart';
import 'package:beautyproducts/screens/paymentcartscreen/cartstorage.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/notifications.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/likes.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/shopingbag.dart';
import 'package:flutter/material.dart';

class Rollons extends StatefulWidget {
  const Rollons({super.key});

  @override
  State<Rollons> createState() => _RollonsState();
}

class _RollonsState extends State<Rollons> {
   final List<Products> products = [
    Products(
      name: " Be Bodywise",

      description:
          " A revolutionary approach to body odour! AHA BHA-based solution that eliminates odour-causing bacteria that mask odour all day long. Regular use helps in hydrating dry underarms & reduces pigmentation. 4% Lactic acid & 1% Salicylic acid gently exfoliate dead skin cells and help to speed up cell turnover and cell renewal to reveal newer, fresher, smoother skin. 1% Mandelic acid helps boost collagen production resulting in radiant underarms. Kojic Acid reduces melanin production and fades dark spots & pigmentation by evening under-arm discoloration.",
      features:
          'Developed by dermatologists, the 6% AHA BHA underarm roll-on is made with clean & effective ingredients that are free from harmful chemical compounds like paraben, sulfate, alcohol & silicone. Our products are not tested on animals ensuring an overall safe testing method.',
      images: ['assets/blueroll.jpg'],
      rating: 4.5,
      boughtCount: "50k+",

      price:  399,
      discountPrice: 379,
      offer: "5% OFF",
    ),
    Products(
      name: " NIVEA Pearl",

      description:
          "It contains precious pearl extracts that give a mild, soothing fragrance and keep you fresh all day long,All skin types ,It contains anti-microbial agents that help keep bacteria away thus giving long lasting odour controlIts, gentle formula with zero alcohol helps in taking care of the delicate underarm skin,Provides an even skin tone",
      features:
          'All Day Protection, Dermatologist Tested, Non Irritating,Alcohol Free; Colourant Free,Provides 48 hours of effective protection',
      images: ['assets/pearlnivya.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 249,
      discountPrice: 129,
      offer: "15% OFF",
    ),
    Products(
      name: "Rexona Shower Fresh",
      description:
          "An anti-per spirant with clean, fresh scent to keep you feeling dry and confident all day long. Whether you’re scaling a mountain, running for the bus or train, presenting to your boss or going for your first job interview, you can be confident of the best protection. With 0% alcohol, it is safe on skin and is dermatologist tested. So apply Rexona Underarm Roll-On after your bath every morning, and step out with Rexona confidence! Rexona-It Won't Let You Down! *90% illustrative proportion",
      features:
          'Alcohol Free, All Day Protection, Antiperspirant, Dermatologist Tested, Travel Size,Alcohol Free',
      images: ['assets/rexroll.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 170,
      discountPrice: 104,
      offer: "15% OFF",
    ),
    Products(
      name: " mCaffeine Deep Moisturizing",

      description:
          "Our underarm roll gently exfoliates the skin as it's enriched with 4% Lactic Acid + 1% Mandelic Acid. This also helps even out the skin tone and fades spots/patches on the skin, if any.This roll on is specially formulated to whiten and brighten your underarms with regular use. Just roll it 3-4 times post-shower daily and raise your hands in the air to show them off.",
      features:
          'Aluminum Free, Dye Free, Paraben Free, Sulfate Free, lactic acid,mandelic acid,Although it is a fragrance-free roll on, it makes sure that your skin feels fresh as a daisy. This is a perfect roll on for everyday use.',
      images: ['assets/chemist.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 399,
      discountPrice: 319,
      offer: "15% OFF",
    ),
    Products(
      name: "Carmesi Natural ",

      description:
          "95% NATURAL: Contains 95% natural ingredients, such as Liquorice Extract, Olive Oil, and Wood Sugar, which are safe for your skin.HELPS BEAT UNDERARM ODOUR: Scientifically proven to keep body odour at bay; now, remain fresh even in the sweltering heat.",
      features:
          '3 Refreshing Fragrances, Helps Beat Underarm Odour, Natural Ingredients, No Harmful Chemicals, Reduces Pigmentation3 Refreshing Fragrances, Helps Beat Underarm Odour, Natural Ingredients, No Harmful Chemicals, Reduces Pigmentation',
      images: ['assets/carmesi.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 249,
      discountPrice: 161,
      offer: "15% OFF",
    ),
    Products(
      name: "Yardley London",

      description:
          "Feminine Freshness: Yardley’s London Rose Roll-On Deodorant offers 48-hour sweat protection with an exquisite, feminine fragrance,Skin Brightening: Infused with natural licorice extracts and amino peptides, it subtly lightens skin and reduces wrinkles for fairer underarms ,Premium Quality: Experience the quintessential English luxury of Yardley London, known for classic floral fragrances and quality products",
      features:
          'Alcohol Free,All Day Protection,Natural,Suitable for dry and rough skin',
      images: ['assets/yarly.jpg'],
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
          'Body Rollons',
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
                  'assets/rollons.jpg',
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
                            onPressed: ()async {
    await CartStorage.addToCart(product);
if(!context.mounted)return;
    // 👇 Navigate to cart screen after adding
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Shopingbag(),
      ),
    );
  },
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