
import 'package:flutter/material.dart';
import '../services/product_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductService _productService = ProductService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الفريد للعسل', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFFD4A373),
      ),
      body: FutureBuilder(
        future: _productService.getProducts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              var product = snapshot.data[index];
              return ListTile(
                leading: Icon(Icons.honey),
                title: Text(product['name']),
                subtitle: Text('\${product['price']} IQD'),
                trailing: Icon(Icons.add_shopping_cart, color: Color(0xFFD4A373)),
                onTap: () {},
              );
            },
          );
        },
      ),
    );
  }
}
