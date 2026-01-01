import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/screens/homescreen/bathskin/detailpageone.dart';
import 'package:beautyproducts/screens/homescreen/notifications.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/likes.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/shopingbag.dart';
import 'package:flutter/material.dart';

class Bodyscrubs extends StatefulWidget {
  const Bodyscrubs({super.key});

  @override
  State<Bodyscrubs> createState() => _BodyscrubsState();
}

class _BodyscrubsState extends State<Bodyscrubs> {
     final List<Products> products = [
    Products(
      name: " mCaffeine Exfoliating ",

      description:
          "  India’s Original Coffee Body Scrub now comes in a smaller size of 55 grams. This compact version of your favourite Body Scrub is easy to carry wherever you go. Now, your skin’s cravings can be satiated on-the-go.",
      features:
          'Developed by dermatologists, the 6% AHA BHA underarm roll-on is made with clean & effective ingredients that are free from harmful chemical compounds like paraben, sulfate, alcohol & silicone. Our products are not tested on animals ensuring an overall safe testing method.',
      images: ['assets/coffiescrub.jpg'],
      rating: 4.5,
      boughtCount: "50k+",

      price:  399,
      discountPrice: 379,
      offer: "5% OFF",
    ),
    Products(
      name: " Dove Body Polish ",

      description:
          "Dove Exfoliating Body Polish clears dry and dull skin leaving it vibrant and smooth Made with pomegranate seeds and shea butter, this body scrub deeply exfoliates and nourishes the skin, both of which are essential to a good skincare routine",
      features:
          'Exfoliating, Moisturizing, Nourishing',
      images: ['assets/dovesceub.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 249,
      discountPrice: 129,
      offer: "15% OFF",
    ),
    Products(
      name: "PLIX-THE PLANT",
      description:
          "Detan Benefits: Niacinamide reduces melanin production & evens out skin tone, helping to diminish tan.Gentle exfoliation: Glycolic Acid & Lactic Acid removes dead, dull, & dry skin, giving a lighter skin tone & glow.",
      features:
          'Moisturising Effects: Shea & Mango Butter help retain moisture, reducing water loss from the skin. Vitamins A and E in these butters also fade dark spots and improve complexion.',
      images: ['assets/lemonscrub.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 170,
      discountPrice: 104,
      offer: "15% OFF",
    ),
    Products(
      name: " ClayCo Matcha Enzyme",

      description:
          "Gentle Matcha-Powered Exfoliation: Formulated with antioxidant-rich Matcha and fine cellulose beads, this scrub gently removes dead skin cells, unclogs pores, and refines texture without causing micro-tears—ideal for dull or sensitive skin needing a refreshing reset.",
      features:
          'Skin Brightening & Polishing Effect: The natural enzymes from fruit extracts brighten the complexion, while the creamy base smooths rough patches and evens tone. ',
      images: ['assets/detox.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 399,
      discountPrice: 319,
      offer: "15% OFF",
    ),
    Products(
      name: "Be Bodywise ",

      description:
          "EXFOLIATING & MOISTURIZING BODY SCRUB: 10% AHA body scrub comes in an easy-to-use hygienic packaging, gently exfoliates without stripping off moisture from the skin & detans skin. Regular use helps reduces ingrown hair, & tan.",
      features:
          'IMPROVES APPEARANCE OF CELLULITE & SKIN TEXTURE: With jojoba beads & 10% lactic acid, this body scrub reduces cellulite, keratosis pilaris & chicken skin. ',
      images: ['assets/bodycaree.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 449,
      discountPrice: 361,
      offer: "15% OFF",
    ),
    Products(
      name: "Chemist at Play Exfoliating",

      description:
          "This exfoliating body scrub is filled with chemical and physical exfoliants like Coffee, Sugar & natural AHAs, which help to remove accumulated dirt and dead skin cells from your body. It also helps remove sun tan to give even toned skin.",
      features:
          'The gentle scrub helps to soothe skin inflammation and nourish the skin, leaving you with a smooth, velvety effect on your skin.',
      images: ['assets/chemistscrub.jpg'],
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
          'Body Scurbs',
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
                  'assets/bodyscrub.jpg',
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