import 'package:flutter/material.dart';
import 'package:http_get_response_demo/APIService/api_service.dart';
import 'package:http_get_response_demo/model/cart_model.dart';

class CartProvider with ChangeNotifier {
  List<Cart> _carts = [];
  bool _isLoading = false;

  List<Cart> get carts => _carts;
  bool get isLoading => _isLoading;

  Future<void> getCarts() async {
    _isLoading = true;
    notifyListeners();

    try {
      _carts = await ApiService().getData();
    } catch (e) {
      // Handle error
      print("Error fetching carts: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
