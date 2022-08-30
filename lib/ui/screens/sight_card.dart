import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:places/domain/enums/card_type.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/components/icon_action_button.dart';
import 'package:places/ui/screens/res/assets.dart';

class SightCard extends StatelessWidget {
  final Sight model;
  final CardType cardType;
  double get _radiusCard => 10;

  const SightCard({Key? key, required this.model, required this.cardType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(_radiusCard),
      child: Material(
        borderRadius: BorderRadius.circular(_radiusCard),
        clipBehavior: Clip.antiAlias,
        color: Theme.of(context).primaryColorLight,
        child: Container(
          color: theme.primaryColorLight,
          child: Stack(
            children: [
              Column(
                children: [
                  CardTop(
                    model: model,
                    theme: theme,
                  ),
                  CardBottom(
                    model: model,
                    cardType: cardType,
                  ),
                ],
              ),
              Positioned.fill(
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {
                      // ignore: avoid_print
                      print("card tap");
                    },
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 16,
                child: CardActions(
                  cardType: cardType,
                  visited: model.visited,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardTop extends StatelessWidget {
  final Sight model;
  final ThemeData theme;

  const CardTop({Key? key, required this.model, required this.theme}) : super(key: key);

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
              style: theme.textTheme.subtitle2,
            ),
          ),
        ),
      ],
    );
  }
}

class CardActions extends StatelessWidget {
  final CardType cardType;
  final bool visited;

  static final _search = <Widget>[
    IconActionButton(
      iconPath: icFavorites,
      onPressed: () {
        // ignore: avoid_print
        print('Press heart');
      },
    ),
  ];

  static final _planned = <Widget>[
    IconActionButton(
      iconPath: icCalendar,
      onPressed: () {
        // ignore: avoid_print
        print('Press calendar');
      },
    ),
    SizedBox(width: 16),
    IconActionButton(
      iconPath: icDelete,
      onPressed: () {
        // ignore: avoid_print
        print('Press delete');
      },
    ),
  ];

  static final _visited = <Widget>[
    IconActionButton(
      iconPath: icShare,
      onPressed: () {
        // ignore: avoid_print
        print('Press share');
      },
    ),
    SizedBox(width: 16),
    IconActionButton(
      iconPath: icDelete,
      onPressed: () {
        // ignore: avoid_print
        print('Press delete');
      },
    ),
  ];

  const CardActions({Key? key, required this.cardType, required this.visited}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
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
