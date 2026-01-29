import 'dart:convert';
import 'package:beautyproducts/detailpages/detailpageone.dart';
import 'package:beautyproducts/screens/paymentcartscreen/cartmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartStorage {
  static const String _cartKey = 'current_cart';
  static const String _historyKey = 'order_history';

  // ---------------- CURRENT CART ----------------
  static Future<List<CartItem>> getCart() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_cartKey);
    if (data == null) return [];
    final List decoded = jsonDecode(data);
    return decoded.map((e) => CartItem.fromJson(e)).toList();
  }

  static Future<void> addToCart(Products product) async {
    final cart = await getCart();

    final index = cart.indexWhere((item) => item.product.name == product.name);
    if (index >= 0) {
      cart[index].quantity++;
    } else {
      cart.add(CartItem(product: product));
    }

    await _saveCart(cart);
  }

  static Future<void> removeFromCart(String name) async {
    final cart = await getCart();
    cart.removeWhere((item) => item.product.name == name);
    await _saveCart(cart);
  }

  static Future<void> updateQuantity(String name, int quantity) async {
    final cart = await getCart();
    final index = cart.indexWhere((item) => item.product.name == name);
    if (index >= 0) {
      if (quantity > 0) {
        cart[index].quantity = quantity;
      } else {
        cart.removeAt(index);
      }
    }
    await _saveCart(cart);
  }

  static Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_cartKey);
  }

  static Future<void> _saveCart(List<CartItem> cart) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _cartKey,
      jsonEncode(cart.map((e) => e.toJson()).toList()),
    );
  }

  // ---------------- ORDER HISTORY (Optional) ----------------
  static Future<void> saveOrderHistory() async {
    final cart = await getCart();
    if (cart.isEmpty) return;

    final prefs = await SharedPreferences.getInstance();
    final List<String> history =
        cart.map((e) => jsonEncode(e.toJson())).toList();
    await prefs.setStringList(_historyKey, history);

    await clearCart(); // clear current cart after saving
  }

  static Future<List<CartItem>> getOrderHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList(_historyKey) ?? [];
    return data.map((e) => CartItem.fromJson(jsonDecode(e))).toList();
  }
}
