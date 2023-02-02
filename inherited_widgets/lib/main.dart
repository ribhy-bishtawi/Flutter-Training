import 'package:flutter/material.dart';

import 'controller/inherited-widget/inherited-widget.dart';

main() => runApp(OurApp());

class OurApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inherited Widget Explained',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: InheritedWidgetPage(),
      ),
    );
  }
}
