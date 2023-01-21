import 'package:flutter/material.dart';

void main() {
  runApp(ContactPage());
}

enum APP_THEME { LIGHT, DARK }

class MyAppThemes {
  //Method to provide light theme
  static ThemeData appThemeLight() {
    return ThemeData(
      // Define the default brightness and colors for the overall app.
      brightness: Brightness.light,

      //Theme for app bar
      appBarTheme: const AppBarTheme(
        //AppBar's color
        color: Colors.green,
        //Theme for AppBar's icons
        iconTheme: IconThemeData(
          //Dark color icons on light colored background
          color: Colors.black,
        ),
      ),

      //Theme for app's icons
      iconTheme: IconThemeData(
        color: Colors.indigo.shade800,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        //White background
        backgroundColor: Colors.white,

        //Black plus (+) sign for FAB
        foregroundColor: Colors.black,
      ),
    );
  }

  static ThemeData appThemeDark() {
    return ThemeData(
      // Define the default brightness and colors for the overall app.
      brightness: Brightness.dark,

      //Theme for app bar
      appBarTheme: const AppBarTheme(
        //AppBar's background color is dark this time
        color: Colors.black,

        //Light color for the app bar's icons
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),

      //App's icons are colored in orange color
      iconTheme: const IconThemeData(
        color: Colors.orange,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        //dark background for FAB
        backgroundColor: Colors.black,

        //White plus (+) sign for FAB
        foregroundColor: Colors.white,
      ),
    );
  }
}

class ContactPage extends StatefulWidget {
  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  var currentTheme = APP_THEME.LIGHT;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: currentTheme == APP_THEME.DARK
          ? MyAppThemes.appThemeDark()
          : MyAppThemes.appThemeLight(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: buildAppBarWidget(),
        body: buildBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: IconButton(
            icon: Icon(Icons.threesixty),
            onPressed: () {
              setState(() {
                //NEW CODE: Currently selected theme toggles when FAB is pressed
                currentTheme == APP_THEME.DARK
                    ? currentTheme = APP_THEME.LIGHT
                    : currentTheme = APP_THEME.DARK;
              });
            },
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget buildAppBarWidget() {
    return AppBar(
      leading: const Icon(
        Icons.arrow_back,
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.star_border),
          onPressed: () {
            print("Contact is starred");
          },
        ),
      ],
    );
  }

  Widget buildBody() {
    return ListView(
      children: [
        Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Emojione_1F60E.svg/640px-Emojione_1F60E.svg.png",
                //Make picture fit its parent
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 60,
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Ribhi Bishtawi",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildCallButton(),
                  buildTextButton(),
                  buildVideoCallButton(),
                  buildEmailButton(),
                  buildDirectionsButton(),
                  buildPayButton(),
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),

            mobilePhoneListTile("05525587511", "Mobile"),
            mobilePhoneListTile("0592751716", "Other"),
            //NEW CODE: Adding `Divider` widget with grey color
            const Divider(
              color: Colors.grey,
            ),
            contactAddresses(Icons.email, "ribhy2001@gmail.com", "Email"),
            contactAddresses(Icons.location_on, "Ankara", "Home"),
          ],
        )
      ],
    );
  }

  Widget buildCallButton() {
    return Column(
      children: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.call,
          ),
          onPressed: () {},
        ),
        const Text("Call"),
      ],
    );
  }

  Widget buildTextButton() {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.message,
          ),
          onPressed: () {},
        ),
        const Text("Text"),
      ],
    );
  }

  buildDirectionsButton() {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.directions,
          ),
          onPressed: () {},
        ),
        const Text("Directions"),
      ],
    );
  }

  buildVideoCallButton() {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.video_call,
          ),
          onPressed: () {},
        ),
        const Text("Video Call"),
      ],
    );
  }

  buildEmailButton() {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.email,
          ),
          onPressed: () {},
        ),
        const Text("Email"),
      ],
    );
  }

  buildPayButton() {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.attach_money,
          ),
          onPressed: () {},
        ),
        const Text("Pay"),
      ],
    );
  }

  Widget mobilePhoneListTile(dynamic phone, dynamic type) {
    return ListTile(
      leading: const Icon(Icons.call),
      title: Text(phone),
      subtitle: Text(type),
      trailing: IconButton(
        icon: const Icon(Icons.message),
        onPressed: () {},
      ),
    );
  }

  Widget contactAddresses(dynamic icon, dynamic email, dynamic type) {
    return ListTile(
      leading: Icon(icon),
      title: Text(email),
      subtitle: Text(type),
    );
  }
}
