import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/domain/sight.dart';
import 'package:places/styles/styles.dart';

class SightCard extends StatelessWidget {
  final Sight model;
  final Color upCardColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  SightCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 96,
                  color: upCardColor,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, top: 16),
                    child: Text(
                      model.type,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(top: 16, right: 16),
                    child: Icon(
                      Icons.favorite_border_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 92,
              width: double.infinity,
              color: Color(0xffF5F5F5),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: text16Style,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      model.details,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: text14Style,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
