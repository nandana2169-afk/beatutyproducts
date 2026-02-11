import 'dart:convert';
import 'package:beautyproducts/detailpages/detailpageone.dart';
import 'package:beautyproducts/screens/paymentcartscreen/cartmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartStorage {
  static const String _cartKey = 'current_cart';
  static const String _historyKey = 'order_history';

  // ---------------- GET CURRENT CART ----------------
  static Future<List<CartItem>> getCart() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_cartKey);
    if (data == null) return [];
    final List decoded = jsonDecode(data);
    return decoded.map((e) => CartItem.fromJson(e)).toList();
  }

  // ---------------- ADD TO CART ----------------
  static Future<void> addToCart(Products product) async {
    final cart = await getCart();

    final index =
        cart.indexWhere((item) => item.product.name == product.name);

    if (index >= 0) {
      cart[index].quantity++;
    } else {
      cart.add(CartItem(product: product));
    }

    await _saveCart(cart);
  }

  // ---------------- REMOVE ITEM ----------------
  static Future<void> removeFromCart(String name) async {
    final cart = await getCart();
    cart.removeWhere((item) => item.product.name == name);
    await _saveCart(cart);
  }

  // ---------------- UPDATE QUANTITY ----------------
  static Future<void> updateQuantity(String name, int quantity) async {
    final cart = await getCart();
    final index =
        cart.indexWhere((item) => item.product.name == name);

    if (index >= 0) {
      if (quantity > 0) {
        cart[index].quantity = quantity;
      } else {
        cart.removeAt(index);
      }
    }

    await _saveCart(cart);
  }

  // ---------------- CLEAR CART ----------------
  static Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_cartKey);
  }

  // ---------------- SAVE CART ----------------
  static Future<void> _saveCart(List<CartItem> cart) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _cartKey,
      jsonEncode(cart.map((e) => e.toJson()).toList()),
    );
  }

  // ---------------- SAVE ORDER HISTORY (FIXED) ----------------
  static Future<void> saveOrderHistory() async {
    final cart = await getCart();
    if (cart.isEmpty) return;

    final prefs = await SharedPreferences.getInstance();

    // Get old history
    final List<String> existingHistory =
        prefs.getStringList(_historyKey) ?? [];

    // Add new items
    for (var item in cart) {
      existingHistory.add(jsonEncode(item.toJson()));
    }

    // Save updated history
    await prefs.setStringList(_historyKey, existingHistory);

    // Clear cart after checkout
    await clearCart();
  }

  // ---------------- GET ORDER HISTORY ----------------
  static Future<List<CartItem>> getOrderHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList(_historyKey) ?? [];
    return data.map((e) => CartItem.fromJson(jsonDecode(e))).toList();
  }
}
