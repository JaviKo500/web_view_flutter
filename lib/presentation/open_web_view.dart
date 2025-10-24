import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_view_test/config/constants.dart';
import 'package:web_view_test/presentation/webViewXPage.dart';
import 'package:web_view_test/providers/html_provider.dart';

class OpenWebView extends StatefulWidget {
  const OpenWebView({Key? key}) : super(key: key);

  @override
  State<OpenWebView> createState() => _OpenWebViewState();
}

class _OpenWebViewState extends State<OpenWebView> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<HtmlProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reference: $orderId'),
      ),
      body: Center(
        child: InkWell(
          child: Container(
            width: 150,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8,
                children: [
                  const Text('Open modal', style: TextStyle(
                    color: Colors.white,
                  ),),
                  if (loading)
                  const SizedBox(width: 24, height: 24,child: CircularProgressIndicator(strokeWidth: 3,),)
                ],
              ),
            ),
          ),
          onTap: () async {
            print('click open modal');
            setState(() {
              loading = true;
            });
            final html = await chatProvider.getHtml();
            setState(() {
              loading = false;
              showDialog(
                context: context, 
                builder: (context) => WebViewXPage(
                  html: html,
                  // url: '$baseUrl/place_to_pay/pay?id=$orderId&access_token=$tokenClient',
                ),
              );
            });
          },
        ),
      ),
    );
  }
}
