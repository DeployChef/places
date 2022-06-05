import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:places/domain/enums/card_type.dart';
import 'package:places/mocks.dart';
import 'package:places/styles/color_constants.dart';
import 'package:places/styles/styles.dart';
import 'package:places/ui/components/bottom_navigaion_bar.dart';
import 'package:places/ui/screens/sight_card_list.dart';

class VisitingScreen extends StatelessWidget {
  const VisitingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Container(
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Theme.of(context).primaryColorDark,
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: TabBar(
                  tabs: [
                    Tab(
                      text: locale.notVisitedTab,
                    ),
                    Tab(
                      text: locale.visitedTab,
                    ),
                  ],
                ),
              ),
            ),
          ),
          title: Align(
            child: Text(
              locale.favoriteText,
              style: AppTypography.textButton,
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            SightCardsTab(visited: false),
            SightCardsTab(visited: true),
          ],
        ),
        bottomNavigationBar: const MainBottomNavigationBar(
          currentScreenIndex: 2,
        ),
      ),
    );
  }
}

class SightCardsTab extends StatelessWidget {
  final bool visited;

  const SightCardsTab({
    Key? key,
    required this.visited,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final items = mocks.where((element) => element.visited == visited).toList();

    return Container(
      child: items.isEmpty
          ? !visited
              ? Blank(
                  icon: Icons.photo_camera_back,
                  header: locale.blankHeader,
                  text: locale.blankTextNotVisited,
                )
              : Blank(
                  icon: Icons.location_off_rounded,
                  header: locale.blankHeader,
                  text: locale.blankTextVisited,
                )
          : SightCardList(
              sights: items,
              cardType: CardType.favourites,
            ),
    );
  }
}

class Blank extends StatelessWidget {
  final IconData icon;
  final String header;
  final String text;

  const Blank({
    Key? key,
    required this.icon,
    required this.header,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 80,
            color: AppColors.colorSecondary2,
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            header,
            textAlign: TextAlign.center,
            style: AppTypography.textButton
                .copyWith(color: AppColors.colorSecondary2),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: AppTypography.textSmall14,
          ),
        ],
      ),
    );
  }
}
