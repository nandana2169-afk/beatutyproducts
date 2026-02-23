import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:beautyproducts/detailpages/detailpageone.dart';

class FavoriteService {
  static const String key = "favorite_products_fix";

  static Future<void> toggleFavorite(Products product) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList(key) ?? [];

    
    int index = favorites.indexWhere((item) => jsonDecode(item)['name'] == product.name);

    if (index != -1) {
      favorites.removeAt(index);
    } else {
      favorites.add(jsonEncode(product.toJson()));
    }
    await prefs.setStringList(key, favorites);
  }

  static Future<bool> isFavorite(Products product) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList(key) ?? [];
  
    return favorites.any((item) => jsonDecode(item)['name'] == product.name);
  }

  static Future<List<Products>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> raw = prefs.getStringList(key) ?? [];
    return raw.map((item) => Products.fromJson(jsonDecode(item))).toList();
  }
}