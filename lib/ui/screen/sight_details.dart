import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:places/domain/sight.dart';
import 'package:places/styles/color_constants.dart';
import 'package:places/styles/styles.dart';

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
            color: Colors.white,
            child: const Center(
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 15,
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.name,
            style: AppTypography.text24Style,
          ),
          Row(
            children: [
              Text(
                model.type,
                style: AppTypography.text14BoldStyle,
              ),
              const SizedBox(
                width: 16,
              ),
              const Text(
                'закрыто до 09:00',
                style: AppTypography.text14BoldSecondary2Style,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              model.details,
              style: AppTypography.text14Style,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 48,
                width: double.infinity,
                color: const Color(0xff4CAF50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_pin,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      locale.locateButtonText.toUpperCase(),
                      style: AppTypography.textWightButton14Style,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      color: AppColors.colorDisable,
                      size: 24,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      locale.calendarButtonText,
                      style: AppTypography.text14InactiveStyle,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 38,
              ),
              Expanded(
                child: Row(
                  children: [
                    const Icon(
                      Icons.favorite_border_rounded,
                      size: 24,
                      color: AppColors.colorWhiteSecondary,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      locale.favoriteButtonText,
                      style: AppTypography.text14Style,
                    ),
                  ],
                ),
              ),
            ],
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
