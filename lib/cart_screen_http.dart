import 'package:flutter/material.dart';
import 'package:http_get_response_demo/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Carts')),
      body: cartProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : cartProvider.carts.isEmpty
              ? Center(child: Text('No carts available'))
              : ListView.builder(
                  itemCount: cartProvider.carts.length,
                  itemBuilder: (context, cartIndex) {
                    final cart = cartProvider.carts[cartIndex];
                    return Card(
                      margin: EdgeInsets.all(10),
                      child: ExpansionTile(
                        title: Text("ID: ${cart.id} - Total: \$${cart.total.toStringAsFixed(2)}"),
                        subtitle: Text("Discounted Total: \$${cart.discountedTotal.toStringAsFixed(2)}"),
                        children: [
                          Column(
                            children: cart.products.map((product) {
                              return ListTile(
                                leading: Image.network(
                                  product.thumbnail,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                                title: Text(product.title),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Price: \$${product.price.toStringAsFixed(2)}'),
                                    Text('Quantity: ${product.quantity}'),
                                    Text('Discounted Price: \$${product.discountedTotal.toStringAsFixed(2)}'),
                                  ],
                                ),
                                trailing: Text('Total: \$${product.total.toStringAsFixed(2)}'),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cartProvider.getCarts();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
