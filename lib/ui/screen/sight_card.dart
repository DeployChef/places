import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/styles/color_constants.dart';
import 'package:places/styles/styles.dart';
import 'package:places/utils/helpers.dart';

class SightCard extends StatelessWidget {
  final Sight model;

  const SightCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Padding(
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
                        style: AppTypography.text14BoldStyle,
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
                color: AppColors.cardBackground,
                child: Row(
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: AppTypography.text16Style,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            model.details,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: AppTypography.text14Style,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
