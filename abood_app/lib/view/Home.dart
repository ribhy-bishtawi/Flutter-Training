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
            _recordingSection(),
            _ui(usersControllerModel),
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

  _recordingSection() {
    return RippleAnimation(
      repeat: true,
      color: Colors.amber,
      minRadius: 40,
      ripplesCount: 6,
      child: Container(
        width: 70,
        height: 70,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xff4bb543),
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Icon(
          Icons.keyboard_voice_rounded,
          color: Colors.amber,
          size: 30,
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
            UserModel userModel = usersControllerModel.userListModel[index];
            return Container(
              child: Column(children: [
                Text(
                  userModel.email,
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  userModel.name,
                  style: TextStyle(color: Colors.white),
                ),
              ]),
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: usersControllerModel.userListModel.length),
    );
  }
}
