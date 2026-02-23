import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/detailpages/detailpageone.dart';
import 'package:beautyproducts/screens/favorates/favarateservice.dart';
import 'package:beautyproducts/screens/homescreen/bathskin/bathselect.dart';
import 'package:beautyproducts/screens/paymentcartscreen/cartstorage.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/likes.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/notifications.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/shopingbag.dart';
import 'package:flutter/material.dart';

class Facewash extends StatefulWidget {
  const Facewash({super.key});

  @override
  State<Facewash> createState() => _FacewashState();
}

class _FacewashState extends State<Facewash> {
  final List<Products> products = [
    Products(
      name: "Simple",

      description:
          "This beauty product is crafted to enhance your natural glow while gently caring for your skin. Its lightweight formula absorbs quickly and provides long-lasting hydration. With regular use, your skin feels soft, smooth, and refreshed. Suitable for everyday use and all skin types.",
      features:
          ' A unique formula with HELO SYSTEM that binds water to the skin, preventing moisture loss,Hypoallergenic, Non-comedogenic formula free from Fragrances, Parabens and Sulfates for Dry, Normal Sensitive Skin',
      images: ['assets/facewashone.jpg'],
      rating: 4.5,
      boughtCount: "50k+",

      price: 1859,
      discountPrice: 1529,
      offer: "5% OFF",
    ),
    Products(
      name: "Minimalist  ",

      description:
          "Enriched with nourishing ingredients, this product helps improve skin texture and maintain moisture balance. It works gently yet effectively to support healthy-looking skin. The non-greasy formula leaves your skin feeling comfortable and radiant. Perfect for daily skincare routines.",
      features:
          'Contains 2% niacinamide to fade blemishes & dark spots, Rice water brightens and evens skin tone,Lightweight gel cream absorbs quickly',
      images: ['assets/facewashtwo.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 525,
      discountPrice: 472,
      offer: "15% OFF",
    ),
    Products(
      name: "The Derma Co   ",
      description:
          "Designed for modern beauty needs, this product blends care and performance in one simple step. It helps protect and nourish your skin throughout the day. With a soft, refreshing feel, it enhances your natural beauty effortlessly. Ideal for daily use.",
      features:
          'PRO-CERAMIDES, PEPTIDES, AND VITAMIN E are clinically proven to reduce redness, inflammation, and patchy dull skin for a healthy glow.',
      images: ['assets/facewashthree.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 279,
      discountPrice: 279,
      offer: "15% OFF",
    ),
    Products(
      name: "Ponds Bright Beauty ",

      description:
          "This formula delivers deep nourishment while keeping your skin light and breathable. It helps restore softness and adds a natural glow. Gentle enough for regular use, it supports healthy, well-cared-for skin. A perfect addition to your beauty routine.",
      features:
          '7x barrier repair power, Visibly repairs dryness from 1st use,Spreads Easily & Instantly absorbs.',
      images: ['assets/facewashfour.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 284,
      discountPrice: 212,
      offer: "15% OFF",
    ),
    Products(
      name: "DOT & KEY   ",

      description:
          "Carefully formulated to suit everyday beauty needs, this product helps keep your skin nourished and balanced. Its gentle texture feels light on the skin while delivering lasting comfort. Regular use leaves your skin looking fresh, smooth, and naturally radiant.",
      features:
          '3 Refreshing Fragrances, Helps Beat Underarm Odour, Natural Ingredients, No Harmful Chemicals, Reduces Pigmentation3 Refreshing Fragrances, Helps Beat Underarm Odour, Natural Ingredients, No Harmful Chemicals, Reduces Pigmentation',
      images: ['assets/facewashfive.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 395,
      discountPrice: 316,
      offer: "15% OFF",
    ),
    Products(
      name: "Mamaearth  ",

      description:
          "This beauty essential is designed to provide simple yet effective care. It helps maintain hydration and supports healthy-looking skin throughout the day. The smooth, non-sticky formula makes it easy to use daily. Perfect for a clean and confident beauty routine.",
      features:
          'uitable for all skin types, this face moisturizer is for anyone looking to fight oil-free hydration without any greasy shine.',
      images: ['assets/facewashsix.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 249,
      discountPrice: 144,
      offer: "15% OFF",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Facewashes ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
          ), // Changed from AppIcon.iconsapp for stability
        ),
        backgroundColor: Appcolor.textcolor,
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Notifications()),
            ),
            icon: Icon(Icons.notifications, color: Appcolor.backcolor),
          ),
          IconButton(
          onPressed: () async {
              await Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Likes()));
              setState(() {}); // This re-renders the grid to sync hearts
            },
            icon: Icon(Icons.favorite, color: Appcolor.backcolor),
          ),
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Shopingbag()),
            ),
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  'assets/facewashbanner.jpg',
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
                  childAspectRatio: 0.60,
                ),
                 itemBuilder: (context, index) {
                  // 🔄 CHANGE: Added a UniqueKey so the widget re-checks storage every time parent builds
                  return ProductGridItem(
                    key: UniqueKey(), 
                    product: products[index]
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class ProductGridItem extends StatefulWidget {
  final Products product;
  const ProductGridItem({super.key, required this.product});

  @override
  State<ProductGridItem> createState() => _ProductGridItemState();
}

class _ProductGridItemState extends State<ProductGridItem> {
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    _checkInitialLikeStatus();
  }

  void _checkInitialLikeStatus() async {
    bool fav = await FavoriteService.isFavorite(widget.product);
    if (mounted) setState(() => isLiked = fav);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        // 🔄 CHANGE: Added 'await' and 'setState' so heart updates after returning from Detail page
        await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductDetailPage(product: widget.product)));
        _checkInitialLikeStatus(); // Refresh heart state
      },
      child: Card(
        color: Appcolor.lightwhite,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Image.asset(widget.product.images[0],
                      fit: BoxFit.contain, width: double.infinity),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: CircleAvatar(
                      backgroundColor: Appcolor.textcolor,
                      radius: 16,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border,
                            color: Colors.pink, size: 20),
                        onPressed: () async {
                          await FavoriteService.toggleFavorite(widget.product);
                          setState(() {
                            isLiked = !isLiked;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              child: Text(widget.product.name,
                  maxLines: 1,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 13)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                children: [
                  Text("₹${widget.product.discountPrice}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(width: 5),
                  Text("₹${widget.product.price}",
                      style: const TextStyle(
                          fontSize: 11,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(widget.product.offer,
                  style: TextStyle(color: Appcolor.introtext, fontSize: 11)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange, size: 14),
                  const SizedBox(width: 4),
                  Text(widget.product.rating.toString(),
                      style: const TextStyle(fontSize: 12)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, bottom: 5),
              child: Text("${widget.product.boughtCount} bought",
                  style: TextStyle(fontSize: 11, color: Appcolor.introtext)),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Appcolor.appcolor,
                  minimumSize: const Size(double.infinity, 32),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
                onPressed: () async {
                  await CartStorage.addToCart(widget.product);
                  if(!context.mounted)return;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Shopingbag()));
                },
                child:  Text("Add to Bag",
                    style: TextStyle(
                        color: Appcolor.backcolor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ProductDetailPage extends StatefulWidget {
  final Products product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool isFav = false;

  @override
  void initState() {
    super.initState();
    checkFavorite();
  }

  Future<void> checkFavorite() async {
    bool fav = await FavoriteService.isFavorite(widget.product);
    if (mounted) setState(() => isFav = fav);
  }

  Future<void> toggleFavorite() async {
    await FavoriteService.toggleFavorite(widget.product);
    bool status = await FavoriteService.isFavorite(widget.product);
    setState(() => isFav = status);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
        backgroundColor: Appcolor.textcolor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 350,
              width: double.infinity,
              color: Appcolor.lightwhite,
              child: Image.asset(widget.product.images[0], fit: BoxFit.contain),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.product.name,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Text("₹${widget.product.discountPrice}",
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.green)),
                      const SizedBox(width: 10),
                      Text("₹${widget.product.price}",
                          style: const TextStyle(
                              fontSize: 16,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey)),
                      const SizedBox(width: 10),
                      Text(widget.product.offer,
                          style: TextStyle(
                              color: Appcolor.introtext,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Divider(height: 30),
                  const Text("Product Description",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(widget.product.description,
                      style: const TextStyle(fontSize: 15, height: 1.6)),
                  const SizedBox(height: 10),
                  const Text("Features",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(widget.product.features,
                      style: const TextStyle(fontSize: 15, height: 1.6)),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Appcolor.appcolor, width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          onPressed: toggleFavorite,
                          icon: Icon(isFav ? Icons.favorite : Icons.favorite_border,
                              color: Colors.pink, size: 30),
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
                                    borderRadius: BorderRadius.circular(12))),
                            onPressed: () async {
                              await CartStorage.addToCart(widget.product);
                              if(!context.mounted)return;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Shopingbag()));
                            },
                            child: Text("ADD TO BAG",
                                style: TextStyle(
                                    color: Appcolor.backcolor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
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