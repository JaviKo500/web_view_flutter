import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

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
        'http://10.0.2.2:8080/afinia/pay?access_token=vyHez2mMKLWC9v3sqTq0lNk1Dcw9asyi&id=1593&is_web=false';
    const urlW =
        'http://0.0.0.0:8080/afinia/pay?access_token=vyHez2mMKLWC9v3sqTq0lNk1Dcw9asyi&id=1536&is_web=true';
    // _dio.options.headers["ngrok-skip-browser-warning"] = "69420";

    final response = await _dio
        .get(url);
    if (kDebugMode) {
      print(response.data);
    }
    return response.data ?? '';
  }
}
