import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/screens/bottomnavigation/bottomnavigation.dart';
import 'package:beautyproducts/screens/loginscreen/registration.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmpasswordcontroller =
      TextEditingController();

  final _formkey = GlobalKey<FormState>();
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
                const SizedBox(height: 120),

                Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Appcolor.backcolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),

                const SizedBox(height: 50),

                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),

                      TextFormField(
                        controller: namecontroller,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Appcolor.backcolor,
                          ),
                          hintText: 'Name',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Appcolor.appcolor,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Appcolor.appcolor),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter name';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 10),

                      TextFormField(
                        controller: emailcontroller,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Appcolor.appcolor,
                              width: 2,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Appcolor.backcolor,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Appcolor.appcolor),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email';
                          }
                          if (!RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                          ).hasMatch(value)) {
                            return 'Please add valid email';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 10),

                      TextFormField(
                        controller: phonecontroller,
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Appcolor.appcolor,
                              width: 2,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.call,
                            color: Appcolor.backcolor,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Appcolor.appcolor),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // --- PASSWORD FIELD ---
                      TextFormField(
                        controller: passwordcontroller,
                        // obscureText: true hides text, false shows it.
                        // We initialize showPassword as true in our State class.
                        obscureText: showPassword,
                        autocorrect: false,
                        enableSuggestions: false,
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Appcolor.backcolor,
                          ),
                          suffixIcon: IconButton(
                            // Toggle the icon based on visibility state
                            icon: Icon(
                              showPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Appcolor.backcolor,
                            ),
                            onPressed: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Appcolor.appcolor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Appcolor.appcolor,
                              width: 2,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.red),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }

                          // NEW PATTERN:
                          // (?=.*[A-Za-z]) -> Must contain at least one letter
                          // (?=.*\d)       -> Must contain at least one number
                          // .{8,}          -> Must be at least 8 characters long
                          final regex = RegExp(
                            r'^(?=.*[A-Za-z])(?=.*\d).{8,}$',
                          );

                          if (!regex.hasMatch(value)) {
                            return 'Password must be 8 characters with letters and numbers';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      // --- CONFIRM PASSWORD FIELD ---
                      TextFormField(
                        controller: confirmpasswordcontroller,
                        obscureText: showConfirmPassword,
                        autocorrect: false,
                        enableSuggestions: false,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          prefixIcon: Icon(
                            Icons.lock_reset_outlined,
                            color: Appcolor.backcolor,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              showConfirmPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Appcolor.backcolor,
                            ),
                            onPressed: () {
                              setState(() {
                                showConfirmPassword = !showConfirmPassword;
                              });
                            },
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Appcolor.appcolor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Appcolor.appcolor,
                              width: 2,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.red),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty){
                            return 'Please confirm your password';
                          }
                          if (value != passwordcontroller.text){
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),

                      Center(
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Account Registered Successfully",
                                      ),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );

                                  Future.delayed(
                                    const Duration(seconds: 2),
                                    () {
                                      if (!context.mounted) return;
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Bottomnavigation(),
                                        ),
                                      );
                                    },
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Appcolor.appcolor,
                              ),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Appcolor.backcolor,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already a user? ",
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
                                    builder: (context) => const Registration(),
                                  ),
                                );
                              },
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                  color: Appcolor.purples,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
