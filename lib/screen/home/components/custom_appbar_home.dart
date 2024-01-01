import 'package:flutter/material.dart';

class CustomAppBarHome extends StatelessWidget {
  const CustomAppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 155),
        Expanded(
          child: Text(
            "Music App",
            textScaleFactor: 1.5,
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.logout_sharp),
        )
      ],
    );
  }
}
