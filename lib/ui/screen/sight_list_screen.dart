import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:places/domain/enums/card_type.dart';
import 'package:places/mocks.dart';
import 'package:places/styles/styles.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/screen/sight_card_list.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 112.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Text(
              locale.placesListTitle,
              style: AppTypography.largeTitleStyle,
            ),
          ),
        ),
      ),
      body: SightCardList(sights: mocks, cardType: CardType.favourites),
    );
  }
}
