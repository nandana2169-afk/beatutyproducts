import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/Icons/icons.dart';
import 'package:beautyproducts/screens/discover/discover.dart';
import 'package:beautyproducts/screens/homeserches/homepage.dart';
import 'package:beautyproducts/screens/profile/profile.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/notifications.dart';
import 'package:flutter/material.dart';

class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({super.key});

  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
  int selectedindex = 0;
     final List<Widget> pages = [
    Homepage(),
   Discover(),
    Profile(),
    Notifications(),
  ];
  
  void itemtap(int index) {
    setState(() {
      selectedindex = index;
    });
  }
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: pages[selectedindex],
        bottomNavigationBar: BottomNavigationBar(
        
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.sunny),
            label: 'Discover',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: 'Profile'),
          BottomNavigationBarItem(
            icon: AppIcon.notifications,
            label: 'Notifications',
          ),
        ],
        selectedItemColor: Appcolor.purples,
        unselectedItemColor: Colors.black,
        showSelectedLabels: true,
        currentIndex: selectedindex,
        onTap: itemtap,
      ),
      
    );
  }
}




