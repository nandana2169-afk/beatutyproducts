import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/screens/homescreen/skincare/facewash.dart';
import 'package:beautyproducts/screens/homescreen/skincare/maskpeel.dart';
import 'package:beautyproducts/screens/homescreen/skincare/moiseturizer.dart';
import 'package:beautyproducts/screens/homescreen/skincare/nightcream.dart';
import 'package:beautyproducts/screens/homescreen/skincare/serums.dart';
import 'package:beautyproducts/screens/homescreen/skincare/sunscreen.dart';
import 'package:beautyproducts/screens/homescreen/skincare/toners.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/notifications.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/likes.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/shopingbag.dart';
import 'package:flutter/material.dart';

class Skinproductlist extends StatefulWidget {
  const Skinproductlist({super.key});

  @override
  State<Skinproductlist> createState() => _SkinproductlistState();
}

class _SkinproductlistState extends State<Skinproductlist> {
   List<String> listimage = [
    "assets/moizer.jpg",
    "assets/serumskin.jpg",
    "assets/facewash.jpg",
    "assets/sunscreen.jpg",
    "assets/toners.jpg",
    "assets/maskspeel.jpg",
    "assets/nightcreem.jpg",
    
  ];

  List<String> listText = [
    "Face Moisturizer",
    "Face Serums",
    "Face Wash",
    "Face Sunscreen",
    "Toner",
    "Masks & Peels",
    "Night Creem",
   
  ];

  List<String> listTexts = [
    'Get 20% off on all face moisturizers. Deep hydration for soft, glowing skin all day long.',
    'Flat 15% off on face serums. Boost radiance and target skin concerns with every drop.',
    'Buy 1 Get 1 Free on selected face washes. Gentle cleansing for fresh, healthy-looking skin.',
    'Enjoy 25% off on sunscreens. Protect your skin from harmful UV rays every day.',
    'Flat 10% off on all toners. Minimize pores and prep your skin for better absorption.',
    'Buy any mask or peel and get ₹100 off. Reveal brighter, smoother skin instantly.',
    'Up to 30% off on night creams. Repair and nourish your skin while you sleep.',
     
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor.textcolor,
        leading: IconButton(
          onPressed: () {
            // FIXED: Navigator.pop only needs context
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Skin Care',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),actions: [  IconButton(
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
            icon: Icon(Icons.favorite_sharp, color: Appcolor.backcolor),
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
          child: Center(
            child: Column(
              children: [
                const Text('Daily Glow', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                const SizedBox(height: 5),
                Text(
                  'Because your Skin deserves gentle care',
                  style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,
                    color: Appcolor.introtext,
                  ),
                ),
                const SizedBox(height: 15),
                ListView.builder(
                  itemCount: listimage.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      // --- NAVIGATION LOGIC START ---
                      onTap: () {
                        if (index == 0) {
                          // Goes to Shampoo & Conditioners page
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Moiseturizer()),
                          );
                        } else if (index == 1) {
                          // Goes to Hair Oil page
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Serums()),
                          );
                        } 
                        else if (index ==2){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Facewash()));
                        }
                        else if(index == 3){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Sunscreen() ));
                        }
                        else if(index ==4){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Toners()));
                        }
                        else if(index ==5){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Maskpeel()));
                        }
                         else if(index ==6){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Nightcream()));
                        }
                        // You can add more 'else if' for Serums, Masks, etc. later
                      },
                      // --- NAVIGATION LOGIC END ---
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: Appcolor.lightwhite,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  listimage[index],
                                  fit: BoxFit.fill,
                                  width: 130,
                                  height: 130,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      listText[index],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      listTexts[index],
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic,
                                        color: Appcolor.backcolor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}