import 'package:flutter/material.dart';
import '../../core/theme.dart';

class ProductDetailScreen extends StatelessWidget {
  final dynamic product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name), backgroundColor: AppColors.honey, foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 250, width: double.infinity, color: Colors.grey[200], child: const Icon(Icons.honeycomb, size: 100, color: AppColors.honey)),
            const SizedBox(height: 20),
            Text(product.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('${product.price} ر.س', style: const TextStyle(fontSize: 20, color: AppColors.honey, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(product.desc, style: const TextStyle(fontSize: 16)),
            const Spacer(),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('إضافة للسلة'))),
          ],
        ),
      ),
    );
  }
}
