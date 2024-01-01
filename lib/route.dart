import 'package:app_music/screen/home/home_screen.dart';
import 'package:app_music/screen/music/music_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> route = {
  MusicScreen.routeName: (context) => const MusicScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
};
