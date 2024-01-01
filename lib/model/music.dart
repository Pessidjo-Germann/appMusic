class Music {
  late String titre;
  late String auteur;
  late String imgPath;
  late String urlMusic;
  late int id;
  Music(String titre, String auteur, String imgPath, String urlMusic, int id) {
    this.titre = titre;
    this.auteur = auteur;
    this.imgPath = imgPath;
    this.urlMusic = urlMusic;
    this.id = id;
  }
}

List<Music> listMusic = [
  Music(
      "Ansatsu_Kyoushitsu",
      "Assassination_Classroom",
      "asset/images/png-transparent-nagisa-shiota-assassination-classroom-rinka-hayami-anime-manga-assassination-classroom-comics-manga-computer-wallpaper.png",
      'Assassination_Classroom___Ansatsu_Kyoushitsu___暗殺教室_-_Opening_1-A_-_HD_-_Subtitles(128k).mp3',
      0),
  Music("Last_Last", "Burna_Boy", "asset/images/téléchargement (2).png",
      'Burna_Boy_-_Last_Last_[Official_Music_Video](256k).mp3', 1),
  Music("GLORY_DAYS", "Kingdom", "asset/images/images (3).png",
      'Kingdom_Season_2_Opening___GLORY_DAYS(128k).mp3', 2),
  Music(
      "Despacito",
      "Louis Foncis",
      "asset/images/e022214287482557d1532d490ae3903f.1000x1000x1.png",
      "Luis_Fonsi_-_Despacito_ft._Daddy_Yankee(128k).m4a",
      3),
  Music("Opening", "Food Wars", "asset/images/food-wars-1024x576.png",
      "All_Food_Wars!_Openings(128k).mp3", 4),
  Music("L'enfer", "Stromae", "asset/images/stromae.png",
      "Stromae_-_L’enfer_(Official_Music_Video)(128k).mp3", 5),
  Music("Numero 1", "Tenor", "asset/images/tenorrrrrrrr.png",
      "TENOR_ft_HAPPY_-_Numéro_1_(Clip_Officiel)(256k).mp3", 6),
];
