import 'package:flutter/material.dart';
import 'package:places/ui/screens/res/themes.dart';
import 'package:places/ui/screens/res/sizes.dart';

/// кнопка сохранить / создать при добавлении нового места
class ButtonSave extends StatelessWidget {
  final String title;
  final bool isButtonEnabled;
  final VoidCallback? onPressed;

  ButtonSave({
    Key? key,
    required this.title,
    required this.isButtonEnabled,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: double.infinity,
      child: FloatingActionButton.extended(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radiusButton),
          ),
        ),
        label: Text(
          title,
          style: _buildButtonColorTitle(context),
        ),
        backgroundColor: _getButtonColor(context),
      ),
    );
  }

  /// цвет кнопки в зависимоти от её состояния
  Color _getButtonColor(BuildContext context) {
    if (isButtonEnabled) {
      return Theme.of(context).floatingActionButtonTheme.backgroundColor!;
    } else {
      return Theme.of(context).primaryColorLight;
    }
  }

  /// цвет названия кнопки в зависимоти от её состояния
  TextStyle _buildButtonColorTitle(BuildContext context) {
    if (isButtonEnabled) {
      return Theme.of(context).textTheme.button!;
    } else {
      return Theme.of(context).textTheme.button!.copyWith(
            color: Theme.of(context).colorScheme.inactiveBlack,
          );
    }
  }
}
