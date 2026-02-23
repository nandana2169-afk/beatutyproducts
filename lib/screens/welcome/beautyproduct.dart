import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/images/image.dart';
import 'package:beautyproducts/screens/loginscreen/registration.dart';
import 'package:beautyproducts/screens/loginscreen/signup.dart';
import 'package:flutter/material.dart';

class Beautyproduct extends StatelessWidget {
  const Beautyproduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.textcolor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'WELCOME',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Appcolor.backcolor,
                ),
              ),
              const SizedBox(height: 30),
              
              // Image Section
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  AppImages.splashimage,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              
              const SizedBox(height: 40),

              // SIGN UP BUTTON
              CustomButton(
                label: 'Sign Up',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Signup()),
                  );
                },
              ),

              const SizedBox(height: 15),

              // OR DIVIDER
              Row(
                children: [
                  Expanded(child: Divider(color: Appcolor.appcolor)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('OR', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Expanded(child: Divider(color: Appcolor.appcolor)),
                ],
              ),

              const SizedBox(height: 15),

              // LOG IN BUTTON
              CustomButton(
                label: 'Log In',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Registration()),
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

// THIS IS THE MISSING CLASS
// Putting it here makes it "Defined" for this file
class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Appcolor.appcolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 20,
            color: Appcolor.backcolor,
          ),
        ),
      ),
    );
  }
}