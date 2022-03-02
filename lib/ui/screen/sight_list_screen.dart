import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
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
          padding: EdgeInsets.only(right: 16, left: 16, top: 42),
          child: Text(
            'Список\nинтересных мест',
            style: AppTypography.largeTitleStyle,
            textAlign: TextAlign.left,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SightCard(model: mocks[0]),
              SightCard(model: mocks[1]),
              SightCard(model: mocks[0]),
              SightCard(model: mocks[1]),
              SightCard(model: mocks[0]),
            ],
          ),
        ),
      ),
    );
  }
}
