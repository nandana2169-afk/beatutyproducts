import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/screens/lockscreens/newpassword.dart';
import 'package:flutter/material.dart';

class Otpscreen extends StatefulWidget {
  const Otpscreen({super.key});

  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  Widget _otpBox(int index) {
    return SizedBox(
      width: 55,
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "",

          // ✅ NORMAL BORDER
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Appcolor.appcolor, width: 2),
          ),

          // ✅ FOCUSED BORDER
          // focusedBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(10),
          //   borderSide: BorderSide(
          //     color: Appcolor.appcolor,
          //     width: 2,
          //   ),
          // ),

          // OPTIONAL: background color
          filled: true,
          fillColor: Colors.white,
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            _focusNodes[index + 1].requestFocus();
          }
          if (value.isEmpty && index > 0) {
            _focusNodes[index - 1].requestFocus();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor.textcolor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
          ), // Changed from AppIcon.iconsapp for stability
        ),
        title: Text(
          'Verify Your Email or Password',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Appcolor.textcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/lock.jpg'),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Please Enter The 4 Digit Code Sent To Your Email/Phone Number',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: _otpBox(index),
                );
              }),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () async {
                String otp = _controllers.map((e) => e.text).join();

                if (otp.length < 4) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please enter full OTP")),
                  );
                  return;
                }

                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) =>
                      const Center(child: CircularProgressIndicator()),
                );

                await Future.delayed(const Duration(seconds: 2));
                if (!context.mounted) return;

                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Newpassword()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Appcolor.appcolor,
              ),
              child: Text(
                "Verify OTP",
                style: TextStyle(color: Appcolor.backcolor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
