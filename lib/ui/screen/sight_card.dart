import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/domain/sight.dart';

class SightCard extends StatelessWidget {
  final Sight model;
  final Color upCardColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  
  SightCard({Key? key, required this.model}) : super(key: key);

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
                color: upCardColor,
                child: Positioned.fill(
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                          child: Text(
                            model.type,
                            style: const TextStyle(
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
                        Text(
                          model.name,
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          model.details,
                          textAlign: TextAlign.left,
                          style: const TextStyle(fontSize: 14),
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