import 'package:flutter/material.dart';
import '../../core/theme.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('لوحة تحكم المسؤول', style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.primaryHoney,
        foregroundColor: Colors.white,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        children: [
          _buildAdminCard(context, 'إدارة المنتجات', Icons.inventory, () {}),
          _buildAdminCard(context, 'طلبات الدفع', Icons.payment, () {}),
          _buildAdminCard(context, 'توصيل الطلبات', Icons.local_shipping, () {}),
          _buildAdminCard(context, 'التقارير المالية', Icons.bar_chart, () {}),
        ],
      ),
    );
  }

  Widget _buildAdminCard(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: AppColors.primaryHoney),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
