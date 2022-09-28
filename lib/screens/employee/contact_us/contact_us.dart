import 'package:flutter/material.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ContactUs extends StatefulWidget {
  static const String routeName = '/contactus';
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  bool isLoading = true;
  final _key = UniqueKey();

  static const String url = 'https://www.google.co.in/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Contact Us",
        automaticImplyLeading: true,
      ),
      body: Stack(
        children: [
          WebView(
            key: _key,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
            debuggingEnabled: true,
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
        ],
      ),
    );
  }
}
