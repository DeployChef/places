import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:places/domain/enums/card_type.dart';
import 'package:places/domain/sight.dart';
import 'package:places/styles/color_constants.dart';
import 'package:places/styles/styles.dart';

class SightCard extends StatelessWidget {
  final Sight model;
  final CardType cardType;

  const SightCard({Key? key, required this.model, required this.cardType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: Theme.of(context).primaryColorLight,
        child: Column(
          children: [
            CardTop(
              model: model,
              cardType: cardType,
            ),
            CardBottom(
              model: model,
              cardType: cardType,
            ),
          ],
        ),
      ),
    );
  }
}

class CardTop extends StatelessWidget {
  final Sight model;
  final CardType cardType;

  const CardTop({
    Key? key,
    required this.model,
    required this.cardType,
  }) : super(key: key);

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
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
        ),
        Positioned(
          top: 16,
          left: 16,
          right: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CardActions(
                cardType: cardType,
                visited: model.visited,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CardActions extends StatelessWidget {
  final CardType cardType;
  final bool visited;

  static const _search = <Widget>[
    Icon(
      Icons.favorite_border,
      color: Colors.white,
      size: 24,
    ),
  ];

  static const _planned = <Widget>[
    Icon(
      Icons.calendar_today,
      color: Colors.white,
      size: 24,
    ),
    SizedBox(width: 16),
    Icon(
      Icons.close,
      color: Colors.white,
      size: 24,
    ),
  ];

  static const _visited = <Widget>[
    Icon(
      Icons.share,
      color: Colors.white,
      size: 24,
    ),
    SizedBox(width: 16),
    Icon(
      Icons.close,
      color: Colors.white,
      size: 24,
    ),
  ];

  const CardActions({Key? key, required this.cardType, required this.visited}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (cardType == CardType.search) ..._search,
        if (cardType == CardType.favourites) ...{
          if (visited) ..._visited else ..._planned,
        },
      ],
    );
  }
}

class CardImage extends StatelessWidget {
  final String imageUrl;

  const CardImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      width: double.infinity,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
            ),
          );
        },
      ),
    );
  }
}

class CardBottom extends StatelessWidget {
  final Sight model;
  final CardType cardType;

  const CardBottom({
    Key? key,
    required this.model,
    required this.cardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: theme.textTheme.headline5,
          ),
          const SizedBox(
            height: 2,
            width: double.infinity,
          ),
          if (cardType == CardType.search) ...[
            Text(
              model.details,
              style: theme.textTheme.bodyText2,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
          if (cardType == CardType.favourites) ...{
            if (model.visited) ...[
              Text(
                '${locale.visitedText} ${model.visitingDate}',
                style: theme.textTheme.bodyText2,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ] else ...[
              Text(
                '${locale.wantVisitText} ${model.visitingDate}',
                style: theme.primaryTextTheme.bodyText1,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
            ...[
              const SizedBox(
                height: 12,
              ),
              Text(
                '${locale.closedText} 09:00', // временно
                style: theme.textTheme.bodyText2,
              ),
            ],
          },
        ],
      ),
    );
  }
}
