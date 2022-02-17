import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SightCard extends StatelessWidget {
  const SightCard
({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 190,
        margin: const EdgeInsets.symmetric(horizontal: 16),
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
                          margin: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                          child: const Text(
                            'музей',
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
                          margin: const EdgeInsets.fromLTRB(0, 16, 16, 0),
                          child: const Icon(
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
                color: const Color(0xffF5F5F5),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    color: Colors.blue,
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'Воронежский областной краеведческий музей',
                          style: TextStyle(fontSize: 18),
                        ),
                        const Text(
                          'краткое описание',
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
      );
  }
}