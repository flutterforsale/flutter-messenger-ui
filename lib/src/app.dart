import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:messenger_ui/src/screen/chat_detail/chat_detail.dart';
import 'package:messenger_ui/src/screen/home/home.dart';
import 'package:messenger_ui/src/screen/profile/profile.dart';
import 'package:messenger_ui/src/widgets/app_theme.dart';

var routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => HomeScreen(),
  "/chatDetail": (BuildContext context) => ChatDetail(),
  "/profile": (BuildContext context) => Profile(),
};

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          Platform.isAndroid ? Brightness.light : Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: AppTheme.textTheme,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: routes,
    );
  }
}
