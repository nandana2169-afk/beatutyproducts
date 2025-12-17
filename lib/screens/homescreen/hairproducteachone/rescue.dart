import 'dart:async';

import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/screens/homescreen/hairproducteachone/haircareselect.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/likes.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/shopingbag.dart';
import 'package:flutter/material.dart';

class Rescue extends StatefulWidget {
  const Rescue({super.key});

  @override
  State<Rescue> createState() => _RescueState();
}

class _RescueState extends State<Rescue> {
  List<String> listimage = [
    'assets/rescue.jpg',
    'assets/labeautyone.jpg',
    'assets/labeauty.jpg.jpg',
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
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => Haircareselect()),
            );
          },
          icon: Icon(Icons.arrow_back),
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
            icon: Icon(Icons.favorite_border_outlined),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Shopingbag()),
              );
            },
            icon: Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),
      backgroundColor: Appcolor.appcolor,

      body: SingleChildScrollView(
        child: Column(
          children: [
            /// ⭐ TOP IMAGE FULL WIDTH BANNER
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
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 10),

            /// 📌 WHITE INFORMATION CONTAINER
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
                    "Rescue",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Appcolor.backcolor,
                    ),
                  ),
                  const SizedBox(height: 5),

                  Text(
                    "Total Repair 5 | Strong & Smooth Hair",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Appcolor.backcolor,
                    ),
                  ),
                  const SizedBox(height: 6),

                  Text(
                    "Helps repair hair strength, smoothness, shine & reduces breakage.",
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
                      Text(
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
                          children: [
                            Text(
                              "• Hyaluronic Acid",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "• Salicylic Acid",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "• Concern",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "  Damaged Hair, Dry Hair, Frizzy Hair",
                              style: TextStyle(
                                color: Appcolor.backcolor,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "• Hair Type  All Hair Types",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "• Scalp Type All Scalp Types",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "• Formulation Liquid",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "• Preference Paraben Free",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),
                  Divider(color: Appcolor.backcolor),
                  const SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.delivery_dining,
                            color: Colors.green,
                            size: 22,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "Cash on Delivery",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.restart_alt, color: Colors.blue, size: 22),
                          const SizedBox(width: 5),
                          Text(
                            "10 Days Easy Return",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            /// ❤️ WISHLIST + 🛍 ADD TO BAG BUTTONS
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
                    child: Icon(
                      Icons.favorite_border,
                      color: Appcolor.introtext,
                      size: 28,
                    ),
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
                        border: Border.all(
                          color: Appcolor.textcolor,
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_bag_outlined,
                            color: Appcolor.introtext,
                          ),
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
}
