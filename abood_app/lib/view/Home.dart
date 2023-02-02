import 'package:abood_app/controller/player_controller.dart';
import 'package:abood_app/controller/sound_controller.dart';
import 'package:abood_app/controller/user_contoller.dart';
import 'package:abood_app/model/response.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    UsersController usersControllerModel = context.watch<UsersController>();
    SoundController soundControllerModel = context.watch<SoundController>();
    PlayerController soundPlayerController = context.watch<PlayerController>();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Abood"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _redocrdingHeading(),
            const SizedBox(
              height: 40,
            ),
            _recordingSection(soundControllerModel),
            _playingHeading(),
            _playingSection(soundPlayerController),
            // _ui(usersControllerModel),
          ],
        ),
      ),
    );
  }

  _redocrdingHeading() {
    return const Center(
      child: Text(
        "Record Audio",
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),
      ),
    );
  }

  _playingHeading() {
    return const Center(
      child: Text(
        "Play Audio",
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),
      ),
    );
  }

  _recordingSection(SoundController soundControllerModel) {
    final isRecording = soundControllerModel.isRecording;
    final icon = isRecording ? Icons.add_card_rounded : Icons.abc;
    return RippleAnimation(
      repeat: true,
      color: Colors.amber,
      minRadius: 40,
      ripplesCount: 6,
      child: InkWell(
        onTap: () async {
          final isRecording = await soundControllerModel.toggleRecording();
        },
        child: Container(
          width: 70,
          height: 70,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xff4bb543),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(
            icon,
            color: Colors.amber,
            size: 30,
          ),
        ),
      ),
    );
  }

  _playingSection(PlayerController soundPlayerContoller) {
    final isPLaying = soundPlayerContoller.isPlaying;
    final icon = isPLaying ? Icons.arrow_back : Icons.abc_outlined;
    return RippleAnimation(
      repeat: true,
      color: Colors.amber,
      minRadius: 40,
      ripplesCount: 6,
      child: InkWell(
        onTap: () async {
          final isRecording =
              await soundPlayerContoller.toggleRecording(whenFinished: () {
            soundPlayerContoller.setIsPlaying();
          });
        },
        child: Container(
          width: 70,
          height: 70,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xff4bb543),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(
            icon,
            color: Colors.amber,
            size: 30,
          ),
        ),
      ),
    );
  }

  _ui(UsersController usersControllerModel) {
    if (usersControllerModel.loading) {
      return Container();
    }
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            NBest userModel = usersControllerModel.nBestList[index];
            return Container(
              child: Column(children: [
                Text(
                  userModel.display,
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  userModel.words[index].offset.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ]),
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: usersControllerModel.nBestList.length),
    );
  }
}
