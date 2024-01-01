import 'package:flutter/material.dart';

import '../../../constante.dart';
import '../../../model/playlist.dart';

class BoxPlaylist extends StatelessWidget {
  const BoxPlaylist({
    super.key,
    required this.playList,
  });

  final PlayList playList;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: 160,
        height: 240,
        child: Column(
          children: [
            SizedBox(
              width: 140,
              height: 140,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  playList.imgPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 3),
            Text(
              playList.titre,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(height: 1),
            Text(
              playList.auteur,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                color: kSecondColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
