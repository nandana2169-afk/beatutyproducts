import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/detailpages/detailpageone.dart';
import 'package:beautyproducts/screens/favorates/favarateservice.dart';
import 'package:beautyproducts/screens/paymentcartscreen/cartstorage.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/likes.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/notifications.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/shopingbag.dart';
import 'package:flutter/material.dart';

class Fragnance extends StatefulWidget {
  const Fragnance({super.key});

  @override
  State<Fragnance> createState() => _FragnanceState();
}

class _FragnanceState extends State<Fragnance> {
   final List<Products> products = [
    Products(
      name: " Ramsons   ",

      description:
          "These fragrances capture the essence of a blooming garden through romantic notes like rose, jasmine, and lily. They are timeless and light, ranging from delicate single-flower scents to complex, multi-layered bouquets. This category is widely considered the most popular and versatile choice for daily wear.",
      features:
          ' Capturing the essence of blooming flowers like rose and jasmine, these scents offer a romantic and timeless appeal. They range from light, airy bouquets to deep petals, making them a versatile choice for any occasion.',
      images: ['assets/perfumeone.jpg'],
      rating: 4.5,
      boughtCount: "50k+",

      price: 859,
      discountPrice: 529,
      offer: "5% OFF",
    ),
    Products(
      name: "EM5 Vanilla ",

      description:
          "Grounded and earthy, woody scents feature rich notes of sandalwood, cedarwood, and vetiver to provide warmth. They evoke the atmosphere of a dry forest or natural timber, offering a sense of stability and sophistication. These fragrances are frequently used as a base to add long-lasting depth to a perfume.",
      features:
          'Grounded by earthy notes of cedar and sandalwood, woody fragrances provide a sense of warmth and natural sophistication. These scents evoke the atmosphere of a forest, offering a long-lasting base that feels both sturdy and elegant.',
      images: ['assets/perfumetwo.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 525,
      discountPrice: 472,
      offer: "15% OFF",
    ),
    Products(
      name: "Conscious Chemist ",
      description:
          " Defined by zesty and clean characters, fresh fragrances utilize citrus, aquatic, or bright green notes for an uplifting effect. They evoke the feeling of a cool ocean breeze or morning dew, offering a refreshing burst of energy. These light scents are the perfect choice for daytime wear or hot summer climates.",
      features:
          ' Characterized by zesty citrus and aquatic notes, fresh fragrances deliver an immediate burst of clean and uplifting energy. They mimic the sensation of an ocean breeze, making them the ideal choice for daytime wear and warm weather.',
      images: ['assets/perfumethree.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 279,
      discountPrice: 279,
      offer: "15% OFF",
    ),
    Products(
      name: " Wild Stone",

      description:
          " Oriental or amber scents are rich and exotic, blending warm spices, resins, and opulent balsamic notes. They create a sensual and mysterious aura that is typically intense and stays on the skin for a long duration. These fragrances are often reserved for evening wear or cold seasons due to their depth.",
      features:
          'Rich and exotic, these scents blend warm spices and sweet resins to create a mysterious and sensual aura. They are typically intense and long-lasting, providing a luxurious depth that is perfectly suited for evening wear.',
      images: ['assets/perfumefour.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 284,
      discountPrice: 212,
      offer: "15% OFF",
    ),
    Products(
      name: "RENEE Eau De ",

      description:
          "These fragrances feature edible, sweet qualities, often smelling like delicious vanilla, chocolate, honey, or warm caramel. They evoke a sense of nostalgic comfort and indulgence, mimicking the sugary aromas found in a luxury bakery. These modern scents are playful and bold, leaving a distinct and lingering trail.",
      features:
          'Designed to smell edible and sweet, gourmand fragrances feature delicious notes of vanilla, chocolate, and caramel. They evoke a sense of nostalgic indulgence and playful warmth, leaving a bold and sugary trail behind the wearer.',
      images: ['assets/perfumefive.jpg'],
      rating: 4.0,
      boughtCount: "30k+",

      price: 395,
      discountPrice: 316,
      offer: "15% OFF",
    ),
    Products(
      name: "Engage W2  ",

      description:
          "Aromatic profiles utilize herbal notes like lavender, rosemary, and sage to create a crisp and sophisticated finish. They provide a rustic, outdoorsy vibe that feels both natural and revitalizing for the wearer at any time. These scents are celebrated for their clean, 'green' energy and classic, refined appeal.",
      features:
          ' Combining rustic herbs like lavender and sage, aromatic profiles offer a clean, sophisticated, and outdoorsy character. These scents provide a revitalizing "green" energy that feels refined, balancing herbal freshness with a smooth finish.',
      images: ['assets/perfumesix.jpg'],
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
          'Fragrance ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
          ), 
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
              setState(() {});
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
                  'assets/perfumebanner.jpg',
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
      
        await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductDetailPage(product: widget.product)));
        _checkInitialLikeStatus(); 
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