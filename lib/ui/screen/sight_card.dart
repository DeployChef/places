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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            CardTop(model: model),
            CardBottom(model: model),
          ],
        ),
      ),
    );
  }
}

class CardBottom extends StatelessWidget {
  const CardBottom({
    Key? key,
    required this.model,
  }) : super(key: key);

  final Sight model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      width: double.infinity,
      color: AppColors.cardBackground,
      child: Padding(
        padding: const EdgeInsets.all(16),
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
    );
  }
}

class CardTop extends StatelessWidget {
  const CardTop({
    Key? key,
    required this.model,
  }) : super(key: key);

  final Sight model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CardImage(
          imageUrl: model.url,
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
    );
  }
}

class CardImage extends StatelessWidget {
  const CardImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      width: double.infinity,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
