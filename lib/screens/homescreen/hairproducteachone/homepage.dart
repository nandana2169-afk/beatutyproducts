import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/screens/fragnanace/fragnance.dart';
import 'package:beautyproducts/screens/homescreen/bathskin/bathandskin.dart';
import 'package:beautyproducts/screens/homescreen/bathskin/sellercombo.dart';
import 'package:beautyproducts/screens/homescreen/hairproducteachone/haircare.dart';
import 'package:beautyproducts/screens/homescreen/hairproducteachone/haircareselect.dart';
import 'package:beautyproducts/screens/homescreen/hairproducteachone/hairoil.dart';
import 'package:beautyproducts/screens/homescreen/skincare/skinproductlist.dart';
import 'package:beautyproducts/screens/homescreen/skincare/sunscreen.dart';
import 'package:beautyproducts/screens/makeup/makeup.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/likes.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/shopingbag.dart';
import 'package:beautyproducts/textformfield/textformfield.dart';
import 'package:flutter/material.dart';

// A simple data model to keep things organized
class ProductItem {
  final String image;
  final String title;
  final String? subtitle; // Only used for the grid offers
  final Widget destination;

  ProductItem({
    required this.image,
    required this.title,
    this.subtitle,
    required this.destination,
  });
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  
  // LIST 1: Only for the Top Horizontal Circles
  List<ProductItem> categoryList = [
    ProductItem(image: "assets/haircareproduct.png", title: "Hair Care", destination: const Haircare()),
    ProductItem(image: "assets/bathandskinproduct.png", title: "Bath & Skin", destination: const Bathandskin()),
    ProductItem(image: "assets/skincareproducts.png", title: "Skin Care", destination: const Skinproductlist()),
  
    ProductItem(image: "assets/perfume.png", title: "Perfume", destination: const Fragnance()),
    ProductItem(image: "assets/makeupproduct.png", title: "Makeup", destination: const Makeup()),
  ];

 
  List<ProductItem> offerList = [
    ProductItem(image: 'assets/haircaregrid.jpg', title: "Hair Essentials", subtitle: "Buy 1 Get 1 Free", destination: const Haircareselect()),
    ProductItem(image: 'assets/bathskingrid.jpg', title: "Bath & Skin Kit", subtitle: "Save 25% Today", destination: const Sellercombo()),
    ProductItem(image: 'assets/skincaregrid.jpg', title: "Sunscreens", subtitle: "Flat 30% Discount", destination: const Sunscreen()),
    ProductItem(image: 'assets/labeauty.jpg', title: "Hair Oils", subtitle: "Combo Offer 20% Off", destination: const Hairoil()),
    ProductItem(image: 'assets/pefumegrid.jpg', title: "Perfume Collection", subtitle: "Limited Stock 15% Off", destination: const Fragnance()),
    ProductItem(image: 'assets/makeupgrid.jpg', title: "Makeup Pack", subtitle: "Festive Sale 10% Off", destination: const Makeup()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BloPink', style: TextStyle(fontWeight: FontWeight.bold, color: Appcolor.backcolor)),
        actions: [
          // IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Notifications())), icon: Icon(Icons.notifications, color: Appcolor.backcolor)),
          IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Likes())), icon: Icon(Icons.favorite, color: Appcolor.backcolor)),
          IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Shopingbag())), icon: Icon(Icons.shopping_bag, color: Appcolor.backcolor)),
        ],
      ),
      backgroundColor: Appcolor.appcolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Withoutvalidate(hintText: 'Search', icon: Icons.search, filled: true, fillColor: Appcolor.lightwhite),
              const SizedBox(height: 25),

              // 🔴 TOP LIST VIEW (Horizontal Circles)
              SizedBox(
                height: 110,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryList.length, // Uses ONLY categoryList
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => categoryList[index].destination)),
                      // onLongPress: () {
                      //   // Example: Removing from here will NOT affect the grid below
                      //   setState(() {
                      //     categoryList.removeAt(index);
                      //   });
                      // },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            Container(
                              height: 70, width: 70,
                              decoration: BoxDecoration(shape: BoxShape.circle, color: Appcolor.textcolor),
                              clipBehavior: Clip.antiAlias,
                              child: Image.asset(categoryList[index].image, fit: BoxFit.cover),
                            ),
                            const SizedBox(height: 8),
                            Text(categoryList[index].title, style: TextStyle(color: Appcolor.backcolor, fontSize: 12, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 15),

              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(color: Appcolor.lightwhite, borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Special Offers for you', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    const SizedBox(height: 20),

                    // 🟩 BOTTOM GRID VIEW
                    GridView.builder(
                      itemCount: offerList.length, // Uses ONLY offerList
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => offerList[index].destination)),
                          child: Card(
                            color: Appcolor.textcolor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Image.asset(offerList[index].image, fit: BoxFit.cover, width: double.infinity),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6, top: 4),
                                  child: Text(offerList[index].title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Appcolor.backcolor)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6, bottom: 6),
                                  child: Text(offerList[index].subtitle ?? "", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Appcolor.introtext)),
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
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 0,
      //   selectedItemColor: Colors.pink,
      //   unselectedItemColor: Colors.black,
      //   items: [BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //   BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'wallet' ),
      //   BottomNavigationBarItem(icon: Icon(Icons.person),label: 'person'),
      //   BottomNavigationBarItem(icon: Icon(Icons.security), label: 'Security')],

      // ),
    );
  }
}