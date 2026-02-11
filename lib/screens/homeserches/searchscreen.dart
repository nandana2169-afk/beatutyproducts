import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/screens/homescreen/bathskin/bodyoils.dart';
import 'package:beautyproducts/screens/homescreen/bathskin/bodyscrubs.dart';
import 'package:beautyproducts/screens/homescreen/bathskin/rollons.dart';
import 'package:beautyproducts/screens/homescreen/bathskin/showergel.dart';
import 'package:beautyproducts/screens/homescreen/bathskin/womencare.dart';
import 'package:beautyproducts/screens/homescreen/hairproducteachone/haircareselect.dart';
import 'package:beautyproducts/screens/homescreen/hairproducteachone/hairmasks.dart';
import 'package:beautyproducts/screens/homescreen/hairproducteachone/hairoil.dart';
import 'package:beautyproducts/screens/homescreen/hairproducteachone/hairserum.dart';
import 'package:beautyproducts/screens/homescreen/hairproducteachone/hairstyling.dart';
import 'package:beautyproducts/screens/homescreen/skincare/facewash.dart';
import 'package:beautyproducts/screens/homescreen/skincare/maskpeel.dart';
import 'package:beautyproducts/screens/homescreen/skincare/moiseturizer.dart';
import 'package:beautyproducts/screens/homescreen/skincare/nightcream.dart';
import 'package:beautyproducts/screens/homescreen/skincare/serums.dart';
import 'package:beautyproducts/screens/homescreen/skincare/sunscreen.dart';

import 'package:beautyproducts/screens/makeup/makeup.dart';
import 'package:flutter/material.dart';

// 🔹 IMPORT YOUR REAL PRODUCT PAGES HERE

class SearchProduct {
  final String name;
  final Widget destination;

  SearchProduct({
    required this.name,
    required this.destination,
  });
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  // 🔹 ADD YOUR 50+ PRODUCTS HERE
  List<SearchProduct> productList = [
    SearchProduct(
      name: "Shampoo & Conditioners",
      destination: const Haircareselect(),
    ),
    SearchProduct(
      name: "Body Oils",
      destination: const Bodyoils(),
    ),
    SearchProduct(
      name: "Body Scrubs",
      destination: const Bodyscrubs(),
    ),
    SearchProduct(
      name: "Rollons",
      destination: const Rollons(),
    ),SearchProduct(
      name: "Showergel",
      destination: const Showergel(),
    ),SearchProduct(
      name: "women Care",
      destination: const Womencare(),
    ),SearchProduct(
      name: "Hair Mask",
      destination: const Hairmasks(),
    ),SearchProduct(
      name: "Hair Oils",
      destination: const Hairoil(),
    ),SearchProduct(
      name: "Hair Serum",
      destination: const Hairserum(),
    ),SearchProduct(
      name: "Hair Styling",
      destination: const Hairstyling(),
    ),SearchProduct(
      name: "Facewash",
      destination: const Facewash(),
    ),SearchProduct(
      name: "Maskpeel",
      destination: const Maskpeel(),
    ),SearchProduct(
      name: "Moiseturizer",
      destination: const Moiseturizer(),
    ),SearchProduct(
      name: "Night Creem",
      destination: const Nightcream(),
    ),SearchProduct(
      name: "Serums",
      destination: const Serums(),
    ),SearchProduct(
      name: "Sunscreen",
      destination: const Sunscreen(),
    ),SearchProduct(
      name: "Makeup",
      destination: const Makeup(),
    ),
    // 👉 Add all other products here
  ];

  // 🔹 Initially empty
  List<SearchProduct> searchList = [];

  void searchProduct(String value) {
    if (value.isEmpty) {
      setState(() {
        searchList = [];
      });
    } else {
      setState(() {
        searchList = productList
            .where((product) =>
                product.name.toLowerCase().contains(value.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Products"),backgroundColor: Appcolor.textcolor,
      ),backgroundColor: Appcolor.appcolor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // 🔎 SEARCH FIELD
            TextField(
              onChanged: searchProduct,
              decoration: InputDecoration(
                hintText: "Search products...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),borderSide: BorderSide.none
                ),filled:true,fillColor: Appcolor.textcolor, 
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 SEARCH RESULTS
            Expanded(
              child: searchList.isEmpty
                  ? const Center(
                      child: Text(
                        "Start typing to search",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      itemCount: searchList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(searchList[index].name),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      searchList[index].destination,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
