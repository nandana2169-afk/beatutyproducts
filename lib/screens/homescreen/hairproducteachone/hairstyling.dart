import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/Icons/icons.dart';
import 'package:beautyproducts/detailpages/detalipage.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/notifications.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/likes.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/shopingbag.dart';
import 'package:flutter/material.dart';

class Hairstyling extends StatefulWidget {
  const Hairstyling({super.key});

  @override
  State<Hairstyling> createState() => _HairstylingState();
}

class _HairstylingState extends State<Hairstyling> {
   final List<Product> products = [
    Product(
      name: "Ktein Natural",
      subtitle: "100% ALCOHOL FREE: Ktein Hair Holding Spray is made 100% free of alcohol, it can be safely used on daily basis without harming or drying the hair.",
      description:
          "NO HARMFUL INGREDIENTS:This product contains No parabens, No sulphates, No Siicones, No Synthetic Colours",
      images: ['assets/hairsprey.jpg'],
      rating: 4.5,
      boughtCount: "50k+",
      ingredients: ["Biotin (Vitamin B7)", "Argan Oil", "Vitamin E"],
      concern: "Dryness",
      hairType: "All",
      scalpType: "Normal",
      formulation: "Liquid",
      preference: "Shape & Hold",
      price: 350,
      discountPrice: 250,
      offer: "20% OFF",
    ),
   Product(
      name: "PLIX - THE PLANT",
      subtitle: "Nourishes the scalp, strengthens hair roots, reduces hair fall, and adds natural shine",
      description:
          "Hair oil repairs hair by restoring moisture, strengthening the cuticle, and reducing breakage",
      images: ['assets/plixsprey.jpg'],
      rating: 4.5,
      boughtCount: "50k+",
      ingredients: ["Biotin (Vitamin B7)", "Argan Oil", "Vitamin E"],
      concern: "Dryness",
      hairType: "All",
      scalpType: "Normal",
      formulation: "Liquid",
      preference: "Paraben Free",
      price: 350,
      discountPrice: 250,
      offer: "20% OFF",
    ),
    Product(
      name: "Dove Strength",
      subtitle: "Nourishes the scalp, strengthens hair roots, reduces hair fall, and adds natural shine",
      description:
          "Hair oil repairs hair by restoring moisture, strengthening the cuticle, and reducing breakage",
      images: ['assets/dovesprey.jpg'],
      rating: 4.5,
      boughtCount: "50k+",
      ingredients: ["Biotin (Vitamin B7)", "Argan Oil", "Vitamin E"],
      concern: "Dryness",
      hairType: "All",
      scalpType: "Normal",
      formulation: "Liquid",
      preference: "Paraben Free",
      price: 350,
      discountPrice: 250,
      offer: "20% OFF",
    ),
     Product(
      name: "Mama Earth ",
      subtitle: "Nourishes the scalp, strengthens hair roots, reduces hair fall, and adds natural shine",
      description:
          "Hair oil repairs hair by restoring moisture, strengthening the cuticle, and reducing breakage",
      images: ['assets/mamasprey.jpg'],
      rating: 4.5,
      boughtCount: "50k+",
      ingredients: ["Biotin (Vitamin B7)", "Argan Oil", "Vitamin E"],
      concern: "Dryness",
      hairType: "All",
      scalpType: "Normal",
      formulation: "Liquid",
      preference: "Paraben Free",
      price: 350,
      discountPrice: 250,
      offer: "20% OFF",
    ),
 Product(
      name: "ALPS",
      subtitle: "Nourishes the scalp, strengthens hair roots, reduces hair fall, and adds natural shine",
      description:
          "Hair oil repairs hair by restoring moisture, strengthening the cuticle, and reducing breakage",
      images: ['assets/alpssprey.jpg'],
      rating: 4.5,
      boughtCount: "50k+",
      ingredients: ["Biotin (Vitamin B7)", "Argan Oil", "Vitamin E"],
      concern: "Dryness",
      hairType: "All",
      scalpType: "Normal",
      formulation: "Liquid",
      preference: "Paraben Free",
      price: 350,
      discountPrice: 250,
      offer: "20% OFF",
    ),
    Product(
      name: "Bare Anatomy Rosemary ",
      subtitle: "Nourishes the scalp, strengthens hair roots, reduces hair fall, and adds natural shine",
      description:
          "Hair oil repairs hair by restoring moisture, strengthening the cuticle, and reducing breakage",
      images: ['assets/baresprey.jpg'],
      rating: 4.5,
      boughtCount: "50k+",
      ingredients: ["Biotin (Vitamin B7)", "Argan Oil", "Vitamin E"],
      concern: "Dryness",
      hairType: "All",
      scalpType: "Normal",
      formulation: "Liquid",
      preference: "Paraben Free",
      price: 350,
      discountPrice: 250,
      offer: "20% OFF",
    ),
    // ... You can add Dotkey, Mini, Minimalist, and Herbal here following the same pattern
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text(
          'Hair Growth',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(onPressed: (){  Navigator.pop(context);}, icon: AppIcon.iconsapp),
        backgroundColor: Appcolor.textcolor,actions: [
            IconButton(
            onPressed: () { Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Notifications()),
                                    );},
            icon: Icon(Icons.notifications, color: Appcolor.backcolor),
          ),  IconButton(
            onPressed: () { Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Likes()),
                                    );},
            icon: Icon(Icons.favorite, color: Appcolor.backcolor),
          ),  IconButton(
            onPressed: () { Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Shopingbag()),
                                    );},
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
              // Hero Image
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  'assets/spreygirl.jpg',
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 300,
                ),
              ),

              const SizedBox(height: 10),

              // Product Grid
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
                      // NAVIGATION HAPPENS HERE
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