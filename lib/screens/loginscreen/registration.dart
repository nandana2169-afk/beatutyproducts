import 'package:beautyproducts/screens/lockscreens/lockscreen.dart';
import 'package:beautyproducts/screens/loginscreen/user_model.dart';
import 'package:flutter/material.dart';
import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/screens/bottomnavigation/bottomnavigation.dart';
import 'package:beautyproducts/screens/loginscreen/signup.dart';

import 'package:hive/hive.dart';


class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool rememberMe = false;
  bool showPassword = true;
  bool showConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.textcolor,
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const SizedBox(height: 150),
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
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child:  TextFormField(
                        controller: emailcontroller,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Appcolor.appcolor, width: 2),
                          ),
                          prefixIcon: Icon(Icons.email, color: Appcolor.backcolor),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Appcolor.appcolor),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Please enter email';
                          if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) return 'Please add valid email';
                          return null;
                        },
                      ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child:TextFormField(
                        controller: passwordcontroller,
                        obscureText: showPassword,
                        autocorrect: false,
                        enableSuggestions: false,
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock_outline, color: Appcolor.backcolor),
                          suffixIcon: IconButton(
                            icon: Icon(showPassword ? Icons.visibility_off : Icons.visibility, color: Appcolor.backcolor),
                            onPressed: () => setState(() => showPassword = !showPassword),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Appcolor.appcolor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Appcolor.appcolor, width: 2),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Please enter password';
                          return null;
                        },
                      ),
                      ),
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
                                Text("Remember me", style: TextStyle(color: Appcolor.backcolor)),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const Lockscreen()));
                              },
                              child: Text("Forgot Password?", style: TextStyle(color: Appcolor.backcolor)),
                            ),
                          ],
                        ),
                      ),

                   
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                             onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            var userBox = Hive.box<UserModel>('userBox');
                            UserModel? user = userBox.get(emailcontroller.text);

                            if (user != null && user.password == passwordcontroller.text) {
                              // SUCCESS: Save login session
                              var authBox = Hive.box("authBox");
                              authBox.put("isLoggedIn", true);

                              Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (context) => const Bottomnavigation()));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Invalid Credentials")));
                            }
                          }
                        },
                            style: ElevatedButton.styleFrom(backgroundColor: Appcolor.appcolor),
                            child: Text('Log In', style: TextStyle(color: Appcolor.backcolor, fontSize: 20)),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Need an account? ", style: TextStyle(color: Appcolor.backcolor, fontSize: 15)),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Signup()));
                            },
                            child: Text("SIGN UP", style: TextStyle(color: Appcolor.purples, fontWeight: FontWeight.bold, fontSize: 15)),
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