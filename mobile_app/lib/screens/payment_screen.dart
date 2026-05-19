
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('إتمام الدفع'), backgroundColor: Color(0xFFD4A373)),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text('يرجى تحويل المبلغ إلى الحساب التالي:'),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(15),
              color: Colors.grey[200],
              child: Text('رقم الحساب: 123456789\nالمصرف: مصرف الرافدين'),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              child: Text('رفع صورة إشعار التحويل'),
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFD4A373)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('تأكيد الطلب'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
