import 'package:flutter/material.dart';
import 'package:places/ui/components/icons_svg.dart';

class IconColoredButton extends StatelessWidget {
  final String text;
  final String iconPath;
  final VoidCallback? onPressed;

  const IconColoredButton({
    Key? key,
    required this.text,
    required this.iconPath,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: theme.accentColor,
              ),
            ),
          ),
          SizedBox(
            height: 48,
            child: TextButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconSvg(
                    icon: iconPath,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    text,
                    style: theme.textTheme.button,
                  ),
                ],
              ),
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
