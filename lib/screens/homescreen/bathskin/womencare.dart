import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/detailpages/detailpageone.dart';
import 'package:beautyproducts/screens/paymentcartscreen/cartstorage.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/notifications.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/likes.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/shopingbag.dart';
import 'package:flutter/material.dart';

class Womencare extends StatefulWidget {
  const Womencare({super.key});

  @override
  State<Womencare> createState() => _WomencareState();
}

class _WomencareState extends State<Womencare> {
  final List<Products> products = [
    Products(
      name: " Whisper Ultra ",

      description:
          "  It has its popularity from its good deeds of providing the best sanitary pads in India. Holding on the same reputation Whisper Ultra Clean Sanitary Pads for Women get to be featured among the best sanitary pads in India. Providing 44 pads at an affordable price, with each pad covering a wide range of 317 mm, these pads are by far the best option for using all day long without leaving a stain on your exterior. It has dual action gel formula, for trapping the fluid and locks 100% wetness. The DRI-weave cover provides soft, dry protection.",
      features:
          'Locks up to 100% wet, even odors, Odor lock gel gives you hygienic protection, Nearly 40% longer for more coverage,Comes with a delightful scent',
      images: ['assets/wiscare.jpg'],
      rating: 4.5,
      boughtCount: "50k+",

      price: 355,
      discountPrice: 335,
      offer: "5% OFF",
    ),
    Products(
      name: " Nua Ultra-Safe ",

      description:
          "These pads are made from 100% toxic-free materials, ensuring that you can trust the product against skin irritations and allergies. This is a key feature for health-conscious individuals looking for safe menstrual products.",
      features:
          'The ultra-thin design allows for discreet wear, ensuring you feel confident and comfortable throughout the day. ',
      images: ['assets/nua.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 209,
      discountPrice: 144,
      offer: "15% OFF",
    ),
    Products(
      name: "Stayfree Secure",
      description:
          "Stayfree Secure XL Ultra Thin Sanitary napkins are trusted to be the best sanitary pads in India, providing quality products at a minimum price. The package containing 40 pads comes with gel lock technology and a dry cover with wings for better absorption and restricting overflow. Another reason to include this product among the best sanitary pads in India is its odor control feature.",
      features:
          'Half as thin as a regular napkin with up to 100 percent fluid lock, Made specifically for regular to heavy periods, The dry cover gives you a superior dry feel',
      images: ['assets/staycare.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 316,
      discountPrice: 254,
      offer: "15% OFF",
    ),
    Products(
      name: " Sirona Reusable",

      description:
          "Leak-proof, Rash-free Protection Get up to 8 hours of worry-free wear with our 100% medical-grade silicone cup that moves with your body. No leaks, no rashes.Simplified Cleaning Say goodbye to messy cleanups. The microwaveable sterilizer makes cup hygiene quick, easy, and portable. No boiling needed!",
      features:
          'Eco-Friendly & Economical One cup = Up to 5 years of use. Reduce your period waste and save on monthly expenses with this sustainable alternative.',
      images: ['assets/sinora.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 449,
      discountPrice: 399,
      offer: "15% OFF",
    ),
    Products(
      name: "Sirona Reusable",

      description:
          "Sirona's Menstrual Cups are made using medical-grade silicone. This is a biocompatible, toxin-free, odourless and hypoallergenic material which can be inserted into the vaginal canal to collect menstrual fluid. All our products are made in an FDA-Approved facility and are Latex-free and BPA-free.",
      features:
          'This Menstrual Cup is made of ultra-soft medical grade silicone which is gentle on skin',
      images: ['assets/sorocare.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 249,
      discountPrice: 230,
      offer: "15% OFF",
    ),
    Products(
      name: "Sirona Electric ",

      description:
          "Sirona Menstrual Cup Sterilizer is a hassle-free and perfect solution to disinfect the menstrual cup. Usually, one would have to boil water on the stove and wait for the steam to sterilize the cup. However, this automatic sterilizer leaves the cup perfectly clean and ready to use or to be stored safely till the next cycle.Sirona Menstrual Cup Sterilizer is a hassle-free and perfect solution to disinfect the menstrual cup. Usually, one would have to boil water on the stove and wait for the steam to sterilize the cup. However, this automatic sterilizer leaves the cup perfectly clean and ready to use or to be stored safely till the next cycle.",
      features:
          ' Sirona Menstrual Cup Sterilizer efficiently eliminates up to 99.9% of harmful bacteria, disinfecting your cup perfectly. ',
      images: ['assets/steblecare.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 449,
      discountPrice: 344,
      offer: "15% OFF",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Women Care',
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
                  'assets/daycare.jpg',
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
                          onPressed: () async {
                            await CartStorage.addToCart(product);
                            if (!context.mounted) return;
                            // 👇 Navigate to cart screen after adding
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Shopingbag(),
                              ),
                            );
                          },
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
                            onPressed: () async {
                              await CartStorage.addToCart(product);
                              if (!context.mounted) return;
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
