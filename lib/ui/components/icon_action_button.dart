import 'package:flutter/material.dart';
import 'package:places/ui/components/icon_svg.dart';

class IconActionButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback? onPressed;

  const IconActionButton({
    Key? key,
    required this.iconPath,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: 32,
      child: TextButton(
        style: TextButton.styleFrom(
          minimumSize: const Size(24, 24),
          padding: EdgeInsets.zero,
          shape: const CircleBorder(),
        ),
        onPressed: onPressed,
        child: IconSvg(
          icon: iconPath,
        ),
      ),
    );
  }
}
