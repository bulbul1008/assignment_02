import 'package:assignment_02/Pages/custom_button_widget.dart';
import 'package:assignment_02/Pages/list_cell_widget.dart';
import 'package:assignment_02/Pages/grid_user_cell.dart';
import 'package:flutter/material.dart';

class ButtonPageCheck extends StatelessWidget {
  const ButtonPageCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Button Widget"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          MyCustomButton(
            text: "Next Page ",
            fontSize: 20,
            textColor: Colors.white,
            leftIcon: Icons.menu,
            rightIcon: Icons.arrow_forward,
            iconColor: Colors.white,
          ),

          const SizedBox(height: 20),

          ListCellWidget(
            userName: "Khaled Shahariar",
            imageUrl: "assets/images/my_photo.jpg",
          ),

          ListCellWidget(
            userName: "Tushar Imran Mashrafi",
            imageUrl: "assets/images/mashrafi.png",
          ),
          ListCellWidget(
            userName: "Md. Al-Amin",
            imageUrl: "assets/images/alamin_bhai.png",
          ),
          ListCellWidget(
            userName: "Md. Mustafizur Rahman",
            imageUrl: "assets/images/mustafiz_bhai.png",
          ),
          ListCellWidget(
            userName: "Nowrose Muhammad Ragib",
            imageUrl: "assets/images/Ragib_bhai.png",
          ),
          ListCellWidget(
            userName: "Sayed",
            imageUrl: "assets/images/sayed_bhai.png",
          ),
          ListCellWidget(
            userName: "Shadman Sakib",
            imageUrl: "assets/images/sakib_bhai.png",
          ),
          ListCellWidget(
            userName: "Sheikh Tasnimul Hasan",
            imageUrl: "assets/images/tahsin_bhai.png",
          ),
          ListCellWidget(
            userName: "Arafat Rohan",
            imageUrl: "assets/images/rohan_bhai.png",
          ),
          ListCellWidget(
            userName: "Tushar Imran Mashrafi",
            imageUrl: "assets/images/mashrafi.png",
          ),

          const SizedBox(height: 20),
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            shrinkWrap: true,
            //physics: const NeverScrollableScrollPhysics(),
            children:  [
              GridUserCell(imageUrl: "assets/images/my_photo.jpg"),
              GridUserCell(imageUrl: "assets/images/mashrafi.png"),
              GridUserCell(imageUrl: "assets/images/mustafiz_bhai.png"),
              GridUserCell(imageUrl: "assets/images/rohan_bhai.png"),
              GridUserCell(imageUrl: "assets/images/sakib_bhai.png"),
              GridUserCell(imageUrl: "assets/images/sayed_bhai.png"),
              GridUserCell(imageUrl: "assets/images/tahsin_bhai.png"),
              GridUserCell(imageUrl: "assets/images/alamin_bhai.png"),
            ],
          ),
        ],
      ),
    );
  }
}
