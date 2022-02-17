import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/mocks.dart';
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
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Text(
            'Список\nинтересных мест',
            style: largeTitleStyle,
            textAlign: TextAlign.left,
          ),
        ),
      ),
      body: SightCard(model: mocks[1]),
    );
  }
}
