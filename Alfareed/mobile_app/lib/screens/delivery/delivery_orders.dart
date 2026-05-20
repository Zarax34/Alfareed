import 'package:flutter/material.dart';
import '../../core/theme.dart';

class DeliveryOrdersScreen extends StatelessWidget {
  const DeliveryOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('طلبات التوصيل'), backgroundColor: AppColors.honey, foregroundColor: Colors.white),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: 3,
        itemBuilder: (context, i) => Card(
          child: ListTile(
            leading: const Icon(Icons.location_on, color: AppColors.honey),
            title: Text('طلب #${100+i}'),
            subtitle: const Text('الرياض - حي النرجس'),
            trailing: ElevatedButton(onPressed: () {}, child: const Text('تم')),
          ),
        ),
      ),
    );
  }
}
