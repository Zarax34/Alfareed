import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../home_screen.dart';
import '../honey_product.dart'; // This will be handled by the model in home_screen for simplicity

class ProductDetailScreen extends StatelessWidget {
  final dynamic product; // using dynamic to avoid circular dependency for now
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: AppColors.primaryHoney,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            color: Colors.grey[200],
            child: const Icon(Icons.honeycomb, size: 100, color: AppColors.primaryHoney),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                Text('${product.price} ر.س', style: const TextStyle(fontSize: 22, color: AppColors.primaryHoney, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                const Text('الوصف', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text(product.description, style: const TextStyle(fontSize: 16, color: Colors.grey)),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تمت الإضافة للسلة')));
                    },
                    child: const Text('إضافة إلى السلة', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
