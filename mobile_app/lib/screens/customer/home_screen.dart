import 'package:flutter/material.dart';
import '../../core/theme.dart';
import 'product_detail_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الفريد للعسل', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.primaryHoney,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen())),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
S-color: AppColors.primaryHoney,
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
              ),
              child: const Column(
                children: [
                  Text('أجود أنواع العسل الطبيعي', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text('نقاوة ومذاق فريد من نوعه', style: TextStyle(color: Colors.white70, fontSize: 16)),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text('أصنافنا المميزة', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: honeyProducts.length,
              itemBuilder: (context, index) {
                final product = honeyProducts[index];
                return HoneyProductCard(product: product);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HoneyProductCard extends StatelessWidget {
  final HoneyProduct product;
  const HoneyProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailScreen(product: product))),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                ),
                child: const Center(child: Icon(Icons.honeycomb, size: 50, color: AppColors.primaryHoney)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text('${product.price} ر.س', style: const TextStyle(color: AppColors.primaryHoney, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('إضافة', style: TextStyle(fontSize: 12)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HoneyProduct {
  final String id;
  final String name;
  final double price;
  final String description;

  HoneyProduct({required this.id, required this.name, required this.price, required this.description});
}

List<HoneyProduct> honeyProducts = [
  HoneyProduct(id: '1', name: 'عسل سدر ملكي', price: 300, description: 'أجود أنواع سدر الجبال، طبيعي 100%'),
  HoneyProduct(id: '2', name: 'عسل سمر', price: 200, description: 'عسل سمر أصيل يتميز بمذاقه القوي'),
  HoneyProduct(id: '3', name: 'عسل طلح', price: 150, description: 'مثالي لمرضى السكري وبخصائص علاجية'),
  HoneyProduct(id: '4', name: 'عسل مانوكيا', price: 500, description: 'أغلى وأثمن أنواع العسل في العالم'),
];
