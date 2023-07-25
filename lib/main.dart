import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_view_test/presentation/open_web_view.dart';
import 'package:web_view_test/providers/html_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String html = '<h4> This is some hardcoded HTML code embedded inside the webview <h4> <h2> Hello world! <h2>';
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => HtmlProvider())
      ],
      child: const MaterialApp(
        title: 'Material App',
        home: OpenWebView()
      ),
    );
  }
}