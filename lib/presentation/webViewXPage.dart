import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:web_view_test/domain/response.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class WebViewXPage extends StatefulWidget {
  const WebViewXPage({Key? key, required this.html}) : super(key: key);
  final String html;
  @override
  State<WebViewXPage> createState() => _WebViewXPageState();
}

class _WebViewXPageState extends State<WebViewXPage> {
  late WebViewXController webviewController;
  Size get screenSize => MediaQuery.of(context).size;

  Future<void> openUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    await launchUrl(url);
     if ( Platform.isAndroid) {

        if (await canLaunchUrl(url)) {
          await launchUrl(
            url,
            mode: LaunchMode.externalApplication,
          );
        } else {
          throw 'No se pudo abrir la URL';
        }
      } else {
         if (await canLaunchUrl(url)) {
          await launchUrl(url);
        } else {
          throw 'No se pudo abrir la URL';
        }
      }
  }

  @override
  void dispose() {
    webviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.2),
          color: Colors.white,
        ),
        child: WebViewX(
          key: const ValueKey('webviewx'),
          initialContent: widget.html,
          initialSourceType: SourceType.html,
          height: screenSize.height - 100,
          width: 500,
          // width: double.infinity,
          onWebViewCreated: (controller) => webviewController = controller,
          onPageStarted: (src) =>
              debugPrint('A new page has started loading: $src\n'),
          onPageFinished: (src) =>
              debugPrint('The page has finished loading: $src\n'),
          dartCallBacks: {
            DartCallback(
              name: 'errorFun',
              callBack: (message) {
                if (kDebugMode) {
                  print(message);
                }
              },
            ),
            DartCallback(
              name: 'successMessage',
              callBack: (message) {
                if (kDebugMode) {
                  print(message);
                }
                final response = Response.fromRawJson(message);
                if (kDebugMode) {
                  print('test print');
                  print(response.ok);
                }
                Navigator.of(context).pop();
              },
            ),
            DartCallback(
              name: 'errorMessage',
              callBack: (message) {
                if (kDebugMode) {
                  print(message);
                }
                final response = Response.fromRawJson(message);
                if (kDebugMode) {
                  print('test print');
                  print(response.ok);
                }
                Navigator.of(context).pop();
              },
            ),
            DartCallback(
              name: 'pendingMessage',
              callBack: (message) {
                if (kDebugMode) {
                  print(message);
                }
                final response = Response.fromRawJson(message);
                if (kDebugMode) {
                  print('test print pending');
                  print(response.ok);
                }
                Navigator.of(context).pop();
              },
            ),
            DartCallback(
              name: 'openUrl',
              callBack: (message) {
                if (kDebugMode) {
                  print(message);
                }
                final response = Response.fromRawJson(message);
                if (kDebugMode) {
                  print('test print open');
                  print(response.url);
                }
                openUrl(response.url!);
                // Navigator.of(context).pop();
              },
            ),
          },
          jsContent: const {
            EmbeddedJsContent(
              js: "function testPlatformIndependentMethod() { console.log('Hi from JS') }",
            ),
            EmbeddedJsContent(
              webJs:
                  "function testPlatformSpecificMethod(msg) { TestDartCallback('Web callback says: ' + msg) }",
              mobileJs:
                  "function testPlatformSpecificMethod(msg) { TestDartCallback.postMessage('Mobile callback says: ' + msg) }",
            ),
          },
          webSpecificParams: const WebSpecificParams(
            printDebugInfo: true,
          ),
          mobileSpecificParams: const MobileSpecificParams(
            debuggingEnabled: true,
            androidEnableHybridComposition: true,
          ),
          navigationDelegate: (navigation) {
            debugPrint(navigation.content.sourceType.toString());
            return NavigationDecision.navigate;
          },
        ),
      )),
    );
  }
}
