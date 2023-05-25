import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SmallLeadingIcon extends StatelessWidget {
  final String icon;
  final VoidCallback? onPressed;

  const SmallLeadingIcon({
    Key? key,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        icon,
        color: Theme.of(context).colorScheme.onPrimary,
        width: 24,
        height: 24,
      ),
      onPressed: onPressed,
    );
  }
}
