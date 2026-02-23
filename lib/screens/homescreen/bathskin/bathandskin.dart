import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/screens/homescreen/bathskin/bathselect.dart';
import 'package:beautyproducts/screens/homescreen/bathskin/bodyoils.dart';
import 'package:beautyproducts/screens/homescreen/bathskin/bodyscrubs.dart';
import 'package:beautyproducts/screens/homescreen/bathskin/rollons.dart';
import 'package:beautyproducts/screens/homescreen/bathskin/sellercombo.dart';
import 'package:beautyproducts/screens/homescreen/bathskin/showergel.dart';
import 'package:beautyproducts/screens/homescreen/bathskin/womencare.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/notifications.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/likes.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/shopingbag.dart';
import 'package:flutter/material.dart';

class Bathandskin extends StatefulWidget {
  const Bathandskin({super.key});

  @override
  State<Bathandskin> createState() => _BathandskinState();
}

class _BathandskinState extends State<Bathandskin> {
   List<String> listimage = [
    "assets/bodylosh.jpg",
    "assets/showgel.jpg",
    "assets/rolls.jpg",
    "assets/bodyoils.jpg",
    "assets/bodyscrubs.jpg",
    "assets/careproducy.jpg",
    "assets/sellerscobo.jpg",
  ];

  List<String> listText = [
    "Body Lotions",
    "Shower Gels",
    "Roll Ons",
    "Body Oils",
    "Body Scrubs",
    "Perod Care",
    "Best sellers",
  ];

  List<String> listTexts = [
    'Buy one shampoo and get 20% off on any conditioner. Experience a frizz-free and hydrated finish with every wash.',
    'Enjoy a flat 15% discount on all variants. Bring home shine and real nourishment for healthy hair.',
    'Purchase any serum and receive a free travel mini. Protect and perfect your everyday look with ease.',
    'Get a Buy 2, Get 1 Free offer on selected products. Restore smoothness and strength with intense care.',
    'Enjoy a flat 10% discount on all variants. Style confidently without sticky residue.',
    'Grab a flat ₹49 off on selected combs. Give your hair the care it deserves with the right tool.',
    'Enjoy combo offers up to 35% off. Style freely without worrying about damage.',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(   appBar: AppBar(
        backgroundColor: Appcolor.textcolor,
        leading: IconButton(
          onPressed: () {
            
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Skin & Body',
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
                  'Because your body deserves gentle care',
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
                    
                      onTap: () {
                        if (index == 0) {
                         
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Bathselect()),
                          );
                        } else if (index == 1) {
                          
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Showergel()),
                          );
                        } 
                        else if (index ==2){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Rollons()));
                        }
                        else if(index == 3){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Bodyoils() ));
                        }
                        else if(index ==4){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Bodyscrubs()));
                        }
                        else if(index ==5){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Womencare()));
                        }
                         else if(index ==6){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Sellercombo()));
                        }
                       
                      },
                     
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
      ));
  }
}