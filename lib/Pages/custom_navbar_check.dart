import 'package:flutter/material.dart';

class CustomCardsDemo extends StatelessWidget {
  const CustomCardsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Horizontal Card")),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            CustomCard(
              title: "Md Shahariar Khaled",
              subtitle: "Software Engineer",
              leftType: LeftWidgetType.assetImage,
              assetPath: "assets/images/my_photo.jpg",
              rightWidget: OutlinedButton(
                onPressed: () {},
                child: const Text("Button"),
              ),
            ),
            const SizedBox(height: 25),

            CustomCard(
              title: "khaled",
              subtitle: "ABS",
              leftType: LeftWidgetType.assetImage,
              assetPath: "assets/images/my_photo.jpg",
              rightWidget: const Icon(Icons.chevron_right),
            ),
            const SizedBox(height: 25),

            CustomCard(
              title: "absc",
              subtitle: "anything",
              leftType: LeftWidgetType.assetImage,
              assetPath: "assets/images/my_photo.jpg",
            ),
            const SizedBox(height: 25),
            const CustomCard(
              title: "Checking title",
              subtitle: "Checking subtitle",
              leftType: LeftWidgetType.empty,
              rightWidget: Icon(Icons.add),
            ),
            const SizedBox(height: 25),

            CustomCard(
              title: "Profile",
              subtitle: "Account settings",
              leftType: LeftWidgetType.icon,
              iconData: Icons.person,
              rightWidget: OutlinedButton(
                onPressed: () {},
                child: const Text("Button"),
              ),
            ),
            const SizedBox(height: 25),

            CustomCard(
              title: "abdur rahim",
              subtitle: "Doctor",
              leftType: LeftWidgetType.icon,
              iconData: Icons.person,
              rightWidget: const Icon(Icons.chevron_right),
            ),
            const SizedBox(height: 25),

            CustomCard(
              title: "Md Shahariar Khaled",
              subtitle: "Engineer",
              leftType: LeftWidgetType.icon,
              iconData: Icons.person,
            ),
          ],
        ),
      ),
    );
  }
}

enum LeftWidgetType { assetImage, icon, empty }

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? rightWidget;
  final LeftWidgetType leftType;
  final String? assetPath;
  final IconData? iconData;

  const CustomCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.rightWidget,
    this.leftType = LeftWidgetType.empty,
    this.assetPath,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: BoxDecoration(
        color: Color(0xffF8F9FE),
        borderRadius: BorderRadius.circular(16),
        //border: Border.all(color: Colors.white),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (leftType != LeftWidgetType.empty)
            Flexible(flex: 1, child: _buildLeftWidget()),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: Color(0xff71727A),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                if (rightWidget != null) rightWidget!,
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to build the left widget
  Widget _buildLeftWidget() {
    switch (leftType) {
      case LeftWidgetType.assetImage:
        return Container(
          width: 80,
          height: 72,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(assetPath!),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              topLeft: Radius.circular(16),
            ),
          ),
          // child: Image.asset(assetPath!, fit: BoxFit.cover),
        );

      case LeftWidgetType.icon:
        return Padding(
          padding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xffB4DBFF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(iconData!, color: Color(0xff6FBAFF), size: 28),
          ),
        );

      case LeftWidgetType.empty:
        return const SizedBox.shrink();
    }
  }
}
