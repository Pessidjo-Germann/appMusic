import 'package:app_music/constante.dart';
import 'package:app_music/model/music_service.dart';
import 'package:app_music/model/playlist.dart';
import 'package:app_music/screen/music/music_screen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../model/music.dart';
import 'box_playlist.dart';
import 'categorie_playlist.dart';
import 'custom_appbar_home.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 6),
              CustomAppBarHome(),
              SizedBox(height: 40),
              Text(
                "My Playlist",
                textScaleFactor: 2,
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CategoriesPlaylist(name: 'POP', isSelected: true),
                  CategoriesPlaylist(name: 'RAP', isSelected: true),
                  CategoriesPlaylist(name: 'Hip Hop'),
                  CategoriesPlaylist(name: 'Rock'),
                  CategoriesPlaylist(name: 'Jazz')
                ],
              ),
              SizedBox(height: 32),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  ...List.generate(
                    listPlaylist.length,
                    (index) => BoxPlaylist(playList: listPlaylist[index]),
                  )
                ]),
              ),
              Column(
                children: [
                  Text(
                    "Mes Songs",
                    textScaleFactor: 1.5,
                  ),
                  Column(
                    children: [
                      ...List.generate(listMusic.length,
                          (index) => MusicItem(music: listMusic[index]))
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MusicItem extends StatefulWidget {
  MusicItem({
    super.key,
    required this.music,
    this.isFavourite = false,
  });

  final Music music;
  bool isFavourite;

  @override
  State<MusicItem> createState() => _MusicItemState();
}

class _MusicItemState extends State<MusicItem> {
  AudioPlayer audioPlayer = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var musicService = Provider.of<MusicService>(context, listen: false);
        debugPrint(musicService.selectIndex.toString());
        musicService.updaterIndexMusique(widget.music.id);

        audioPlayer.stop();
        Navigator.pushNamed(
          context,
          MusicScreen.routeName,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            SizedBox(width: 10),
            SizedBox(
              width: 52,
              height: 58,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  widget.music.imgPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.music.titre,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    widget.music.titre,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: kSecondColor),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    widget.isFavourite = !widget.isFavourite;
                  });
                },
                icon: SvgPicture.asset(
                  "asset/images/Heart Icon_2.svg",
                  color: widget.isFavourite ? kPrimaryColor : kSecondColor,
                ))
          ],
        ),
      ),
    );
  }
}
