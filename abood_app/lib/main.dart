import 'package:abood_app/controller/player_controller.dart';
import 'package:abood_app/model/audio_recorder.dart';
import 'package:abood_app/model/response.dart';
import 'package:abood_app/view/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/sound_controller.dart';
import 'controller/user_contoller.dart';

void main(List<String> args) {
  runApp(AppMain());
}

class AppMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsersController()),
        ChangeNotifierProvider(create: (_) => SoundController()),
        ChangeNotifierProvider(create: (_) => PlayerController()),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, title: "Test", home: HomePage()),
    );
  }
}
