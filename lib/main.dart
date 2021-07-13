import 'package:flutter/material.dart';
import 'package:framework_flutter/widget/captcha_button.dart';

void main() {
  runApp(MyApp());
}

/// App
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Widget Demo'),
    );
  }
}

/// Created by sean on 2021/7/13.
///
/// homepage
class MyHomePage extends StatefulWidget {
  /// homepage
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  /// title
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const CaptchaButton(),
    );
  }
}
