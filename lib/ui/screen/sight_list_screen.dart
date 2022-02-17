import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/styles/color_constants.dart';
import 'package:places/styles/styles.dart';
import 'package:places/ui/screen/sight_card.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 112.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: RichText(
          text: TextSpan(
            style: largeTitleStyle,
            children: [
              TextSpan(
                text: 'С',
                style: TextStyle(color: colorGreen),
              ),
              TextSpan(
                text: 'писок\n',
              ),
              TextSpan(
                text: 'и',
                style: TextStyle(color: colorYellow),
              ),
              TextSpan(
                text: 'нтересных мест',
              ),
            ],
          ),
        ),
      ),
      body: SightCard(),
    );
  }
}
