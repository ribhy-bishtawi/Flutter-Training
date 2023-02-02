import 'package:flutter/material.dart';

class EyeColor extends InheritedWidget {
  const EyeColor({
    Key? key,
    @required this.color,
    required Widget child,
  })  : assert(color != null),
        super(key: key, child: child);

  final Color? color;

  static EyeColor? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<EyeColor>();
  }

  @override
  bool updateShouldNotify(EyeColor old) => color != old.color;
}

class ChangingAge extends InheritedWidget {
  const ChangingAge({
    Key? key,
    @required this.age,
    required Widget child,
  })  : assert(age != null),
        super(key: key, child: child);

  final ChangeAge? age;

  static ChangingAge? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ChangingAge>();
  }

  @override
  bool updateShouldNotify(ChangingAge old) => age != old.age;
}

class ChangeAge {
  int age;
  ChangeAge({this.age: 55});

  void changeAge() {
    age += 5;
  }
}

class GrandParent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color? eyeColor = EyeColor.of(context)?.color;
    return _childrenList(eyeColor);
  }
}

Widget _childrenList(Color? eyeColor) => Column(
      children: [
        Text(
          'I am the grandfather! I have three sons and two grandsons. I have blue eyes; that\'s why the text is blue.',
          style: TextStyle(
            color: eyeColor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 5.0,
        ),
        FatherClass(),
      ],
    );

class FatherClass extends StatelessWidget {
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

class UncleClasses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EyeColor(
          color: Colors.blueGrey,
          child: Builder(builder: (BuildContext innerContext) {
            return FirstUncleClass();
          }),
        ),
        const SizedBox(
          height: 20.0,
        ),
        EyeColor(
          color: Colors.green,
          child: Builder(builder: (BuildContext innerContext) {
            return SecondUncleClass();
          }),
        ),
      ],
    );
  }
}

class FirstUncleClass extends StatefulWidget {
  @override
  _FirstUncleClassState createState() => _FirstUncleClassState();
}

class _FirstUncleClassState extends State<FirstUncleClass> {
  var firstUncleAge = ChangeAge(age: 50);
  @override
  Widget build(BuildContext context) {
    Color? eyeColor = EyeColor.of(context)?.color;
    return Column(
      children: [
        Text(
          'I am the first uncle. I have grey eyes and am ${firstUncleAge.age} years old. You can change my age by clicking on the add button below.',
          style: TextStyle(
            color: eyeColor,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 5.0,
        ),
        FloatingActionButton(
          onPressed: () {
            setState(() {
              firstUncleAge.changeAge();
            });
          },
          mini: true,
          backgroundColor: eyeColor,
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}

class SecondUncleClass extends StatefulWidget {
  @override
  _SecondUncleClassState createState() => _SecondUncleClassState();
}

class _SecondUncleClassState extends State<SecondUncleClass> {
  var secondUncleAge = ChangeAge(age: 35);
  @override
  Widget build(BuildContext context) {
    Color? eyeColor = EyeColor.of(context)?.color;
    return Column(
      children: [
        Text(
          'I am the second uncle. I have only one son. I have green eyes and am ${secondUncleAge.age} years old, change my age by clicking on the add button below.',
          style: TextStyle(
            color: eyeColor,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 5.0,
        ),
        FloatingActionButton(
          onPressed: () {
            setState(() {
              secondUncleAge.changeAge();
            });
          },
          mini: true,
          child: Icon(Icons.add),
          backgroundColor: eyeColor,
        ),
        const SizedBox(
          height: 5.0,
        ),
        UnclesChildClass(),
      ],
    );
  }
}

class UnclesChildClass extends StatefulWidget {
  @override
  _UnclesChildClassState createState() => _UnclesChildClassState();
}

class _UnclesChildClassState extends State<UnclesChildClass> {
  @override
  Widget build(BuildContext context) {
    Color? eyeColor = EyeColor.of(context)?.color;
    ChangeAge? unclechildAge = ChangingAge.of(context)?.age;
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(
            'I am the only child of the second uncle. I have green eyes just like my father and am ${unclechildAge?.age} years old. Click on the button below to change my age.',
            style: TextStyle(
              color: eyeColor,
              fontSize: 10.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 5.0,
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                unclechildAge?.changeAge();
              });
            },
            mini: true,
            backgroundColor: eyeColor,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
