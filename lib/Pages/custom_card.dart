import 'package:flutter/material.dart';

enum LeftType { assetImage, avatarIcon, icon, empty }
enum RightType { button, chevron, none }

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;

  final LeftType leftType;
  final String? assetPath; // for LeftType.assetImage
  final IconData? leftIcon; // for LeftType.icon
  final Color leftBgColor; // background of left box

  // Right configuration
  final RightType rightType;
  final String? buttonText;
  final VoidCallback? onButtonPressed;
  final VoidCallback? onTap; // whole card tap

  // Card style
  final Color cardColor;
  final EdgeInsetsGeometry padding;

  const CustomCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.leftType = LeftType.assetImage,
    this.assetPath,
    this.leftIcon,
    this.leftBgColor = const Color(0xFFDCEBFF), // light blue by default
    this.rightType = RightType.none,
    this.buttonText = "Button",
    this.onButtonPressed,
    this.onTap,
    this.cardColor = Colors.white,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        padding: padding,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            // LEFT PART (fixed width)
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: leftBgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: _buildLeftContent(),
              ),
            ),

            const SizedBox(width: 14),

            // MIDDLE PART (title + subtitle)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 14, color: Color(0xFF7E7E7E)),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            // RIGHT PART (button, chevron, none)
            _buildRight(),
          ],
        ),
      ),
    );
  }

  Widget _buildLeftContent() {
    switch (leftType) {
      case LeftType.assetImage:
        if (assetPath != null) {
          return Image.asset(assetPath!, fit: BoxFit.cover);
        } else {
          return const _DefaultImageIcon();
        }
      case LeftType.avatarIcon:
      // round avatar icon inside the left box
        return Container(
          color: Colors.transparent,
          alignment: Alignment.center,
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Color(0xFF5B9BFF)),
          ),
        );
      case LeftType.icon:
        final icon = leftIcon ?? Icons.image;
        return Container(
          color: Colors.transparent,
          alignment: Alignment.center,
          child: Icon(icon, size: 28, color: const Color(0xFF5B9BFF)),
        );
      case LeftType.empty:
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildRight() {
    switch (rightType) {
      case RightType.button:
        return OutlinedButton(
          onPressed: onButtonPressed ?? () {},
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Color(0xFF0A84FF), width: 2),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            backgroundColor: Colors.transparent,
          ),
          child: Text(
            buttonText ?? "Button",
            style: const TextStyle(color: Color(0xFF0A84FF), fontWeight: FontWeight.w600),
          ),
        );

      case RightType.chevron:
        return const Icon(Icons.chevron_right, color: Color(0xFFB0B0B0), size: 28);

      case RightType.none:
      default:
        return const SizedBox.shrink();
    }
  }
}

// small reusable default image icon widget
class _DefaultImageIcon extends StatelessWidget {
  const _DefaultImageIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.all(8),
      child: const Center(
        child: Icon(Icons.image, color: Color(0xFF8FC6FF), size: 30),
      ),
    );
  }
}

/// --------------------
/// Demo page that shows many variants resembling your Figma list
/// Add this page to your app (home: CardsListPage()) to preview.
/// --------------------
class CardsListPage extends StatelessWidget {
  const CardsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // background similar to Figma canvas
    return Scaffold(
      appBar: AppBar(title: const Text('Cards List')),
      backgroundColor: const Color(0xFFF2F2F5),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          // 1: asset image left + button right
          CustomCard(
            title: 'Title',
            subtitle: 'Subtitle',
            leftType: LeftType.assetImage,
            assetPath: 'assets/images/my_photo.jpg', // ensure this exists
            rightType: RightType.button,
            buttonText: 'Button',
            onButtonPressed: () => debugPrint('Button 1 pressed'),
          ),

          // 2: asset image left + chevron right
          CustomCard(
            title: 'Title',
            subtitle: 'Subtitle',
            leftType: LeftType.assetImage,
            assetPath: 'assets/images/my_photo.jpg',
            rightType: RightType.chevron,
            onTap: () => debugPrint('Card tapped'),
          ),

          // 3: asset left + no right
          CustomCard(
            title: 'bangladesh ',
            subtitle: 'Subtitle',
            leftType: LeftType.assetImage,
            assetPath: 'assets/images/my_photo.jpg',
            rightType: RightType.none,
          ),

          // 4: avatar icon left + button
          CustomCard(
            title: 'Title',
            subtitle: 'Subtitle',
            leftType: LeftType.avatarIcon,
            rightType: RightType.button,
            buttonText: 'Button',
          ),

          // 5: avatar left + chevron
          CustomCard(
            title: 'Title',
            subtitle: 'Subtitle',
            leftType: LeftType.avatarIcon,
            rightType: RightType.chevron,
          ),

          // 6: avatar left + none
          CustomCard(
            title: 'Title',
            subtitle: 'Subtitle',
            leftType: LeftType.avatarIcon,
            rightType: RightType.none,
          ),

          // 7: heart icon left + button
          CustomCard(
            title: 'Title',
            subtitle: 'Subtitle',
            leftType: LeftType.icon,
            leftIcon: Icons.favorite,
            leftBgColor: const Color(0xFFFFECF0),
            rightType: RightType.button,
            buttonText: 'Button',
          ),

          // 8: heart left + chevron
          CustomCard(
            title: 'Title',
            subtitle: 'Subtitle',
            leftType: LeftType.icon,
            leftIcon: Icons.favorite,
            leftBgColor: const Color(0xFFFFECF0),
            rightType: RightType.chevron,
          ),

          // 9: icon left + none (example with a dark icon)
          CustomCard(
            title: 'Title',
            subtitle: 'Subtitle',
            leftType: LeftType.icon,
            leftIcon: Icons.thumb_up,
            leftBgColor: const Color(0xFFE8F7FF),
            rightType: RightType.none,
          ),

          // 10: simple text card with button
          CustomCard(
            title: 'Title',
            subtitle: 'Subtitle',
            leftType: LeftType.empty,
            rightType: RightType.button,
            buttonText: 'Button',
          ),

          // 11: another sample with chevron
          CustomCard(
            title: 'Title',
            subtitle: 'Subtitle',
            leftType: LeftType.empty,
            rightType: RightType.chevron,
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
