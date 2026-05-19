
import 'package:dio/dio.dart';
class OrderService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://your-api-url.com/api'));
  Future<void> createOrder(Map<String, dynamic> orderData, String token) async {
    await _dio.post('/orders', 
      data: orderData, 
      options: Options(headers: {'Authorization': 'Bearer $token'})
    );
  }
}
