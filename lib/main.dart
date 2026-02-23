import 'package:beautyproducts/screens/loginscreen/user_model.dart';
import 'package:beautyproducts/screens/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Hive
  await Hive.initFlutter();
  
  // Register Adapter
  if (!Hive.isAdapterRegistered(UserModelAdapter().typeId)) {
    Hive.registerAdapter(UserModelAdapter());
  }
  
  // Open Boxes
  await Hive.openBox<UserModel>("userBox"); // Stores user credentials
  await Hive.openBox("authBox");           // Stores login status (true/false)

  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(), // App always starts at Splash
    );
  }
}