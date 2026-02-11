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
        // Tip: A slightly off-white background makes the white cards pop more
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Appcolor.appcolor,
          iconTheme: IconThemeData(color: Appcolor.backcolor),
          title: Text(
            "My Shopping Bag",
            style: TextStyle(
              color: Appcolor.backcolor,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: TabBar(
            labelColor: Appcolor.backcolor,
            unselectedLabelColor: Appcolor.backcolor.withOpacity(0.7),
            indicatorColor: Appcolor.backcolor,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            tabs: const [
              Tab(text: "Cart"),
              Tab(text: "History"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // ---------------- CART TAB ----------------
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : cartItems.isEmpty
                ? _emptyCartUI()
                : _cartListUI(),

            // ---------------- ORDER HISTORY TAB ----------------
            _orderHistoryUI(),
          ],
        ),
      ),
    );
  }

  // ---------------- EMPTY CART UI ----------------
  Widget _emptyCartUI() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_bag_outlined, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 16),
          const Text(
            "Your bag is empty",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // ---------------- CART LIST UI (HIGHLIGHTED) ----------------
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
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 243, 232, 232), // White card on grey background
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    // BoxShadow(
                    //   color: Appcolor.backcolor,
                    //   blurRadius: 10,
                    //   spreadRadius: 1,
                    //   // offset: const Offset(0, 1), // shadow direction: bottom
                    // ),
                  ],
                ),
                child: Row(
                  children: [
                    // Product Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        item.product.images.first,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Product Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.product.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "₹${item.product.price}",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          const SizedBox(height: 8),

                          // Quantity Selector
                          Row(
                            children: [
                              _qtyBtn(Icons.remove, () async {
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
                              }),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                child: Text(
                                  "${item.quantity}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              _qtyBtn(Icons.add, () async {
                                item.quantity++;
                                await CartStorage.updateQuantity(
                                  item.product.name,
                                  item.quantity,
                                );
                                setState(() {});
                              }),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Total Price & Delete
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "₹${item.product.price * item.quantity}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Appcolor.backcolor,
                            fontSize: 16,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            await CartStorage.removeFromCart(item.product.name);
                            cartItems.removeAt(index);
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        // ---------------- CHECKOUT SECTION (HIGHLIGHTED) ----------------
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Appcolor.appcolor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Appcolor.textcolor,
                blurRadius: 20,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Subtotal",
                    style: TextStyle(fontSize: 16, color: Appcolor.backcolor),
                  ),
                  Text(
                    "₹${getTotalPrice().toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Appcolor.textcolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  onPressed: cartItems.isEmpty
                      ? null
                      : () async {
                          await CartStorage.saveOrderHistory();
                          setState(() {
                            cartItems = [];
                          });
                          if (!mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Order Successful!")),
                          );
                        },
                  child: Text(
                    "Checkout Now",
                    style: TextStyle(
                      color: Appcolor.backcolor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Helper Widget for Quantity Buttons
  Widget _qtyBtn(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(icon, size: 18),
      ),
    );
  }

  // ---------------- ORDER HISTORY UI ----------------
  Widget _orderHistoryUI() {
    return FutureBuilder<List<CartItem>>(
      future: CartStorage.getOrderHistory(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final history = snapshot.data!;
        if (history.isEmpty){
          return const Center(child: Text("No history found"));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: history.length,
          itemBuilder: (context, index) {
            final item = history[index];
            return Card(
              // Using Card here as another way to "pop" items
              margin: const EdgeInsets.only(bottom: 12),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    item.product.images.first,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  item.product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Qty: ${item.quantity}"),
                trailing: Text(
                  "₹${item.product.price * item.quantity}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
