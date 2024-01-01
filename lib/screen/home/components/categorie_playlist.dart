import 'package:flutter/material.dart';

import '../../../constante.dart';

class CategoriesPlaylist extends StatefulWidget {
  CategoriesPlaylist({
    super.key,
    required this.name,
    this.isSelected = false,
  });
  final String name;
  final bool isSelected;

  @override
  State<CategoriesPlaylist> createState() => _CategoriesPlaylistState();
}

class _CategoriesPlaylistState extends State<CategoriesPlaylist> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        padding: EdgeInsets.only(top: 5),
        width: 60,
        height: 26,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? kPrimaryColor : kSecondColor,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          widget.name,
          style: TextStyle(
            color: isSelected ? kPrimaryColor : kSecondColor,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
