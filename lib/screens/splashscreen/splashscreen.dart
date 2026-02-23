import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/images/image.dart';
import 'package:beautyproducts/main.dart';
import 'package:beautyproducts/screens/bottomnavigation/bottomnavigation.dart';
import 'package:beautyproducts/screens/loginscreen/registration.dart';
import 'package:beautyproducts/screens/welcome/beautyproduct.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
 void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    // Wait for 3 seconds to show logo
    await Future.delayed(const Duration(seconds: 3));
    
    var authBox = Hive.box("authBox");
    bool isLoggedIn = authBox.get("isLoggedIn") ?? false;

    if (!mounted) return;

    if (isLoggedIn) {
      // User is logged in, go to Home
      Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Bottomnavigation()));
    } else {
      // User is NOT logged in, go to Login (Registration screen)
      Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Beautyproduct()));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.textcolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 1. BLOPINK Text Animation
            TweenAnimationBuilder(
              duration: const Duration(milliseconds: 1500),
              tween: Tween<double>(begin: 0, end: 1),
              curve: Curves.easeOut, 
              builder: (context, double value, child) {
                return Opacity(
                  opacity: value.clamp(0.0, 1.0), 
                  child: Transform.scale(
                    scale: value,
                    child: child,
                  ),
                );
              },
              child: Text(
                'BLOPINK',
                style: TextStyle(
                  fontSize: 50,
                  color: Appcolor.introtext,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),

            // 2. Subtitles Animation (Slide Up + Fade)
            TweenAnimationBuilder(
              duration: const Duration(milliseconds: 1500),
              tween: Tween<double>(begin: 1, end: 0),
              builder: (context, double value, child) {
                return Transform.translate(
                  offset: Offset(0, value * 30), 
                  child: Opacity(
                    opacity: (1 - value).clamp(0.0, 1.0), 
                    child: child,
                  ),
                );
              },
              child: Column(
                children: [
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
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 3. Image Animation (Fade In)
            TweenAnimationBuilder(
              duration: const Duration(milliseconds: 2000),
              tween: Tween<double>(begin: 0, end: 1),
              builder: (context, double value, child) {
                return Opacity(
                  opacity: value.clamp(0.0, 1.0),
                  child: child,
                );
              },
              child: SizedBox(
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    AppImages.splashimageone,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}