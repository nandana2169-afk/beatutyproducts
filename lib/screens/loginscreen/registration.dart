import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/main.dart';
import 'package:beautyproducts/screens/homescreen/homepage.dart';

import 'package:beautyproducts/signupscreen/signup.dart';
import 'package:beautyproducts/textformfield/textformfield.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  bool rememberMe = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.appcolor,
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Beautyproduct(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 40,
                        color: Appcolor.backcolor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Log In',
                      style: TextStyle(
                        color: Appcolor.backcolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 150),

                Container(
                  width: 350,
                  decoration: BoxDecoration(
                    color: Appcolor.textcolor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 10),

                        /// ✔️ Email / Phone
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Withouticon(
                            hintText: 'Email id or Phone number',
                            controller: phonecontroller,
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
                        ),

                        /// ✔️ Password
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Withouticon(
                            hintText: 'Password',
                            controller: passwordcontroller,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              }
                              return null;
                            },
                          ),
                        ),

                        /// 👇✔️ Remember me & Forgot password UI
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: rememberMe,
                                    activeColor: Appcolor.purples,
                                    onChanged: (value) {
                                      setState(() {
                                        rememberMe = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    "Remember me",
                                    style: TextStyle(color: Appcolor.backcolor),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Forgot Password Clicked"),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    color: Appcolor.backcolor,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// ✔️ Login Button
                        Center(
                          child: SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Homepage()),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Appcolor.purples,
                                ),
                                child: Text(
                                  'Log In',
                                  style: TextStyle(
                                    color: Appcolor.textcolor,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        /// ⭐⭐ Added — Need Account? Signup ⭐⭐
                        SizedBox(height: 10),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Need an account? ",
                                style: TextStyle(color: Appcolor.backcolor, fontSize: 15),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Signup()),
                                  );
                                },
                                child: Text(
                                  "SIGN UP",
                                  style: TextStyle(
                                    color: Appcolor.backcolor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 10),
                        Center(
                          child: Icon(
                            Icons.favorite_border,
                            color: Appcolor.appcolor,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
