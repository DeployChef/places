import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/styles/color_constants.dart';
import 'package:places/styles/styles.dart';

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
      body: Container(
        height: 190,
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            children: [
              Container(
                height: 96,
                color: Colors.amber,
                child: Positioned.fill(
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(16, 16, 0, 0),
                          child: Text(
                            "музей",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 16, 16, 0),
                          child: Icon(
                            Icons.favorite_border_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 94,
                color: Color(0xffF5F5F5),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    color: Colors.blue,
                    child: Column(
                      children: [
                        Text(
                          "Воронежский областной краеведческий музей",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "краткое описание",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
