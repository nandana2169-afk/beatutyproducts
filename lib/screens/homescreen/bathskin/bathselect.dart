import 'package:beautyproducts/detailpages/detailpageone.dart';
import 'package:beautyproducts/screens/favorates/favarateservice.dart';
import 'package:beautyproducts/screens/paymentcartscreen/cartstorage.dart';
import 'package:flutter/material.dart';
import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/notifications.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/likes.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/shopingbag.dart';

class Bathselect extends StatefulWidget {
  const Bathselect({super.key});

  @override
  State<Bathselect> createState() => _BathselectState();
}

class _BathselectState extends State<Bathselect> {
  final List<Products> products = [
    Products(
      name: "NIVEA Nourishing ",
      description: "Youthful looking Skin; Blackcurrant and Bearberry extracts...",
      features: 'The soft, buttery gel lathers well on the skin...',
      images: ['assets/nivyalosh.jpg'],
      rating: 4.5,
      boughtCount: "50k+",
      price: 600,
      discountPrice: 400,
      offer: "5% OFF",
    ),
    Products(
      name: " Dot & Key Vitamin C",
      description: "Dot & Key Vitamin C + E Super Bright Body Lotion...",
      features: 'Reduces dark spots...',
      images: ['assets/dotkylosh.jpg'],
      rating: 4.0,
      boughtCount: "30k+",
      price: 999,
      discountPrice: 849,
      offer: "15% OFF",
    ),
    Products(
      name: "Love Beauty & Planet",
      description: "Love Beauty & Planet Murumuru Butter & Rose...",
      features: 'Provides instant glow...',
      images: ['assets/beautylosh.jpg'],
      rating: 4.0,
      boughtCount: "30k+",
      price: 999,
      discountPrice: 849,
      offer: "15% OFF",
    ),
    Products(
      name: " mCaffeine Deep Moisturizing",
      description: "mCaffeine Deep Moisturizing Choco Body Lotion...",
      features: 'Provides deep moisturization...',
      images: ['assets/coffielosh.jpg'],
      rating: 4.0,
      boughtCount: "30k+",
      price: 999,
      discountPrice: 849,
      offer: "15% OFF",
    ),
    Products(
      name: "PONDs Moisturizing",
      description: "POND'S Moisturizing Body Lotion...",
      features: 'Provides 3X moisturization...',
      images: ['assets/pondsloh.jpg'],
      rating: 4.0,
      boughtCount: "30k+",
      price: 999,
      discountPrice: 849,
      offer: "15% OFF",
    ),
    Products(
      name: "Vaseline Intensive ",
      description: "Vaseline Intensive Care, Deep Moisture...",
      features: 'Provides deep moisture...',
      images: ['assets/vaslosh.jpg'],
      rating: 4.0,
      boughtCount: "30k+",
      price: 999,
      discountPrice: 849,
      offer: "15% OFF",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body Lotions', style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Appcolor.textcolor,
        actions: [
          IconButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications())),
            icon: Icon(Icons.notifications, color: Appcolor.backcolor),
          ),
          IconButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Likes())),
            icon: Icon(Icons.favorite, color: Appcolor.backcolor),
          ),
          IconButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Shopingbag())),
            icon: Icon(Icons.shopping_bag, color: Appcolor.backcolor),
          ),
        ],
      ),
      backgroundColor: Appcolor.appcolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  'assets/bodyloshe.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                ),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                itemCount: products.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.68, // Adjusted slightly to fit the new buttons
                ),
                itemBuilder: (context, index) {
                  return ProductGridItem(item: products[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- NEW WIDGET FOR GRID ITEM TO HANDLE BUTTONS ---
class ProductGridItem extends StatefulWidget {
  final Products item;
  const ProductGridItem({super.key, required this.item});

  @override
  State<ProductGridItem> createState() => _ProductGridItemState();
}

class _ProductGridItemState extends State<ProductGridItem> {
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    checkIfLiked();
  }

  void checkIfLiked() async {
    bool fav = await FavoriteService.isFavorite(widget.item);
    setState(() { isLiked = fav; });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(product: widget.item)));
      },
      child: Card(
        color: Appcolor.lightwhite,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE + LIKE BUTTON OVERLAY
            Expanded(
              child: Stack(
                children: [
                  Image.asset(
                    widget.item.images[0],
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: GestureDetector(
                      onTap: () async {
                        await FavoriteService.toggleFavorite(widget.item);
                        setState(() { isLiked = !isLiked; });
                        // Go to Likes page after liking
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Likes()));
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.8),
                        radius: 16,
                        child: Icon(
                          isLiked ? Icons.favorite : Icons.favorite_border,
                          color: Colors.pink,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              child: Text(
                widget.item.name,
                maxLines: 1,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                children: [
                  Text("₹${widget.item.discountPrice} ", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  Text("₹${widget.item.price}", style: const TextStyle(fontSize: 12, decoration: TextDecoration.lineThrough, color: Colors.grey)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(widget.item.offer, style: TextStyle(color: Appcolor.introtext, fontSize: 11)),
            ),

            // RATING + ADD TO CART BUTTON ROW
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6, bottom: 5, top: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.orange, size: 14),
                          const SizedBox(width: 4),
                          Text(widget.item.rating.toString(), style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                      Text("${widget.item.boughtCount} bought", style: TextStyle(fontSize: 10, color: Appcolor.introtext)),
                    ],
                  ),
                  // ADD TO CART BUTTON
                  GestureDetector(
                    onTap: () async {
                      await CartStorage.addToCart(widget.item); // Ensure addToCart logic exists
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Shopingbag()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Appcolor.appcolor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.add_shopping_cart, color: Appcolor.backcolor, size: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- 3. PRODUCT DETAIL PAGE ---
class ProductDetailPage extends StatefulWidget {
  final Products product;

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

   bool isFav = false;

 // Inside _ProductDetailPageState

// Inside _ProductDetailPageState

// Inside _ProductDetailPageState

@override
void initState() {
  super.initState();
  checkFavorite(); // CHECK IMMEDIATELY ON OPEN
}

Future<void> checkFavorite() async {
  // Use the name-based service to check status
  bool fav = await FavoriteService.isFavorite(widget.product);
  if (mounted) {
    setState(() {
      isFav = fav;
    });
  }
}

Future<void> toggleFavorite() async {
  await FavoriteService.toggleFavorite(widget.product);
  // Re-check from storage to be 100% sure the UI matches the data
  bool updatedStatus = await FavoriteService.isFavorite(widget.product);
  setState(() {
    isFav = updatedStatus;
  });
}

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Appcolor.textcolor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 350,
              width: double.infinity,
              color: Appcolor.lightwhite,
              child: Image.asset(product.images[0], fit: BoxFit.contain),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Row(
                    children: [
                      Text(
                        "₹${product.discountPrice}",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "₹${product.price}",
                        style: const TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        product.offer,
                        style: TextStyle(
                          color: Appcolor.introtext,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const Divider(height: 30),

                  const Text(
                    "Product Description",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 15, height: 1.6),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Features",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.features,
                    style: const TextStyle(fontSize: 15, height: 1.6),
                  ),

                  const SizedBox(height: 30),

                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Appcolor.appcolor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child:    IconButton(
                onPressed: toggleFavorite,
                icon: Icon(
                  isFav
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.pink,
                  size: 30,
                ),
              ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Appcolor.appcolor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () async {
                              await CartStorage.addToCart(product);
                              if (!context.mounted) return;

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const Shopingbag(),
                                ),
                              );
                            },
                            child: Text(
                              "ADD TO BAG",
                              style: TextStyle(
                                color: Appcolor.backcolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//   Widget _infoRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: RichText(
//         text: TextSpan(
//           style: const TextStyle(color: Colors.black, fontSize: 15),
//           children: [
//             TextSpan(
//               text: "$label: ",
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//             TextSpan(text: value),
//           ],
//         ),
//       ),
//     );
//   }
// }
