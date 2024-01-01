import 'package:app_music/screen/music/components/body.dart';
import 'package:flutter/material.dart';

class MusicScreen extends StatelessWidget {
  static String routeName = "/music_screen";
  const MusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final arguments = ModalRoute.of(context)!.settings.arguments as MusicIndex;
    return Scaffold(
      body: Body(),
    );
  }
}

class MusicIndex {
  int id;
  MusicIndex(this.id);
}
