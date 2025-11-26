import 'package:flutter/material.dart';

class GridUserCell extends StatelessWidget {
  final String imageUrl;

  const GridUserCell({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
     // width: 500,
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: CircleAvatar(

        backgroundImage: AssetImage(imageUrl),

      ),

    );
  }
}
