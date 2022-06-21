import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:places/domain/sight.dart';
import 'package:places/styles/color_constants.dart';
import 'package:places/styles/styles.dart';
import 'package:places/ui/components/icons_svg.dart';
import 'package:places/ui/screens/res/assets.dart';

class SightDetails extends StatelessWidget {
  final Sight model;

  const SightDetails({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                DetailsImage(
                  url: model.url,
                ),
                DetailsContent(
                  model: model,
                ),
              ],
            ),
          ),
          const BackButton(),
        ],
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 36, left: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 32,
            width: 32,
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Center(
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 15,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailsContent extends StatelessWidget {
  final Sight model;

  const DetailsContent({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.name,
            style: theme.textTheme.headline4,
          ),
          Row(
            children: [
              Text(
                model.type,
                style: theme.textTheme.subtitle1,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                'закрыто до 09:00', // времено
                style: theme.textTheme.bodyText2,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              model.details,
              style: theme.textTheme.bodyText1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: IconFlatButton(
              text: locale.locateButtonText,
              iconPath: icGo,
            ),
          ),
          const Divider(),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                text: locale.calendarButtonText,
                icon: Icons.calendar_today_rounded,
              ),
              IconButton(
                text: locale.favoriteButtonText,
                icon: Icons.favorite_border_rounded,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class IconFlatButton extends StatelessWidget {
  final String text;
  final String iconPath;

  const IconFlatButton({
    Key? key,
    required this.text,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: theme.accentColor,
                ),
              ),
            ),
            SizedBox(
              height: 48,
              child: TextButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconSvg(
                      icon: iconPath,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      text,
                      style: theme.textTheme.button,
                    ),
                  ],
                ),
                onPressed: () {
                  // ignore: avoid_print
                  print('Press ${text}');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconButton extends StatelessWidget {
  final String text;
  final IconData icon;

  const IconButton({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon, //кнопка слева станет неактивной позже, сейчас перекрашивать отдельную кнопку смысла нет
            color: theme.colorScheme.onPrimary,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: theme.textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}

class DetailsImage extends StatelessWidget {
  final String url;

  const DetailsImage({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      width: double.infinity,
      child: Image.network(
        url,
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
