import 'package:flutter/material.dart';
import '../../core/theme.dart';
import 'product_detail.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الفريد للعسل', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.honey,
        foregroundColor: Colors.white,
        actions: [
          IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen()))),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(color: AppColors.honey, borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
            child: const Text('أجود أنواع العسل الطبيعي 🍯', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.8, crossAxisSpacing: 15, mainAxisSpacing: 15),
              itemCount: products.length,
              itemBuilder: (context, i) => ProductCard(product: products[i]),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Expanded(child: Container(color: Colors.grey[200], child: const Icon(Icons.honeycomb, size: 40, color: AppColors.honey))),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('${product.price} ر.س', style: const TextStyle(color: AppColors.honey)),
                ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailScreen(product: product))), child: const Text('عرض')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Product {
  final String id, name, desc;
  final double price;
  Product(this.id, this.name, this.price, this.desc);
}

List<Product> products = [
  Product('1', 'سدر ملكي', 350, 'عسل سدر جبلي فاخر'),
  Product('2', 'سمر أصيل', 220, 'طاقة ومذاق فريد'),
  Product('3', 'طلح علاجي', 180, 'مفيد جداً للصحة العامة'),
  Product('4', 'مانوكيا', 600, 'أفخر أنواع العسل العالمية'),
];
