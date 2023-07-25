import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_view_test/presentation/webViewXPage.dart';
import 'package:web_view_test/providers/html_provider.dart';

class OpenWebView extends StatelessWidget {
  const OpenWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<HtmlProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('web'),
      ),
      body: Center(
        child: InkWell(
          child: Container(
            width: 150,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(10)
            ),
            child: const Center(
              child: Text('Open modal', style: TextStyle(
                color: Colors.white,
              ),),
            ),
          ),
          onTap: () async {
            final html = await chatProvider.getHtml();
            showDialog(
              context: context, 
              builder: (context) => WebViewXPage(html: html),
            );
          },
        ),
      ),
    );
  }
}
