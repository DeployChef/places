import 'package:flutter/material.dart';
import 'package:places/ui/screens/res/sizes.dart';

/**
 * текстовая кнопка сливающаяся с фоном
 * на экране добавления нового места - Указать на карте
 */
class ButtonText extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const ButtonText({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightBigButton,
      child: TextButton(
        onPressed: onPressed,
        child: SizedBox(
          width: double.infinity,
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline5!.copyWith(color: Theme.of(context).accentColor),
          ),
        ),
      ),
    );
  }
}
