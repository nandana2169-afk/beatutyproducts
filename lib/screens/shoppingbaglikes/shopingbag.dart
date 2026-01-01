import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/Icons/icons.dart';
import 'package:beautyproducts/screens/homescreen/homepage.dart';
import 'package:flutter/material.dart';

class Shopingbag extends StatefulWidget {
  const Shopingbag({super.key});

  @override
  State<Shopingbag> createState() => _ShopingbagState();
}

class _ShopingbagState extends State<Shopingbag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.appcolor,
      appBar: AppBar(
        backgroundColor: Appcolor.lightwhite,
        title: const Text(
          'Your Bag',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () { Navigator.pop(context);},
          icon: AppIcon.iconsapp,
        ),
      ),

      // 🛒 EMPTY CART BODY
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            // 👜 Empty Bag Icon
            Icon(
              Icons.shopping_bag_outlined,
              size: 100,
              color: Appcolor.lightwhite,
            ),

            const SizedBox(height: 20),

            // TEXT: No Items
            const Text(
              "Your Cart is Empty",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),

            const SizedBox(height: 8),

            Text(
              "Add products to your cart to continue",
              style: TextStyle(
                  fontSize: 14,
                  color: Appcolor.textcolor
              ),
            ),

            const SizedBox(height: 30),

            // 🟢 CONTINUE SHOPPING BUTTON
            ElevatedButton(
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));},
              style: ElevatedButton.styleFrom(
                backgroundColor: Appcolor.textcolor,
                padding: const EdgeInsets.symmetric(
                    horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child:  Text(
                "Continue Shopping",
                style: TextStyle(
                    fontWeight: FontWeight.bold,color: Appcolor.introtext,
                    fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
