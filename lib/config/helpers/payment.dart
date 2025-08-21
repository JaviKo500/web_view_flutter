import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:web_view_test/config/constants.dart';

class Payment {
  final _dio = Dio();

  // Future<String> getPayment() async {
  //   // final response = await _dio.get('http://0.0.0.0:8080/paypal/pay?id=1002&is_web=true&access_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5MTU2OWQ0LTFjY2UtNDhjMy1hMGE0LTA2YjQxYmIwM2Y5ZCIsInJvbGUiOiIwMDk3MjA2Ni0zNzQxLTQxOWQtYjZiOS0wZGQ4ZDE2ODBkYTMiLCJhcHBfYWNjZXNzIjp0cnVlLCJhZG1pbl9hY2Nlc3MiOmZhbHNlLCJpYXQiOjE2ODU0NzU4NjMsImV4cCI6MTY4NTQ4MzA2MywiaXNzIjoiZGlyZWN0dXMifQ.Dh3aBmkdFwU75C9ugdiNDRDV0qMknn7D7S8x11Kiwu8');
  //   // final response = await _dio.get('http://0.0.0.0:8080/paypal/pay?id=1002&&access_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5MTU2OWQ0LTFjY2UtNDhjMy1hMGE0LTA2YjQxYmIwM2Y5ZCIsInJvbGUiOiIwMDk3MjA2Ni0zNzQxLTQxOWQtYjZiOS0wZGQ4ZDE2ODBkYTMiLCJhcHBfYWNjZXNzIjp0cnVlLCJhZG1pbl9hY2Nlc3MiOmZhbHNlLCJpYXQiOjE2ODU0NzU4NjMsImV4cCI6MTY4NTQ4MzA2MywiaXNzIjoiZGlyZWN0dXMifQ.Dh3aBmkdFwU75C9ugdiNDRDV0qMknn7D7S8x11Kiwu8');
  //   final response = await _dio.get('http://192.168.88.107:8080/paypal/pay?id=1002&is_web=true&access_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5MTU2OWQ0LTFjY2UtNDhjMy1hMGE0LTA2YjQxYmIwM2Y5ZCIsInJvbGUiOiIwMDk3MjA2Ni0zNzQxLTQxOWQtYjZiOS0wZGQ4ZDE2ODBkYTMiLCJhcHBfYWNjZXNzIjp0cnVlLCJhZG1pbl9hY2Nlc3MiOmZhbHNlLCJpYXQiOjE2ODU1NzEyNzMsImV4cCI6MTY4NTU3ODQ3MywiaXNzIjoiZGlyZWN0dXMifQ.QVz07PcF_XS53L_6VQCh7g8FRDq36tUv07DCRl0UBzg');
  //   // final response = await _dio.get('http://192.168.88.107:8080/paypal/pay?id=1002&is_web=true&access_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5MTU2OWQ0LTFjY2UtNDhjMy1hMGE0LTA2YjQxYmIwM2Y5ZCIsInJvbGUiOiIwMDk3MjA2Ni0zNzQxLTQxOWQtYjZiOS0wZGQ4ZDE2ODBkYTMiLCJhcHBfYWNjZXNzIjp0cnVlLCJhZG1pbl9hY2Nlc3MiOmZhbHNlLCJpYXQiOjE2ODU1NzEyNzMsImV4cCI6MTY4NTU3ODQ3MywiaXNzIjoiZGlyZWN0dXMifQ.QVz07PcF_XS53L_6VQCh7g8FRDq36tUv07DCRl0UBzg');
  //   if (kDebugMode) {
  //     print(response.data);
  //   }
  //   return response.data ?? '';
  // }
  Future<String> getPayment() async {
    // final response = await _dio.get('http://0.0.0.0:8080/deuna/pay?id=2442&is_web=true');
    // final response = await _dio.get('http://0.0.0.0:8080/deuna/pay?id=2442');
    // final response = await _dio.get('https://ca12-190-57-140-22.ngrok-free.app/deuna/pay?id=2442');
    // const url =
    //     'http://10.0.2.2:8080/kushki/pay?id=4834&access_token=iibG1PAH-6gTIMXnblIxFc6O8L6v7-dE';
    const url =
        '$baseUrl/place_to_pay/pay?id=$orderId&access_token=$tokenClient&is_web=true';
    const urlW =
        // 'http://0.0.0.0:8080/pagoplux/pay?id=126858&access_token=30llB4iLTK08Fxw9U-x4bSLFpPZYO_Bw';
        '$baseUrl/place_to_pay/pay?id=$orderId&access_token=$tokenClient&is_web=false';
    final response = await _dio
        .get(url, options: Options(headers: {"ngrok-skip-browser-warning": "69420"}));
    if (kDebugMode) {
      print(response.data);
    }
    return response.data ?? '';
  }
}
