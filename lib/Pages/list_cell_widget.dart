import 'package:flutter/material.dart';

class ListCellWidget extends StatelessWidget {
  final String userName;
  final String imageUrl;
  const ListCellWidget({
    super.key,
    required this.userName,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(imageUrl),
          ),
          const SizedBox(width: 20),
          Expanded(child: Text(
            userName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),)
        ],
      ),
    );
  }
}
