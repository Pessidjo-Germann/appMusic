import 'music.dart';

class PlayList {
  final String titre, auteur, imgPath;
  final List<Music> list;

  PlayList(this.list, this.auteur, this.imgPath, this.titre);
}

List<PlayList> listPlaylist = [
  PlayList(listMusic, "Stromae", "asset/images/stromae.png", "L'enfer"),
  PlayList(
      listMusic, "Tenor", "asset/images/tenorrrrrrrr.png", "Sorry For The Rap"),
  PlayList(
      listMusic, "Food Wars", "asset/images/food-wars-1024x576.png", "Opening"),
  PlayList(
      listMusic,
      "Assassination ClassRoom",
      "asset/images/png-transparent-nagisa-shiota-assassination-classroom-rinka-hayami-anime-manga-assassination-classroom-comics-manga-computer-wallpaper.png",
      "Ending"),
  PlayList(listMusic, "Stromae", "asset/images/ppaaaaaaaaaaa.png", "Papaoutai"),
  PlayList(listMusic, "Burna Boy", "asset/images/téléchargement (2).png",
      "LastLast"),
];
