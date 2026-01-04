import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/screens/homescreen/hairproducteachone/haircareselect.dart';
import 'package:beautyproducts/screens/homescreen/hairproducteachone/haircombs.dart';
import 'package:beautyproducts/screens/homescreen/hairproducteachone/hairmasks.dart';
import 'package:beautyproducts/screens/homescreen/hairproducteachone/hairoil.dart';
import 'package:beautyproducts/screens/homescreen/hairproducteachone/hairserum.dart';
import 'package:beautyproducts/screens/homescreen/hairproducteachone/hairstyling.dart';
import 'package:beautyproducts/screens/homescreen/hairproducteachone/homepage.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/notifications.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/likes.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/shopingbag.dart';
// IMPORT your target pages here
 // Change path if needed
       // Change path if needed
import 'package:flutter/material.dart';

class Haircare extends StatefulWidget {
  const Haircare({super.key});

  @override
  State<Haircare> createState() => _HaircareState();
}

class _HaircareState extends State<Haircare> {
  List<String> listimage = [
    "assets/hairshamone.jpg",
    "assets/hairoil.jpg",
    "assets/hairserum.jpg",
    "assets/hairmask.jpg",
    "assets/haircomb.jpg",
    "assets/hairstyle.jpg",
  ];

  List<String> listText = [
    "Shampoo & Conditioners",
    "Hair Oil",
    "Hair Serum",
    "Masks",
    "Hair Combos",
    "Hair Sprey",
  ];

  List<String> listTexts = [
    'Buy one shampoo and get 20% off on any conditioner. Experience a frizz-free and hydrated finish with every wash.',
    'Enjoy a flat 15% discount on all variants. Bring home shine and real nourishment for healthy hair.',
    'Purchase any serum and receive a free travel mini. Protect and perfect your everyday look with ease.',
    'Get a Buy 2, Get 1 Free offer on selected products. Restore smoothness and strength with intense care.',
    'Grab a flat ₹49 off on selected combs. Give your hair the care it deserves with the right tool.',
    'Enjoy combo offers up to 35% off. Style freely without worrying about damage.',
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
          'Hair',
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
                const Text('Hair Repair & Styling', style: TextStyle(fontSize: 20)),
                const SizedBox(height: 5),
                Text(
                  '"Beautiful hair begins with healthy habits"',
                  style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
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
                            MaterialPageRoute(builder: (context) => const Haircareselect()),
                          );
                        } else if (index == 1) {
                          // Goes to Hair Oil page
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Hairoil()),
                          );
                        } 
                        else if (index ==2){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Hairserum()));
                        }
                        else if(index == 3){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Hairmasks() ));
                        }
                        else if(index ==4){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Haircombs()));
                        }
                        else if(index ==5){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Hairstyling()));
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
      ),
    );
  }
}