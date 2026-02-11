import 'package:beautyproducts/screens/paymentcartscreen/cartstorage.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/shopingbag.dart';
import 'package:flutter/material.dart';
import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/screens/favorates/favarateservice.dart';
import 'package:beautyproducts/detailpages/detailpageone.dart'; 

class Likes extends StatefulWidget {
  const Likes({super.key});

  @override
  State<Likes> createState() => _LikesState();
}

class _LikesState extends State<Likes> {
  List<Products> favorites = [];

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final favList = await FavoriteService.getFavorites();
    setState(() {
      favorites = favList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "My Favorites",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Appcolor.appcolor,
      ),
      // --- FIX STARTS HERE ---
      body: favorites.isEmpty
          ? Center( // Center only takes ONE child
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Centers content vertically
                children: [
                  Icon(
                    Icons.favorite_border_sharp,
                    size: 100,
                    color: Appcolor.appcolor,
                  ),
                  const SizedBox(height: 20),
                   Text(
                    "No favorites yet",
                    style: TextStyle(fontSize: 16, color: Appcolor.backcolor),
                  ),
                ],
              ),
            )
          // --- FIX ENDS HERE ---
          : ListView.builder(
              itemCount: favorites.length,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {
                final item = favorites[index];

                return Card(
                  elevation: 2,color:  const Color.fromARGB(255, 243, 232, 232),
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      // tileColor:  const Color.fromARGB(255, 243, 232, 232),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          item.images[0],
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        item.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "₹${item.discountPrice}",
                            style:  TextStyle(
                                color: Appcolor.backcolor, 
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 35,
                            width: 120,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Appcolor.appcolor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () async {
                                await CartStorage.addToCart(item);

                                if (!context.mounted) return;

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Shopingbag(),
                                  ),
                                );
                              },
                              child: const Text(
                                "ADD TO BAG",
                                style: TextStyle(
                                    fontSize: 11, 
                                    color: Colors.white, 
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 30,
                        ),
                        onPressed: () async {
                          await FavoriteService.toggleFavorite(item);
                          loadFavorites();
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}