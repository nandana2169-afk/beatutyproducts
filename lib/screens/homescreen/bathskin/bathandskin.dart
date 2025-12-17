import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/Icons/icons.dart';
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
    "assets/rollon.jpg",
    "assets/bodyscrub.jpg",
    "assets/femhige.jpg",
    "assets/handanadleg.jpg",
    "assets/hairstyle.jpg",
  ];

  List<String> listText = [
    "Shampoo & Conditioners",
    "Hair Oil",
    "Hair Serum",
    "Masks",
    "Waxes & Gels",
    "Hair Combs",
    "Styling",
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
    return Scaffold( appBar: AppBar(
        backgroundColor: Appcolor.textcolor,
        leading: IconButton(onPressed: (){}, icon: AppIcon.arrowandro),
        title: Text(
          'Bath and Body',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      backgroundColor: Appcolor.appcolor,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                Text('Hair Repair & Styling', style: TextStyle(fontSize: 20)),
                SizedBox(height: 5),
                Text(
                  '"Beautiful hair begins with healthy habits"',
                  style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: Appcolor.introtext,
                  ),
                ),
                SizedBox(height: 15),
                ListView.builder(
                  itemCount: listimage.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Card(
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
                                width: 100,
                                height: 100,
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    listText[index],
                                    style: TextStyle(
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
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),);
  }
}