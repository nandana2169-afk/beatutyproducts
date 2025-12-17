import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/images/image.dart';
import 'package:beautyproducts/main.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState() {
    super.initState();
    navigateHome();
  }

  // 👇 Fixed with mounted check
  navigateHome() async {
    await Future.delayed(Duration(seconds: 5));

    if (!mounted) return; // ✔️ This removes the warning

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Beautyproduct()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.textcolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'BLOPINK',
              style: TextStyle(
                fontSize: 50,
                color: Appcolor.introtext,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            Text(
              'Beauty that blooms',
              style: TextStyle(
                fontSize: 20,
                color: Appcolor.appcolor,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Because you deserve to Glow',
              style: TextStyle(
                fontSize: 20,
                color: Appcolor.appcolor,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      AppImages.splashimageone,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
