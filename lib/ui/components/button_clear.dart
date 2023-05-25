import 'package:flutter/material.dart';

class ButtonClear extends StatelessWidget {
  final TextEditingController controller;

  const ButtonClear({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 20,
        width: 20,
        child: TextButton(
          style: TextButton.styleFrom(
            minimumSize: const Size(20, 20),
            backgroundColor: Theme.of(context).colorScheme.primary,
            padding: EdgeInsets.zero,
            shape: const CircleBorder(),
          ),
          onPressed: controller.clear,
          child: const Icon(
            Icons.close,
            size: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
