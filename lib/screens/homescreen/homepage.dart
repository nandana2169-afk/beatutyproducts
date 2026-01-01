import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/screens/homescreen/bathskin/bathandskin.dart';
import 'package:beautyproducts/screens/homescreen/bathskin/bathselect.dart';
import 'package:beautyproducts/screens/homescreen/haircare.dart';
import 'package:beautyproducts/screens/homescreen/notifications.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/likes.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/shopingbag.dart';
import 'package:beautyproducts/textformfield/textformfield.dart';
import 'package:flutter/material.dart';



class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> listimage = [
    "assets/haircareproduct.png",
    "assets/bathandskinproduct.png",
    "assets/skincareproducts.png",
    "assets/skincaretool.png",
    "assets/perfume.png",
    "assets/makeupproduct.png",
  ];

  List<String> listText = [
    "Hair Care",
    "Bath & Skin",
    "Skin Care",
    "Skin Tools",
    "Perfume",
    "Makeup",
  ];

  List<String> listimages = [
    'assets/haircaregrid.jpg',
    'assets/bathskingrid.jpg',
    'assets/skincaregrid.jpg',
    'assets/skincaretoolgrid.jpg',
    'assets/pefumegrid.jpg',
    'assets/makeupgrid.jpg',
  ];

  List<String> productNames = [
    "Hair Essentials",
    "Bath & Skin Kit",
    "Glow Skin Set",
    "Skin Tools Combo",
    "Perfume Collection",
    "Makeup Pack",
  ];

  List<String> offerDetails = [
    "Buy 1 Get 1 Free",
    "Save 25% Today",
    "Flat 30% Discount",
    "Combo Offer 20% Off",
    "Limited Stock 15% Off",
    "Festive Sale 10% Off",
  ];

  
  void movePage(int index) {
    if (index == 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Haircare()));
    } else if (index == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Bathandskin()));
    } else if (index == 2) {
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => SkinCare()));
  //   } else if (index == 3) {
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => SkinTools()));
  //   } else if (index == 4) {
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => Perfume()));
  //   } else if (index == 5) {
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => MakeUp()));
  //   }
  // }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BloPink',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Appcolor.backcolor,
          ),
        ),
        actions: [
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
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),

              Withoutvalidate(
                hintText: 'Search',
                icon: Icons.search,
                filled: true,
                fillColor: Appcolor.lightwhite,
              ),

              SizedBox(height: 25),

              // 🔴 Horizontal List Navigation
              SizedBox(
                height: 110,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listimage.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        movePage(index);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Appcolor.textcolor,
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Image.asset(
                                listimage[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              listText[index],
                              style: TextStyle(
                                color: Appcolor.backcolor,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 15),

              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Appcolor.lightwhite,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Special Offers for you',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),

                    SizedBox(height: 20),

                    // 🟩 Grid Navigation
                    GridView.builder(
                      itemCount: listimage.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            movePage(index);
                          },
                          child: Card(
                            color: Appcolor.textcolor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      listimages[index],
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 6,
                                    top: 4,
                                  ),
                                  child: Text(
                                    productNames[index],
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Appcolor.backcolor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 6,
                                    bottom: 6,
                                  ),
                                  child: Text(
                                    offerDetails[index],
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
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
            ],
          ),
        ),
      ),
    );
  }
}
