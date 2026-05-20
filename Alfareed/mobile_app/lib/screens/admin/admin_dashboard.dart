import 'package:flutter/material.dart';
import '../../core/theme.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الإدارة'), backgroundColor: AppColors.honey, foregroundColor: Colors.white),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        children: [
          _item(context, 'المنتجات', Icons.inventory),
          _item(context, 'المدفوعات', Icons.payment),
          _item(context, 'التوصيل', Icons.local_shipping),
          _item(context, 'التقارير', Icons.bar_chart),
        ],
      ),
    );
  }

  Widget _item(BuildContext context, String title, IconData icon) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {},
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, size: 40, color: AppColors.honey), Text(title)]),
      ),
    );
  }
}
