import 'package:flutter/material.dart';
import 'package:web_view_test/config/helpers/payment.dart';

class HtmlProvider extends ChangeNotifier {
  final payment = Payment();

  Future<String> getHtml() async {
    final html = await payment.getPayment();
    return html;
    // notifyListeners();
  }
}
