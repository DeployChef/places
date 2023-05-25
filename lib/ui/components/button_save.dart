import 'package:flutter/material.dart';
import 'package:places/ui/screens/res/sizes.dart';
import 'package:places/ui/screens/res/themes.dart';

/// Кнопка сохранить / создать при добавлении нового места.
class ButtonSave extends StatelessWidget {
  final String title;
  final bool isButtonEnabled;
  final VoidCallback? onPressed;

  const ButtonSave({
    Key? key,
    required this.title,
    required this.isButtonEnabled,
    this.onPressed,
  }) : super(key: key);

  /// Цвет кнопки в зависимоти от её состояния.
  Color _getButtonColor(BuildContext context) {
    return isButtonEnabled ? Theme.of(context).floatingActionButtonTheme.backgroundColor! : Theme.of(context).primaryColorLight;
  }

  /// Цвет названия кнопки в зависимоти от её состояния.
  TextStyle _buildButtonColorTitle(BuildContext context) {
    return isButtonEnabled ? Theme.of(context).textTheme.button! : Theme.of(context).textTheme.button!.copyWith(color: Theme.of(context).colorScheme.inactiveBlack);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: double.infinity,
      child: FloatingActionButton.extended(
        onPressed: onPressed,
        shape: const RoundedRectangleBorder(
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
}
