import 'package:app_music/screen/home/home_screen.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
            onPressed: () => Navigator.pushNamed(context, HomeScreen.routeName),
            icon: const Icon(
              Icons.keyboard_arrow_down_outlined,
              size: 35,
            )),
        const SizedBox(width: 50),
        const Text(
          "My Playlist",
          textScaleFactor: 1.3,
        ),
        const SizedBox(width: 50),
        IconButton(onPressed: () {}, icon: const Icon(Icons.info))
      ],
    );
  }
}
