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
      description:
          "Youthful looking Skin; Blackcurrant and Bearberry extracts pampers your skin and gives you a youthful glow.; Lucisous fragrance surrounds you for a long time.Softer, Smoother Skin Enriched with Skin Conditioners and Moisture Lock it helps to retain moisture of the skin to make it softer, smoother and supple",
      features:
          'The soft, buttery gel lathers well on the skin and washes away dirt to make it clean and clear.',
      images: ['assets/nivyalosh.jpg'],
      rating: 4.5,
      boughtCount: "50k+",
      price: 600,
      discountPrice: 400,
      offer: "5% OFF",
    ),
    Products(
      name: " Dot & Key Vitamin C",
      description:
          "Dot & Key Vitamin C + E Super Bright Body Lotion is a deep nourishing body lotion that helps to reduce dark spots and tanning, leaving your skin looking visibly brighter and more radiant. It is enriched with triple Vitamin C and Niacinamide that help to deeply nourish and hydrate your skin.",
      features:
          'Reduces dark spots and tanning,Enriched with triple Vitamin C and Niacinamide,Provides deep nourishment and hydration,Suitable for both women and men',
      images: ['assets/dotkylosh.jpg'],
      rating: 4.0,
      boughtCount: "30k+",
      price: 999,
      discountPrice: 849,
      offer: "15% OFF",
    ),
    Products(
      name: "Love Beauty & Planet",
      description:
          "Love Beauty & Planet Murumuru Butter & Rose Daily Moisturising Lotion is a gentle and nourishing body lotion that provides instant glow to your skin. It is enriched with murumuru butter and rose extract that help to deeply moisturize and soften your skin.",
      features:
          'Provides instant glow,Enriched with murumuru butter and rose extract,Suitable for all skin types,Paraben-free formula',
      images: ['assets/beautylosh.jpg'],
      rating: 4.0,
      boughtCount: "30k+",
      price: 999,
      discountPrice: 849,
      offer: "15% OFF",
    ),
    Products(
      name: " mCaffeine Deep Moisturizing",
      description:
          "mCaffeine Deep Moisturizing Choco Body Lotion is a deeply moisturizing body lotion that is suitable for all seasons. It is enriched with cocoa butter and shea butter that help to deeply nourish and hydrate your skin, leaving it feeling soft and smooth.",
      features:
          'Provides deep moisturization,Enriched with cocoa butter and shea butter,Suitable for all seasons,Non-sticky formula,Suitable for both women and men',
      images: ['assets/coffielosh.jpg'],
      rating: 4.0,
      boughtCount: "30k+",
      price: 999,
      discountPrice: 849,
      offer: "15% OFF",
    ),
    Products(
      name: "PONDs Moisturizing",
      description:
          "POND'S Moisturizing Body Lotion is a lightweight body lotion that provides 3X moisturization to your skin, leaving it feeling silky soft, smooth, and radiant. It is enriched with Niacinamide that helps to brighten and even out your skin tone.",
      features:
          'Provides 3X moisturization,Enriched with Niacinamide for skin brightening,Lightweight and non-sticky formula,Quick-absorbing,Suitable for all skin types',
      images: ['assets/pondsloh.jpg'],
      rating: 4.0,
      boughtCount: "30k+",
      price: 999,
      discountPrice: 849,
      offer: "15% OFF",
    ),
    Products(
      name: "Vaseline Intensive ",
      description:
          "Vaseline Intensive Care, Deep Moisture Nourishing Body Lotion is a deeply moisturizing body lotion that helps to nourish and hydrate dry, rough skin, leaving it feeling soft and smooth. It is enriched with glycerin that helps to lock in moisture and keep your skin hydrated all day long.",
      features:
          'Provides deep moisture and nourishment,Enriched with glycerin for long-lasting hydration,Non-sticky and fast-absorbing formula,Suitable for dry and rough skin,Suitable for both men and women',
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
        title: const Text('Body Lotions',
            style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Appcolor.textcolor,
        actions: [
          IconButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => Notifications())),
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
                context, MaterialPageRoute(builder: (context) => Shopingbag())),
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
                    borderRadius: BorderRadius.circular(15)),
                clipBehavior: Clip.antiAlias,
                child: Image.asset('assets/bodyloshe.jpg',
                    fit: BoxFit.cover, width: double.infinity, height: 300),
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
                      backgroundColor: Appcolor.appcolor,
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
                  backgroundColor: Appcolor.backcolor,
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
                        color: Appcolor.textcolor,
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

// --- PRODUCT DETAIL PAGE ---
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