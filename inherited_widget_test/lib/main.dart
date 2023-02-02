import 'package:flutter/material.dart';

import 'controller/inherited-widget/inherited-widget.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Inherited Widget",
        home: Scaffold(
          body: InheritedWidge(),
        ));
  }
}
