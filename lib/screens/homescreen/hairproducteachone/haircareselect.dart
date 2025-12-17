import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/Icons/icons.dart';
import 'package:beautyproducts/screens/homescreen/haircare.dart';
import 'package:beautyproducts/screens/homescreen/loreal.dart';
import 'package:flutter/material.dart';

// IMPORT YOUR EXISTING PAGES ONLY
import 'package:beautyproducts/screens/homescreen/hairproducteachone/loreal.dart';
import 'package:beautyproducts/screens/homescreen/hairproducteachone/rescue.dart';
import 'package:beautyproducts/screens/homescreen/hairproducteachone/dotkey.dart';
import 'package:beautyproducts/screens/homescreen/hairproducteachone/mini.dart';
import 'package:beautyproducts/screens/homescreen/hairproducteachone/minimalist.dart';
import 'package:beautyproducts/screens/homescreen/hairproducteachone/herbal.dart';

class Haircareselect extends StatefulWidget {
  const Haircareselect({super.key});

  @override
  State<Haircareselect> createState() => _HaircareselectState();
}

class _HaircareselectState extends State<Haircareselect> {
  List<String> listimage = ['assets/girls.jpg'];

  List<String> listimages = [
    'assets/loreal.jpg',
    'assets/rescue.jpg',
    'assets/dotkey.jpg',
    'assets/mini.jpg',
    'assets/cocoeve.jpg',
    'assets/herbal.jpg',
  ];

  List<String> names = [
    "L'Oreal Moisture",
    "LU Rescue Shampoo",
    "Dot & Key Care",
    "Mini Hair Combo",
    "Minimalist Hair",
    "Herbal Protection",
  ];

  List<String> offer = [
    "20% OFF",
    "15% OFF",
    "10% OFF",
    "25% OFF",
    "18% OFF",
    "30% OFF",
  ];

  List<int> price = [1200, 999, 650, 1500, 1300, 850];

  List<int> discountPrice = [960, 849, 585, 1125, 1066, 595];

  List<double> ratings = [4.5, 4.0, 4.2, 3.9, 4.6, 4.1];

  // 🔹 ONLY THIS IS ADDED (existing pages)
  final List<Widget> pages = const [
    Loreal(),
    Rescue(),
    Dotkey(),
    Mini(),
    Minimalist(),
    Herbal(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shampoo & Conditioners',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),leading: AppIcon.arrowandro,
        // leading: IconButton(onPressed: (){  Navigator.push(
        //                   context,
        //                   MaterialPageRoute(
        //                     builder: (context) => Haircare(),
        //                   ));}, icon: AppIcon.arrowandro),
        backgroundColor: Appcolor.textcolor,
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
                color: Appcolor.lightwhite,
                child: Image.asset(
                  listimage[0],
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 300,
                ),
              ),

              const SizedBox(height: 10),

              GridView.builder(
                itemCount: listimages.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.78,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => pages[index],
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
                              listimages[index],
                              fit: BoxFit.contain,
                              width: double.infinity,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            child: Text(
                              names[index],
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 13,
                                color: Appcolor.backcolor,
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            child: Row(
                              children: [
                                Text(
                                  "₹${discountPrice[index]} ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Appcolor.backcolor,
                                  ),
                                ),
                                Text(
                                  "₹${price[index]}",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Appcolor.backcolor,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Text(
                              offer[index],
                              style: TextStyle(
                                color: Appcolor.introtext,
                                fontSize: 11,
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            child: Row(
                              children: [
                                Icon(Icons.star, color: Appcolor.introtext, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  ratings[index].toString(),
                                  style: const TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 6, bottom: 5),
                            child: Text(
                              "50k+ bought this",
                              style: TextStyle(
                                fontSize: 15,
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
