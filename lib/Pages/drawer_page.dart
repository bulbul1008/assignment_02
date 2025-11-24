import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Container(
          child: Column(
            children: [
              Container(
                height: 100,
                color: Colors.green,
              ),
              Container(
                height: 150,
                color: Colors.red,
              ),
            ],
          ),

        ),
    );
  }
}
