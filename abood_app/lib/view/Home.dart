import 'package:abood_app/controller/player_controller.dart';
import 'package:abood_app/controller/sound_controller.dart';
import 'package:abood_app/controller/user_contoller.dart';
import 'package:abood_app/model/response.dart';
import 'package:abood_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

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
      backgroundColor: MAIN_COLOR,
      appBar: AppBar(
        leading: _icon(),
        title: const Center(
          child: Text(
            "Voice Recorder",
            style: TextStyle(
              color: TEXT_COLOR,
            ),
          ),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _headerSection(usersControllerModel),

              _recordingSection(soundControllerModel, usersControllerModel),
              const SizedBox(
                height: 20,
              ),
              // _getRequestSection(soundControllerModel),
              const SizedBox(
                height: 20,
              ),
              _ui(usersControllerModel, soundControllerModel),
            ],
          ),
        ),
      ),
    );
  }

  _recordingSection(SoundController soundControllerModel,
      UsersController usersControllerModel) {
    final isRecording = soundControllerModel.isRecording;
    final icon = isRecording ? Icons.mic : Icons.mic_off;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: const CircleBorder(), //<-- SEE HERE
          padding: const EdgeInsets.all(10),
        ),
        onPressed: () async {
          final isRecording =
              await soundControllerModel.toggleRecording(usersControllerModel);
          // usersControllerModel.getUsers();
        },
        child: Container(
          width: 200.0,
          height: 200.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            border: GradientBoxBorder(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    LINEAR_GRADIENT_COLOR_1,
                    LINEAR_GRADIENT_COLOR_2,
                  ]),
              width: 4,
            ),
          ),
          child: Container(
            width: 150.0,
            height: 150.0,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    LINEAR_GRADIENT_COLOR_1,
                    LINEAR_GRADIENT_COLOR_2,
                  ]),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 50,
            ),
          ),
        ));
  }

  _ui(UsersController usersControllerModel,
      SoundController soundControllerModel) {
    return Container(
      child: soundControllerModel.isRecording
          ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                valueColor:
                    AlwaysStoppedAnimation<Color>(LINEAR_GRADIENT_COLOR_1),
                strokeWidth: 5.0,
              ),
            )
          : Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    NBest userModel = usersControllerModel.nBestList[index];
                    return Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Column(children: [
                          ScoreListTile(
                            header: 'درجة الدقة',
                            score: userModel.accuracyScore / 100,
                          ),
                          ScoreListTile(
                            header: 'درجة الاكتمال',
                            score: userModel.completenessScore / 100,
                          ),
                          ScoreListTile(
                            header: 'درجة الطلاقة',
                            score: userModel.fluencyScore / 100,
                          ),
                          ScoreListTile(
                            header: 'درجة النطق',
                            score: userModel.pronScore / 100,
                          ),

                          //  Text(
                          //     userModel.display,
                          //     style: const TextStyle(color: Colors.white),
                          //   ),
                          //   Text(
                          //     userModel.words[index].offset.toString(),
                          //     style: const TextStyle(color: Colors.white),
                          //   ),
                        ]),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: usersControllerModel.nBestList.length),
            ),
    );
  }

  _icon() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Image.asset(
            'assets/Images/fries-menu.png',
            width: 30.0,
            height: 30.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  _headerSection(UsersController usersControllerModel) {
    String _randomWord = usersControllerModel.randomWordString;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$_randomWord"),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () async {
              await usersControllerModel.setRandomWordString();
            },
          ),
        ],
      ),
    );
  }
}

class ScoreListTile extends StatelessWidget {
  final String header;
  final double score;

  ScoreListTile({required this.header, required this.score});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        header,
        style: const TextStyle(color: TEXT_COLOR),
      ),
      trailing: SizedBox(
        width: 100,
        height: 30,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(3.0, 3.0, 3.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: LinearPercentIndicator(
                  lineHeight: 14.0,
                  percent: score,
                  center: Text(
                    "$score%",
                    style: TextStyle(fontSize: 12.0),
                  ),
                  // trailing: Icon(Icons.mood),
                  barRadius: const Radius.circular(16),
                  backgroundColor: Colors.grey,
                  progressColor: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
