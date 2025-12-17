import 'dart:async';

import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/screens/homescreen/hairproducteachone/hairoil.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/likes.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/shopingbag.dart';
import 'package:flutter/material.dart';

class Sept extends StatefulWidget {
  const Sept({super.key});

  @override
  State<Sept> createState() => _SeptState();
}

class _SeptState extends State<Sept> {
  List<String> listimage = [
    'assets/sept.jpg',
    'assets/septone.jpg',
    'assets/keshtwo.jpg',
  ];

  PageController pageController = PageController();
  int currentPage = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (currentPage < listimage.length - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }

      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // ✅ FIXED
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Appcolor.textcolor,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Likes()),
              );
            },
            icon: const Icon(Icons.favorite_border_outlined),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Shopingbag()),
              );
            },
            icon: const Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),
      backgroundColor: Appcolor.appcolor,

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                child: PageView.builder(
                  controller: pageController,
                  itemCount: listimage.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      listimage[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 400,
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Appcolor.backcolor,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Parachute Coconut Oil",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Appcolor.backcolor,
                    ),
                  ),
                  const SizedBox(height: 5),

                  Text(
                    "Nourishes the scalp, strengthens hair roots, reduces hair fall, and adds natural shine.",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Appcolor.backcolor,
                    ),
                  ),
                  const SizedBox(height: 6),

                  Text(
                    "Hair oil repairs hair by restoring moisture, strengthening the cuticle, and reducing breakage.",
                    style: TextStyle(fontSize: 14, color: Appcolor.backcolor),
                  ),
                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Icon(Icons.star, color: Appcolor.appcolor, size: 20),
                      Icon(Icons.star, color: Appcolor.appcolor, size: 20),
                      Icon(Icons.star, color: Appcolor.appcolor, size: 20),
                      Icon(Icons.star, color: Appcolor.appcolor, size: 20),
                      Icon(Icons.star_half, color: Appcolor.appcolor, size: 20),
                      const SizedBox(width: 6),
                      const Text(
                        "4.6",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "(50K+ bought)",
                        style: TextStyle(color: Appcolor.backcolor),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  Text(
                    "Features",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Appcolor.backcolor,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("• Deeply nourishes the scalp and hair roots",
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            Text("• Strengthens hair to reduce breakage and hair fall",
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            SizedBox(height: 8),
                            Text("• Repairs dry and damaged hair",
                                style: TextStyle(fontWeight: FontWeight.w600)),
                            Text("  Improves blood circulation for healthy growth",
                                style: TextStyle(fontSize: 13)),
                          ],
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("• Provides long-lasting moisture to dry hair",
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            Text("• Helps control frizz and flyaways",
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            Text("• Protects hair from environmental damage",
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            Text("• Improves hair texture and softness",
                                style: TextStyle(fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),
                  Divider(),
                  const SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Row(
                        children: [
                          Icon(Icons.delivery_dining, color: Colors.green),
                          SizedBox(width: 5),
                          Text("Cash on Delivery",
                              style: TextStyle(fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.restart_alt, color: Colors.blue),
                          SizedBox(width: 5),
                          Text("10 Days Easy Return",
                              style: TextStyle(fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Appcolor.textcolor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.favorite_border,
                        color: Appcolor.introtext, size: 28),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Appcolor.textcolor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Appcolor.textcolor, width: 1.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_bag_outlined,
                              color: Appcolor.introtext),
                          const SizedBox(width: 8),
                          Text(
                            "Add to Bag",
                            style: TextStyle(
                              color: Appcolor.introtext,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    pageController.dispose();
    super.dispose();
  }
}
