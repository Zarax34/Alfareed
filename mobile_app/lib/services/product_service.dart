
import 'package:dio/dio.dart';
class ProductService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://your-api-url.com/api'));
  Future<List<dynamic>> getProducts() async {
    final response = await _dio.get('/products');
    return response.data;
  }
}
