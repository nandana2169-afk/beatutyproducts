import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/Icons/icons.dart';
import 'package:flutter/material.dart';

class Hairoil extends StatefulWidget {
  const Hairoil({super.key});

  @override
  State<Hairoil> createState() => _HairoilState();
}

class _HairoilState extends State<Hairoil> {
   List<String> listimage = ['assets/oilgirl.jpg'];

  // Product Images
  List<String> listimages = [
    'assets/mamaearth.jpg',
    'assets/amla.jpg',
    'assets/paraoil.jpg',
    'assets/indulekh.jpg',
    'assets/kesh.jpg',
    'assets/sept.jpg',
  ];

  // Product Names
  List<String> names = [
    "Mamaearth",
    "Wow Amla Hair Oil",
    "Parachute Coconut Oil ",
    "Indulekha Hair Oil",
    "Keshpallavi",
    "Sapt Beej",
  ];

  // Offer Percentage
  List<String> offer = [
    "10% OFF",
    "15% OFF",
    "5% OFF",
    "5% OFF",
    "18% OFF",
    "10% OFF",
  ];

  // Original Price (MRP)
  List<int> price = [
    100, 150, 50, 100, 70, 100
  ];

  // Discounted Price
  List<int> discountPrice = [
    250, 220, 210, 175, 250, 280
  ];

  // Star Rating
  List<double> ratings = [
    4.5, 4.0, 4.2, 4.1, 4.6, 3.1
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shampoo & Conditioners',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: AppIcon.iconsapp,
        backgroundColor: Appcolor.textcolor,
      ),
      backgroundColor: Appcolor.appcolor,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [

              // Top Banner
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
                  height: 260,
                ),
              ),

              const SizedBox(height: 10),

              // Grid View Products
              GridView.builder(
                itemCount: listimages.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.78,
                ),
                itemBuilder: (context, index) {
                  return Card(color: Appcolor.lightwhite,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        // Product Image + Offer
                        Expanded(
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  listimages[index],
                                  fit: BoxFit.contain,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),

                             
                            ],
                          ),
                        ),

                        // Product Name (Normal)
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

                        // Price Section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          child: Row(
                            children: [
                              Text(
                                "₹${discountPrice[index]} ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color:Appcolor.backcolor,
                                ),
                              ),
                              Text(
                                "₹${price[index]}",
                                style: TextStyle(
                                  fontSize: 12,
                                  color:Appcolor.backcolor,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Offer Text beside price
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Text(
                            offer[index],
                            style: TextStyle(
                              color:Appcolor.introtext,
                              fontSize: 11,
                            ),
                          ),
                        ),

                        // Rating + Customers
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          child: Row(
                            children: [
                              Icon(Icons.star, color:Appcolor.introtext, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                ratings[index].toString(),
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6, bottom: 5),
                          child: Text(
                            "50k+ bought this",
                            style: TextStyle(fontSize: 15, color: Appcolor.introtext),
                          ),
                        ),
                      ],
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

















