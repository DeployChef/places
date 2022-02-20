import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/helpers.dart';
import 'package:places/styles/color_constants.dart';
import 'package:places/styles/styles.dart';

class SightCard extends StatelessWidget {
  final Sight model;

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
                  color: Helpers.getRandomColor(),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, top: 16),
                    child: Text(
                      model.type,
                      style: text14BoldStyle,
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
              color: cardBackground,
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
