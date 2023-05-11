import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:template/order.dart';
import 'package:template/orderList.dart';

class DioClient {
  var _dio = Dio();
  final _baseUrl = 'https://gorest.co.in/public/v1';

  Future<void> getOrders({required String id}) async {
    Orderlist list;
    try {
      Response ordersd = await _dio.get(_baseUrl +
          '/users?$id/?access-token=efef1adadf100e16c0f106608795d6e219f9c2ec38a7f16889eaf9acd02f201f');
      print('User Info: ${ordersd.data}');
      //user = User.fromJson(userData.data);
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
  }

  Future<void> createUser({required Order order}) async {
    Order? retrievedUser;

    try {
      Response response = await _dio.post(
        _baseUrl +
            '/users?access-token=efef1adadf100e16c0f106608795d6e219f9c2ec38a7f16889eaf9acd02f201f',
        data: order.toJson(),
      );
      print('User created: ${response.data}');
    } catch (e) {
      print('Error creating user: $e');
    }
  }
}
