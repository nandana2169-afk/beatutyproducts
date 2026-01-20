import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/Icons/icons.dart';
import 'package:flutter/material.dart';

class Likes extends StatefulWidget {
  const Likes({super.key});

  @override
  State<Likes> createState() => _LikesState();
}

class _LikesState extends State<Likes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.appcolor,
      appBar: AppBar(
        backgroundColor: Appcolor.textcolor,
        leading: IconButton(onPressed: () { Navigator.pop(context);}, icon: AppIcon.iconsapp),
        title: const Text(
          'Your Wish',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
            Icon(Icons.favorite_border, size: 100, color: Appcolor.textcolor),

            const SizedBox(height: 20),

            const Text(
              "No Favorites Yet",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(
              "Tap the heart icon to save products",
              style: TextStyle(fontSize: 14, color: Appcolor.textcolor),
            ),

            const SizedBox(height: 30),

          
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Appcolor.textcolor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Browse Products",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Appcolor.introtext,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


 