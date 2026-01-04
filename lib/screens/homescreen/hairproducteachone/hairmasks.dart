import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/Icons/icons.dart';
import 'package:beautyproducts/detailpages/detalipage.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/notifications.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/likes.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/shopingbag.dart';
import 'package:flutter/material.dart';

class Hairmasks extends StatefulWidget {
  const Hairmasks({super.key});

  @override
  State<Hairmasks> createState() => _HairmasksState();
}

class _HairmasksState extends State<Hairmasks> {
   final List<Product> products = [
    Product(
      name: "Bare Anatomy - Hair Mask",
      subtitle: "Frizz Control, Deep Conditioning, reduces hair fall",
      description:
          "This EXPERT Anti-Frizz hair mask packed with Hyaluronic acid and fatty acids is the perfect solution to control your frizz for up to 24 hours",
      images: ['assets/hairmaskpurple.jpg'],
      rating: 4.5,
      boughtCount: "50k+",
      ingredients: ["Biotin (Vitamin B7)", "Argan Oil", "Vitamin E"],
      concern: "Dry Hair,Frizzy Hair",
      hairType: "All",
      scalpType: "Normal",
      formulation: "creem",
      preference: "No Parabens",
      price: 708,
      discountPrice: 745,
      offer: "20% OFF",
    ),
   Product(
      name: "Plum Hair Mask",
      subtitle: "Frizz Control, Deep Conditioning, reduces hair fall",
      description:
          "This EXPERT Anti-Frizz hair mask packed with Hyaluronic acid and fatty acids is the perfect solution to control your frizz for up to 24 hours",
      images: ['assets/plum.jpg'],
      rating: 4.5,
      boughtCount: "50k+",
      ingredients: ["Biotin (Vitamin B7)", "Argan Oil", "Vitamin E"],
      concern: "Dry Hair,Frizzy Hair",
      hairType: "All",
      scalpType: "Normal",
      formulation: "creem",
      preference: "No Parabens",
      price: 408,
      discountPrice: 545,
      offer: "10% OFF",
    ),
   Product(
      name: "Love Beauty",
      subtitle: "Frizz Control, Deep Conditioning, reduces hair fall",
      description:
          "If you are looking for a natural hair mask that smells divine, this is a great option. It makes hair softer, smoother and less frizzy with regular weekly use.",
      images: ['assets/lovebeauty.jpg'],
      rating: 4.5,
      boughtCount: "50k+",
      ingredients: ["Biotin (Vitamin B7)", "Argan Oil", "Vitamin E"],
      concern: "Dry Hair,Frizzy Hair",
      hairType: "All",
      scalpType: "Normal",
      formulation: "creem",
      preference: "No Parabens",
      price: 408,
      discountPrice: 545,
      offer: "20% OFF",
    ),
    Product(
      name: "WELLA Professionals Invigo",
      subtitle: "Frizz Control, Deep Conditioning, reduces hair fall",
      description:
          "Despite its higher price tag, this nourishing hair mask delivers exceptional results that are well worth it.",
      images: ['assets/wellahairmask.jpg'],
      rating: 4.5,
      boughtCount: "50k+",
      ingredients: ["Biotin (Vitamin B7)", "Argan Oil", "Vitamin E"],
      concern: "Dry Hair,Frizzy Hair",
      hairType: "All",
      scalpType: "Normal",
      formulation: "creem",
      preference: "No Parabens",
      price: 708,
      discountPrice: 745,
      offer: "20% OFF",
    ),
Product(
      name: "Dove Beautiful Curls",
      subtitle: "Frizz Control, Deep Conditioning, reduces hair fall",
      description:
          "Those blessed with naturally curly hair swear by this mask,it hydrates parched curls while reducing frizz significantly even in humidity",
      images: ['assets/dovehair.jpg'],
      rating: 4.5,
      boughtCount: "50k+",
      ingredients: ["Biotin (Vitamin B7)", "Argan Oil", "Vitamin E"],
      concern: "Dry Hair,Frizzy Hair",
      hairType: "All",
      scalpType: "Normal",
      formulation: "creem",
      preference: "No Parabens",
      price: 708,
      discountPrice: 745,
      offer: "20% OFF",
    ),
   Product(
      name: "DOT & KEY Pea - Hair Mask",
      subtitle: "Frizz Control, Deep Conditioning, reduces hair fall",
      description:
          "Using this hair mask weekly leaves you with stronger, shinier, frizz-free hair. Both men and women struggling with excessive hair fall due to damage will benefit tremendously from this mask.",
      images: ['assets/dotky.jpg'],
      rating: 4.5,
      boughtCount: "50k+",
      ingredients: ["Biotin (Vitamin B7)", "Argan Oil", "Vitamin E"],
      concern: "Dry Hair,Frizzy Hair",
      hairType: "All",
      scalpType: "Normal",
      formulation: "creem",
      preference: "No Parabens",
      price: 708,
      discountPrice: 745,
      offer: "20% OFF",
    ),];
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
       appBar: AppBar(
        title: const Text(
          'Hair Masks',
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
          ),
           IconButton(
            onPressed: () { Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Likes()),
                                    );},
            icon: Icon(Icons.favorite, color: Appcolor.backcolor),
          ),
           IconButton(
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
                  'assets/thehairmask.jpg',
                  fit: BoxFit.cover,
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