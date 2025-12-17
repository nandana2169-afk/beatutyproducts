import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/screens/homescreen/homepage.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
   final List<Map<String, String>> products = [
    {
      'name': 'Pink Sale',
      'description': '20% offer on your first purchase, if you want then grab the offer',
    },
    {
      'name': 'Black Friday',
      'description': 'Huge discounts on all products',
    },
    {
      'name': 'Holiday Offer',
      'description': 'Special deals for holidays',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
        leading: IconButton(
          onPressed: () { Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => Homepage()));},
          icon: Icon(Icons.arrow_back, color: Appcolor.introtext, size: 30),
        ),
        title: Text(
          'Notifications',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Appcolor.textcolor,
        foregroundColor: Appcolor.backcolor,
      ),
      backgroundColor: const Color.fromARGB(255, 214, 162, 180),
      body: ListView.builder(
        itemCount: products.length,
        padding: EdgeInsets.all(12),
        itemBuilder: (context, index) {
         
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.only(bottom: 12),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              title: Text(
                products[index]['name'] !,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(products[index]['description']!),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                
              },
            ),
          );
        },
      ),);
  }
}