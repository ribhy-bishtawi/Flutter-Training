import 'package:flutter/material.dart';
import 'package:inherited_widget_test/controller/inherited-widget/widget-lists/widgets-lists.dart';

class InheritedWidge extends StatelessWidget {
  const InheritedWidge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        const Text(
          "Test for Inheritance",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10.0,
        ),
        EyeColor(color: Colors.blue, child: const GrandParent())
      ],
    );
  }
}
