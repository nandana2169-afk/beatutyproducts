import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/Icons/icons.dart';
import 'package:beautyproducts/screens/loginscreen/registration.dart';
import 'package:flutter/material.dart';

class Newpassword extends StatefulWidget {
  const Newpassword({super.key});

  @override
  State<Newpassword> createState() => _NewpasswordState();
}

class _NewpasswordState extends State<Newpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor.textcolor,
        leading: AppIcon.iconsapp,
        title: Text(
          'Create a New Password',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Appcolor.textcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/lock.jpg'),
            Text(
              'Your New Password Must Be Different from Previously Used Passsword',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Appcolor.appcolor),
                  ),labelText: "Enter a New Password"
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Appcolor.appcolor),
                  ),labelText: "Confirm Password"
                ),
              ),),// reset_password.dart
ElevatedButton(
  onPressed: () async {
    await Future.delayed(const Duration(seconds: 2));
    if (!context.mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => const Registration(), // your existing login screen
      ),
      (route) => false,
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Appcolor.appcolor,
  ),
  child: Text(
    "Reset Password",
    style: TextStyle(color: Appcolor.backcolor),
  ),
),


          ],
        ),
      ),
    );
  }
}
