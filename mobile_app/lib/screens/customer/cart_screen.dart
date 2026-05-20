import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/theme.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Map<String, dynamic>> cartItems = [
    {'name': 'عسل سدر ملكي', 'price': 300.0, 'qty': 1},
    {'name': 'عسل سمر', 'price': 200.0, 'qty': 2},
  ];

  double get total => cartItems.fold(0, (sum, item) => sum + (item['price'] * item['qty']));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('سلة التسوق', style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.primaryHoney,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  leading: const Icon(Icons.honeycomb, color: AppColors.primaryHoney),
                  title: Text(item['name']),
                  subtitle: Text('${item['price']} ر.س x ${item['qty']}'),
                  trailing: Text('${item['price'] * item['qty']} ر.س', style: const TextStyle(fontWeight: FontWeight.bold)),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('الإجمالي:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('$total ر.س', style: const TextStyle(fontSize: 22, color: AppColors.primaryHoney, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _showPaymentDialog(context),
                    child: const Text('إتمام الطلب والدفع'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showPaymentDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, left: 20, right: 20, top: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('إتمام الدفع', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            const Text('يرجى تحويل المبلغ إلى الحساب التالي ثم رفع صورة التحويل:'),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
              child: const Text('بنك الراجحي\nرقم الحساب: SA1234567890XXXX', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () async {
                  final ImagePicker picker = ImagePicker();
                  await picker.pickImage(source: ImageSource.gallery);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم رفع الوصول بنجاح، انتظر مراجعة الإدارة')));
                },
                icon: const Icon(Icons.upload_file),
                label: const Text('رفع صورة التحويل'),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
