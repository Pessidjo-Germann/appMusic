import 'dart:async';

import 'package:app_music/model/music_service.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:provider/provider.dart';
import '../../../components/custom_app_bar.dart';
import '../../../constante.dart';
import '../../../model/enum.dart';
import '../../../model/music.dart';

class Body extends StatefulWidget {
  Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late AudioPlayer audioPlayer = AudioPlayer(); //variable de l'audioPlayer
  static AudioCache instance = AudioCache();
  late Music actualMusic; //music actuel
  Duration positionActualMusic = const Duration(seconds: 0);
  Duration dureeActualMusic = const Duration(seconds: 30);
  late Duration restantDureeActualMusic;
  PlayerState statutActualMusic = PlayerState.stopped;
  int index = 0; //index de la music
  bool mute = false;
  late StreamSubscription positionSubscription;
  late StreamSubscription stateSubscription;
  late StreamSubscription durationSubsciption;
  var musicModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    actualMusic = listMusic[index];
    configAudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    audioPlayer.stop();

    musicModel = Provider.of<MusicService>(context);
    setState(() {
      index = musicModel.selectIndex;
      actualMusic = listMusic[index];
    });

    //index = musicModel.selectIndex;

    //Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(height: 38),
        const CustomAppBar(),
        const SizedBox(height: 140),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${index + 1} sur ${listMusic.length}",
              style: TextStyle(color: kSecondColor),
            ),
            const SizedBox(height: 20),
            Container(
              width: 199,
              height: 179,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  actualMusic.imgPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              actualMusic.titre,
              textScaleFactor: 3,
            ),
            const SizedBox(height: 10),
            Text(
              actualMusic.auteur,
              style: TextStyle(color: kSecondColor),
              textScaleFactor: 1.4,
            ),
            const SizedBox(height: 23),
            Column(
              children: [
                Slider(
                    value: positionActualMusic.inSeconds.toDouble(),
                    min: 0.0,
                    max: dureeActualMusic.inSeconds.toDouble(),
                    inactiveColor: kSecondColor,
                    activeColor: kPrimaryColor,
                    onChanged: (d) {
                      setState(() {
                        audioPlayer.seek(Duration(seconds: d.toInt()));
                      });
                    }),
                const SizedBox(height: 14),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 23),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(fromDuration(positionActualMusic)),
                      Text("-${fromDuration(restantDureeActualMusic)}"),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 55),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 54.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 22.0, right: 7),
                    child: Icon(
                      Icons.radio_button_on_outlined,
                    ),
                  ),
                  previousButton(),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0, left: 18),
                    child: playButton(),
                  ),
                  Row(
                    children: [
                      nextMusic(),
                      Padding(
                        padding: const EdgeInsets.only(top: 22, left: 16),
                        child: IconButton(
                            onPressed: muted,
                            icon: mute
                                ? const Icon(Icons.headset_off)
                                : const Icon(Icons.headset)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> stop() async {
    await audioPlayer.stop();
  }

  IconButton playButton() {
    return IconButton(
      iconSize: 70,
      onPressed: (statutActualMusic != PlayerState.playing) ? play : pause,
      icon: Container(
        width: 53,
        height: 53,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(46),
        ),
        child: (statutActualMusic != PlayerState.playing)
            ? const Icon(
                Icons.play_arrow,
                size: 45,
                color: Colors.black,
              )
            : const Icon(
                Icons.pause,
                size: 45,
                color: Colors.black,
              ),
      ),
    );
  }

  IconButton previousButton() {
    return IconButton(
        onPressed: reward,
        icon: const Icon(
          Icons.skip_previous_rounded,
          size: 50,
        ));
  }

  IconButton nextMusic() {
    return IconButton(
        onPressed: forward,
        icon: const Icon(
          Icons.skip_next_rounded,
          size: 50,
        ));
  }

  void configAudioPlayer() {
    audioPlayer = AudioPlayer();
    restantDureeActualMusic = dureeActualMusic - positionActualMusic;
    //Premierement on va ecouter la position a chaque fois quil y aura changement de posistion
    positionSubscription = audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        positionActualMusic = position;
        restantDureeActualMusic = dureeActualMusic - positionActualMusic;
      });
      if (positionActualMusic >= dureeActualMusic) {
        //[pas sure que le setstate soit necessaires]
        setState(() {
          positionActualMusic = const Duration(seconds: 0);
          //passer a la musique suivante
        });
        forward();
      }
    });
    durationSubsciption = audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        dureeActualMusic = event;
      });
    });
    //ensuite on va regarder l'etat de la  msique en cours
    stateSubscription = audioPlayer.onPlayerStateChanged.listen((state) {
      /*
       // A TRAVAILLER DESSUS URGEMENT
      */

      if (state == PlayerState.playing) {
        //-----------------//
      } else if (state == PlayerState.stopped) {
        setState(() {
          statutActualMusic = PlayerState.stopped;
        });
      }
    }, onError: (message) {
      debugPrint(message);
      setState(() {
        statutActualMusic = PlayerState.stopped;
        dureeActualMusic = const Duration(seconds: 0);
        positionActualMusic = const Duration(seconds: 0);
      });
    });
  }

  ///
  Future<void> play() async {
    instance.load(actualMusic.urlMusic);
    await audioPlayer.play(AssetSource(actualMusic.urlMusic));

    setState(() {
      statutActualMusic = PlayerState.playing;
    });
  }

  Future<void> pause() async {
    await audioPlayer.pause();
    setState(() {
      statutActualMusic = PlayerState.paused;
    });
  }

  Future<void> muted() async {
    mute ? await audioPlayer.setVolume(1) : await audioPlayer.setVolume(0.0);
    setState(() {
      mute = !mute;
    });
  }

  IconButton bouton(IconData data, double taille, ActionMusic action) {
    return IconButton(
        onPressed: () {
          switch (action) {
            case ActionMusic.play:
              play();
              break;
            case ActionMusic.pause:
              pause();
              break;
            case ActionMusic.forward:
              forward();
              break;
            case ActionMusic.rewind:
              reward();
              break;
            default:
              break;
          }
        },
        iconSize: taille,
        icon: Icon(data));
  }

  void forward() {
    debugPrint(index.toString());
    var musicService = Provider.of<MusicService>(context, listen: false);

    if (index == listMusic.length - 1) {
      index = 0;
      musicService.updaterIndexMusique(index);
    } else {
      index++;
      musicService.updaterIndexMusique(index);
      debugPrint(index.toString());
    }

    actualMusic = listMusic[index];
    audioPlayer.stop();
    configAudioPlayer();
    play();
  }

  void reward() {
    var musicService = Provider.of<MusicService>(context, listen: false);

    if (positionActualMusic > const Duration(seconds: 3)) {
      audioPlayer.seek(const Duration(seconds: 0));
    } else {
      if (index == 0) {
        index = listMusic.length - 1;
        musicService.updaterIndexMusique(index);
      } else {
        index--;
        musicService.updaterIndexMusique(index);
      }
    }
    actualMusic = listMusic[index];
    audioPlayer.stop();
    configAudioPlayer();
    play();
  }
}

String fromDuration(Duration duree) {
  return duree.toString().split('.').first;
}

int durationToInt(String duree) {
  return int.parse(duree);
}
