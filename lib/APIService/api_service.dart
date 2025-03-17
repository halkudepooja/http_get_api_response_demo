import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_get_response_demo/model/cart_model.dart';

class ApiService {
  static String url = "https://dummyjson.com/carts";
  Future<List<Cart>> getData() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = response.body;
      final jsonData = json.decode(data);
      List<Cart> cartList = List<Cart>.from(
        jsonData["carts"].map((x) => Cart.fromJson(x)),
      );
      // (jsonData as List).map((e) => Cart.fromJson(e)).toList();
      return cartList;
    } else {
      throw Exception("Failed to load data");
    }
  }
}
