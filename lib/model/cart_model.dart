// cart_model.dart



class Cart {
  final int id;
  final List<Product> products;
  final double total;
  final double discountedTotal;
  final int userId;
  final int totalProducts;
  final int totalQuantity;

  Cart({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json["id"],
      products: List<Product>.from(
        json["products"].map((x) => Product.fromJson(x)),
      ),
      total: json["total"].toDouble(),
      discountedTotal: json["discountedTotal"].toDouble(),
      userId: json["userId"],
      totalProducts: json["totalProducts"],
      totalQuantity: json["totalQuantity"],
    );
  }
}

class Product {
  final int id;
  final String title;
  final double price;
  final int quantity;
  final double total;
  final double discountPercentage;
  final double discountedTotal;
  final String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedTotal,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      title: json["title"],
      price: json["price"].toDouble(),
      quantity: json["quantity"],
      total: json["total"].toDouble(),
      discountPercentage: json["discountPercentage"].toDouble(),
      discountedTotal: json["discountedTotal"].toDouble(),
      thumbnail: json["thumbnail"],
    );
  }
}
