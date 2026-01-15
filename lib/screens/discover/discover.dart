import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/screens/fragnanace/fragnance.dart';
import 'package:beautyproducts/screens/homescreen/bathskin/bodyoils.dart';
import 'package:beautyproducts/screens/homescreen/bathskin/rollons.dart';
import 'package:beautyproducts/screens/homescreen/bathskin/showergel.dart';
import 'package:beautyproducts/screens/homescreen/hairproducteachone/hairmasks.dart';
import 'package:beautyproducts/screens/homescreen/hairproducteachone/hairserum.dart';
import 'package:beautyproducts/screens/homescreen/skincare/facewash.dart';
import 'package:beautyproducts/screens/homescreen/skincare/moiseturizer.dart';
import 'package:beautyproducts/screens/homescreen/skincare/nightcream.dart';
import 'package:beautyproducts/screens/homescreen/skincare/serums.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/likes.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/shopingbag.dart';
import 'package:flutter/material.dart';



class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  final List<Map<String, dynamic>> products = [
    {"name": "Body Loshens", "image": "assets/yardleyshower.jpg"},
    {"name": "Hair Mask", "image": "assets/plum.jpg"},
    {"name": "Rollons", "image": "assets/chemist.jpg"},
    {"name": "Face Wash", "image": "assets/facewashtwo.jpg"},
    {"name": "Body Oils", "image": "assets/besque.jpg"},
    {"name": "Perfume", "image": "assets/perfumefive.jpg"},
    {"name": "Hair Serums", "image": "assets/livonserum.jpg"},
    {"name": "Moisturizer", "image": "assets/moizerfive.jpg"},
    {"name": "Night Cream", "image": "assets/nightcreamone.jpg"},
    {"name": "Face Serums", "image": "assets/serumtwo.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'As Your Wish',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),actions: [  IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Likes()),
            ),
            icon: Icon(Icons.favorite, color: Appcolor.backcolor),
          ), IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Shopingbag()),
            ),
            icon: Icon(Icons.shopping_bag, color: Appcolor.backcolor),
          ),],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (index == 0) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const Showergel()));
              } else if (index == 1) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const Hairmasks()));
              } else if (index == 2) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const Rollons()));
              } else if (index == 3) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const Facewash()));
              } else if (index == 4) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const Bodyoils()));
              } else if (index == 5) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const Fragnance()));
              } else if (index == 6) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const Hairserum()));
              } else if (index == 7) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const Moiseturizer()));
              } else if (index == 8) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const Nightcream()));
              } else if (index == 9) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const Serums()));
              }
            },
            child: Card(
              elevation: 4,
              color: Appcolor.appcolor,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Appcolor.backcolor,
                        image: DecorationImage(
                          image: AssetImage(products[index]["image"]),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        products[index]["name"],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
