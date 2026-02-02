import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/detailpages/detailpageone.dart';
import 'package:beautyproducts/screens/paymentcartscreen/cartstorage.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/notifications.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/likes.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/shopingbag.dart';
import 'package:flutter/material.dart';

class Sellercombo extends StatefulWidget {
  const Sellercombo({super.key});

  @override
  State<Sellercombo> createState() => _SellercomboState();
}

class _SellercomboState extends State<Sellercombo> {
  final List<Products> products = [
    Products(
      name: " mcaffeine Moment ",

      description:
          "  This Diwali gift for friends and family and sibling caffeinated selfcare, with this thoughtfully assorted gift kit. Curated with all the goodness of Caffeine and a sense of care and affection, this gift kit is a perfect way to express your love and gratitude.",
      features:
          'Infused with Pure Coffee, the Coffee Moment Gift Kit comes with Coffee Face Wash, Coffee Face Scrub, Coffee Body Scrub, Wooden Scoop and a Perk-up Towel. The premium packaging of this caffeinated gift kit gives the feeling of grand unveiling when you open it up.',
      images: ['assets/maccombo.jpg'],
      rating: 4.5,
      boughtCount: "50k+",

      price: 1445,
      discountPrice: 911,
      offer: "5% OFF",
    ),
    Products(
      name: " THE LOVE CO ",

      description:
          "Exquisite Selection: Carefully curated, The Love Co. gift hamper includes premium shower gel, nourishing body lotion and Shampoo, designed for the modern woman.Luxury in Every Drop: Infused with natural extracts and luxurious scents, our body care products offer a spa-like experience, elevating your daily routine to a moment of indulgence.",
      features:
          ' Crafted with love and care, our products are free from harsh chemicals, suitable for all skin types, and ensure a gentle, nourishing touch.',
      images: ['assets/cherry.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 300,
      discountPrice: 220,
      offer: "15% OFF",
    ),
    Products(
      name: "Chemist At Play ",
      description:
          "The 3-in-1 exfoliation kit- from body to underarms—using AHAs in the body wash, roll on, and lotion to reveal smoother, glowier skin all over.Soft, nourished skin - Murumuru butter in the body wash & shea butter in the lotion for intense hydration without compromising on exfoliation.",
      features:
          ' The Roll On with 5% AHAs fades pigmentation and smoothens skin texture, giving your pits the upgrade they deserve.',
      images: ['assets/chemistcombo.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 597,
      discountPrice: 499,
      offer: "15% OFF",
    ),
    Products(
      name: " Bryan & Candy",

      description:
          " Majestic fragrance of Rose Absolute and Iris | Luxurious, all-encompassing royal bath essentials | Infused with Organic Rose Water, Ginkgo Biloba & White Tea Extracts | An elegant gift ideal for all occasions Thoughtfully curated for all skin types | 100% vegan",
      features:
          'Organic Rose Water, Ginkgo Biloba & White Tea Extract,Jojoba Oil & Shea Butter, Coconut Oil,Coconut Oil.',
      images: ['assets/comboss.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 449,
      discountPrice: 399,
      offer: "15% OFF",
    ),
    Products(
      name: "Plum BodyLovin",

      description:
          "Indulgent Bath & Body Experience: Elevate your self-care routine with this luxurious 3-in-1 gift set, featuring a deeply moisturizing body wash, refreshing body mist, and ultra-nourishing body oil, all infused with an irresistible warm vanilla fragrance.Sensational Long-Lasting Vanilla Fragrance: Immerse yourself in the rich, creamy aroma of warm vanilla, designed to linger all day and leave you feeling confident, fresh, and deliciously scented.",
      features:
          'Deep Hydration & Skin Nourishment: Infused with skin-loving ingredients, the moisturizing body oil seals in hydration, while the gentle body wash cleanses without stripping moisture, keeping your skin soft, smooth, and radiant.',
      images: ['assets/pumcarebo.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 749,
      discountPrice: 636,
      offer: "15% OFF",
    ),
    Products(
      name: "Kimirica ",

      description:
          "Sirona Menstrual Cup Sterilizer is a hassle-free and perfect solution to disinfect the menstrual cup. Usually, one would have to boil water on the stove and wait for the steam to sterilize the cup. However, this automatic sterilizer leaves the cup perfectly clean and ready to use or to be stored safely till the next cycle.Sirona Menstrual Cup Sterilizer is a hassle-free and perfect solution to disinfect the menstrual cup. Usually, one would have to boil water on the stove and wait for the steam to sterilize the cup. However, this automatic sterilizer leaves the cup perfectly clean and ready to use or to be stored safely till the next cycle.",
      features:
          ' Sirona Menstrual Cup Sterilizer efficiently eliminates up to 99.9% of harmful bacteria, disinfecting your cup perfectly. ',
      images: ['assets/lovestorybo.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 1843,
      discountPrice: 1307,
      offer: "15% OFF",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ComboPack',
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
                  'assets/funcombo.jpg',
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
