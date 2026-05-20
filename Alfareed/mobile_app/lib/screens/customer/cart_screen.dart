import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/theme.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('السلة'), backgroundColor: AppColors.honey, foregroundColor: Colors.white),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                ListTile(leading: Icon(Icons.honeycomb, color: AppColors.honey), title: Text('سدر ملكي'), trailing: Text('350 ر.س')),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('الإجمالي:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), Text('350 ر.س', style: TextStyle(fontSize: 20, color: AppColors.honey))]),
                const SizedBox(height: 20),
                SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => _uploadPayment(context), child: const Text('دفع وتحويل بنكي'))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _uploadPayment(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    await picker.pickImage(source: ImageSource.gallery);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم رفع الوصل، بانتظار تأكيد الإدارة')));
  }
}
