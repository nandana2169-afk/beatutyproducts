import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/screens/lockscreens/otpscreen.dart';

import 'package:flutter/material.dart';

class Lockscreen extends StatefulWidget {
  const Lockscreen({super.key});

  @override
  State<Lockscreen> createState() => _LockscreenState();
}

class _LockscreenState extends State<Lockscreen> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: Appcolor.textcolor,leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
          ), // Changed from AppIcon.iconsapp for stability
        ),title: Text('Forgot Password',style: TextStyle(fontWeight: FontWeight.bold),),),
      backgroundColor: Appcolor.textcolor,
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset('assets/lock.jpg'),
              
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "Please Enter Your Email Address or Phone Number To Recieve a Verification Code.", textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  controller: phonecontroller,

                  decoration: InputDecoration(
                    hintText: "Email/Phonenumber",
                    prefixIcon: Icon(Icons.email, color: Appcolor.backcolor),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Appcolor.appcolor)
                    // ),focusedBorder:OutlineInputBorder(borderSide: BorderSide(color: Appcolor.appcolor,))
                  ),),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter phone number or email';
                    }

                    bool isPhone = RegExp(
                      r'^(?:\+91|0)?[6-9]\d{9}$',
                    ).hasMatch(value);

                    bool isEmail = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                    ).hasMatch(value);

                    if (!isPhone && !isEmail) {
                      return 'Enter valid phone number OR email';
                    }
                    return null;
                  },
                ),
              ),SizedBox(height: 15,),
              ElevatedButton(
                onPressed: () async {
                  // Show loading
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) =>
                        const Center(child: CircularProgressIndicator()),
                  );

                  // Fake API delay
                  await Future.delayed(const Duration(seconds: 2));
                  if (!context.mounted) return;
                  // Close loading
                  Navigator.pop(context);

                  // Go to OTP screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Otpscreen()),
                  );
                },style: ElevatedButton.styleFrom(backgroundColor: Appcolor.appcolor),
                child: Text(
                  "Send OTP",
                  style: TextStyle(
                    color: Appcolor.backcolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
