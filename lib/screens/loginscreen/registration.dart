import 'package:flutter/material.dart';
import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/screens/bottomnavigation/bottomnavigation.dart';
import 'package:beautyproducts/screens/loginscreen/signup.dart';
import 'package:beautyproducts/textformfield/textformfield.dart';

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
              children: [

                /// 🔹 Space from top
                const SizedBox(height: 50),

                /// 🔹 Centered Login Title
                Center(
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      color: Appcolor.backcolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),

                const SizedBox(height: 150),

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      /// ✔ Email / Phone
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Customtextformfield(
                          hintText: 'Email id or Phone number',
                          fillColor: Appcolor.textcolor,
                          icon: Icons.email,
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

                      /// ✔ Password
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Customtextformfield(
                          hintText: 'Password',
                          fillColor: Appcolor.textcolor,
                          icon: Icons.password,
                          controller: passwordcontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                        ),
                      ),

                      /// ✔ Remember Me & Forgot Password
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
                                  style: TextStyle(
                                    color: Appcolor.backcolor,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Forgot Password Clicked"),
                                  ),
                                );
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: Appcolor.backcolor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// ✔ Login Button
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const Bottomnavigation(),
                                  ),
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

                      /// ✔ Signup Link
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Need an account? ",
                            style: TextStyle(
                              color: Appcolor.backcolor,
                              fontSize: 15,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Signup(),
                                ),
                              );
                            },
                            child: Text(
                              "SIGN UP",
                              style: TextStyle(
                                color: Appcolor.backcolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                    ],
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
