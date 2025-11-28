import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final int maxLines;
  final IconData leftIcon;
  final IconData rightIcon;
  final Color iconColor;

  const MyCustomButton({
    super.key,
    required this.text,
    this.fontSize = 18,
    this.textColor = Colors.blue,
    this.maxLines = 2,
    required this.leftIcon,
    required this.rightIcon,
    this.iconColor = Colors.red,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text("Button Clicked!")),
       );
      },
      child: Container(
       padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
       margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          //color: buttonBackgroundColor,
        ),

        child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(leftIcon, color: iconColor, size: 20),

            const SizedBox(width: 12),

            Expanded(
              child: Text(
                text,
                maxLines: maxLines,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(width: 8),

            Icon(rightIcon, color: iconColor, size: 20),
          ],
        ),
      ),
    );
  }
}
