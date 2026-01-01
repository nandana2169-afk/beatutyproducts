import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/agriment.dart';
import 'package:beautyproducts/images/image.dart';
import 'package:beautyproducts/MainNavigationPage.dart';
import 'package:beautyproducts/screens/homescreen/bathskin/bathandskin.dart';
import 'package:beautyproducts/screens/homescreen/bathskin/bathselect.dart';
import 'package:beautyproducts/screens/homescreen/bathskin/bodyoils.dart';
import 'package:beautyproducts/screens/homescreen/bathskin/bodyscrubs.dart';
import 'package:beautyproducts/screens/homescreen/bathskin/rollons.dart';
import 'package:beautyproducts/screens/homescreen/bathskin/showergel.dart';
import 'package:beautyproducts/screens/homescreen/bathskin/womencare.dart';
import 'package:beautyproducts/screens/homescreen/haircare.dart';
import 'package:beautyproducts/screens/homescreen/hairproducteachone/haircombs.dart';
import 'package:beautyproducts/screens/homescreen/hairproducteachone/hairmasks.dart';
import 'package:beautyproducts/screens/homescreen/hairproducteachone/hairoil.dart';
import 'package:beautyproducts/screens/homescreen/hairproducteachone/hairserum.dart';
import 'package:beautyproducts/screens/homescreen/hairproducteachone/hairstyling.dart';
import 'package:beautyproducts/screens/homescreen/hairproducteachone/haircareselect.dart';
import 'package:beautyproducts/screens/homescreen/homepage.dart';
import 'package:beautyproducts/screens/homescreen/notifications.dart';
import 'package:beautyproducts/screens/loginscreen/registration.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/likes.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/shopingbag.dart';
import 'package:beautyproducts/screens/splashscreen/splashscreen.dart';
import 'package:beautyproducts/signupscreen/signup.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Beautyproduct extends StatefulWidget {
  const Beautyproduct({super.key});

  @override
  State<Beautyproduct> createState() => _BeautyproductState();
}

class _BeautyproductState extends State<Beautyproduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.textcolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'WELCOME',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Appcolor.introtext,
              ),
            ),

            SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 🔥 CROPPED IMAGE (only change made)
                SizedBox(
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20), // crop shape
                    child: Image.asset(
                      AppImages.splashimage,
                      fit: BoxFit.cover, // actual cropping
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signup()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Appcolor.appcolor,
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 20,
                          color: Appcolor.textcolor,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(child: Divider(color: Appcolor.appcolor)),
                      SizedBox(width: 5),
                      Text(
                        'OR',
                        style: TextStyle(
                          color: Appcolor.introtext,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(child: Divider(color: Appcolor.appcolor)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Registration(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Appcolor.appcolor,
                      ),
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 20,
                          color: Appcolor.textcolor,
                        ),
                      ),
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
