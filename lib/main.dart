import 'package:app_music/model/music_service.dart';
import 'package:app_music/route.dart';
import 'package:app_music/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MusicService(),
      child: const MyApp(),
    ),
  );
}

//So welcome to my little app music
//let's go!!
//my app just have 02 views !
//just  build by Flutter
//construit par Pessidjo Germann!
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Music',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routes: route,
      initialRoute: HomeScreen.routeName,
    );
  }
}
