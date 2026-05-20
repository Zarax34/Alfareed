import 'package:flutter/material.dart';
import '../../core/theme.dart';

class DeliveryOrdersScreen extends StatelessWidget {
  const DeliveryOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('طلبات التوصيل', style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.primaryHoney,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.location_on, color: AppColors.primaryHoney),
              title: Text('طلب #${100 + index} - محمد أحمد'),
              subtitle: const Text('العنوان: الرياض - حي النرجس'),
              trailing: ElevatedButton(
                onPressed: () {
                  Scaffold umaScafoffldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم تحديث الحالة إلى: تم التوصيل')));
                },
                child: const Text('تم التوصيل'),
              ),
            ),
          );
        },
      ),
    );
  }
}
