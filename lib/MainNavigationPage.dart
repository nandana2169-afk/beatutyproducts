// import 'package:beautyproducts/screens/homescreen/bathskin/bathandskin.dart';
// import 'package:beautyproducts/screens/homescreen/haircare.dart';
// import 'package:beautyproducts/screens/homescreen/homepage.dart';
// import 'package:beautyproducts/screens/shoppingbaglikes/likes.dart';
// import 'package:flutter/material.dart';


// // void main() {
// // runApp(MaterialApp(
// // debugShowCheckedModeBanner: false,
// // home: MainNavigationPage(),
// // ));
// // }


// class MainNavigationPage extends StatefulWidget {
//   @override
//   _MainNavigationPageState createState() => _MainNavigationPageState();
// }

// class _MainNavigationPageState extends State<MainNavigationPage> {
//   int currentIndex = 0;

 
//   final List<Widget> _pages = [
//     Homepage(),
//     Haircare(),
//     Bathandskin(),
//     Likes(),



   
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
    
//       body: _pages[currentIndex],

//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: currentIndex,
//         backgroundColor: Colors.black,
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: Colors.amber,
//         unselectedItemColor: Colors.white,
//         onTap: (i) {
//           setState(() {
//             currentIndex = i;
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//           BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Bookings"),
//           BottomNavigationBarItem(icon: Icon(Icons.support_agent), label: "Support"),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
//         ],
//       ),
//     );
//   }
// }
