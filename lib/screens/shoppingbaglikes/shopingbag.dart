import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/screens/paymentcartscreen/cartmodel.dart';
import 'package:beautyproducts/screens/paymentcartscreen/cartstorage.dart';
import 'package:flutter/material.dart';

class Shopingbag extends StatefulWidget {
  const Shopingbag({super.key});

  @override
  State<Shopingbag> createState() => _ShopingbagState();
}

class _ShopingbagState extends State<Shopingbag> {
  List<CartItem> cartItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadCart();
  }

  Future<void> loadCart() async {
    cartItems = await CartStorage.getCart();
    setState(() {
      isLoading = false;
    });
  }

  double getTotalPrice() {
    double total = 0;
    for (var item in cartItems) {
      total += item.product.price * item.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Appcolor.appcolor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          title: Center(
            child: const Text(
              "My Cart",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          bottom: const TabBar(
            labelColor: Colors.black,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            tabs: [
              Tab(text: "Cart"),
              Tab(text: "Order History"),
            ],
          ),
        ),

        // 🛒 EMPTY CART BODY
        body: TabBarView(
          children: [
            // ---------------- CART TAB ----------------
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : cartItems.isEmpty
                ? _emptyCartUI()
                : _cartListUI(),

            // ---------------- ORDER HISTORY TAB ----------------
            FutureBuilder<List<CartItem>>(
              future: CartStorage.getOrderHistory(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final history = snapshot.data!;
                if (history.isEmpty) {
                  return const Center(
                    child: Text(
                      "No orders yet",
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: history.length,
                  itemBuilder: (context, index) {
                    final item = history[index];
                    return ListTile(
                      leading: Image.asset(
                        item.product.images.first,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(item.product.name),
                      subtitle: Text("Qty: ${item.quantity}"),
                      trailing: Text("₹${item.product.price * item.quantity}"),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- EMPTY CART UI ----------------
  Widget _emptyCartUI() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: 100,
              color: Appcolor.textcolor,
            ),
            const SizedBox(height: 20),
            const Text(
              "Your cart is empty",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              "Add products to continue shopping",
              style: TextStyle(color: Appcolor.backcolor, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- CART LIST UI ----------------
  Widget _cartListUI() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      item.product.images.first,
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 12),

                    // PRODUCT INFO + QUANTITY
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.product.name,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () async {
                                  if (item.quantity > 1) {
                                    item.quantity--;
                                    await CartStorage.updateQuantity(
                                      item.product.name,
                                      item.quantity,
                                    );
                                  } else {
                                    await CartStorage.removeFromCart(
                                      item.product.name,
                                    );
                                    cartItems.removeAt(index);
                                  }
                                  setState(() {});
                                },
                              ),
                              Text(
                                item.quantity.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () async {
                                  item.quantity++;
                                  await CartStorage.updateQuantity(
                                    item.product.name,
                                    item.quantity,
                                  );
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // PRICE + DELETE
                    Column(
                      children: [
                        Text(
                          "₹${item.product.price * item.quantity}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () async {
                            await CartStorage.removeFromCart(item.product.name);
                            cartItems.removeAt(index);
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        // ---------------- CHECKOUT ----------------
        Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          color: Appcolor.textcolor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Total: ₹${getTotalPrice().toStringAsFixed(2)}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: cartItems.isEmpty
                    ? null
                    : () async {
                        // Save current cart to order history
                        await CartStorage.saveOrderHistory();
                        setState(() {
                          cartItems = [];
                        });
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Order placed!")),
                        );
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Appcolor.appcolor,
                ),
                child: Text(
                  "Checkout",
                  style: TextStyle(color: Appcolor.backcolor),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
