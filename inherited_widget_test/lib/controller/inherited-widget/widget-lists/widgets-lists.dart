import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class EyeColor extends InheritedWidget {
  final Color color;
  EyeColor({
    super.key,
    required this.color,
    required super.child,
  });

  static EyeColor? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<EyeColor>();
  }

  @override
  bool updateShouldNotify(covariant EyeColor oldWidget) {
    return oldWidget.color != color;
  }
}

class GrandParent extends StatelessWidget {
  const GrandParent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color parentColor = EyeColor.of(context)!.color;
    return childrenList(parentColor);
  }

  Widget childrenList(Color? parentColor) {
    return Column(
      children: [
        Text(
          "This is the parent and i have $parentColor eyes and one son",
          style: TextStyle(
            color: parentColor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        FatherClass(),
      ],
    );
  }
}

class FatherClass extends StatelessWidget {
  const FatherClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? fatherEyeColor = EyeColor.of(context)?.color;
    return Center(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(5.0),
            child: Text(
              'I am the father, and I was born with blue eyes. I have a son.',
              style: TextStyle(
                color: fatherEyeColor,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SonClass(),
        ],
      ),
    );
  }
}

class SonClass extends StatelessWidget {
  const SonClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? sonEyeColor = EyeColor.of(context)?.color;
    return Text(
      'I am the son and have blue eyes like the sky.',
      style: TextStyle(
        color: sonEyeColor,
        fontSize: 10.0,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}
