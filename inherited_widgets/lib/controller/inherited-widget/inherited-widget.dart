import 'package:flutter/material.dart';
import 'package:inherited_widgets/controller/inherited-widget/widgets-lists/widgets-lists.dart';

class InheritedWidgetPage extends StatefulWidget {
  @override
  _InheritedWidgetPageState createState() => _InheritedWidgetPageState();
}

class _InheritedWidgetPageState extends State<InheritedWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(30.0),
      children: [
        const Text(
          "Passing eye color through inheritance from grandfather to grandson:",
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
        EyeColor(color: Colors.lightBlue, child: GrandParent()),
        const SizedBox(
          height: 25.0,
        ),
        const Text(
          "Changing ages of uncles and their families:",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 25.0,
        ),
        ChangingAge(
          age: ChangeAge(age: 15),
          child: Builder(builder: (BuildContext textContext) {
            return UncleClasses();
          }),
        ),
      ],
    );
  }
}
