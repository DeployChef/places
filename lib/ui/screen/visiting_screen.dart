import 'package:flutter/material.dart';
import 'package:places/domain/enums/card_type.dart';
import 'package:places/mocks.dart';
import 'package:places/styles/color_constants.dart';
import 'package:places/styles/styles.dart';
import 'package:places/ui/components/bottom_navigaion_bar.dart';
import 'package:places/ui/screen/sight_card.dart';

class VisitingScreen extends StatelessWidget {
  const VisitingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: Container(
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: AppColors.cardBackground),
              child: Theme(
                data: ThemeData(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: TabBar(
                  labelStyle: AppTypography.text14BoldStyle,
                  labelColor: AppColors.colorWhite,
                  unselectedLabelColor: AppColors.colorWhiteSecondary.withOpacity(0.56),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(borderRadius: BorderRadius.circular(40), color: AppColors.colorWhiteSecondary),
                  indicatorColor: Colors.transparent,
                  indicatorWeight: 0.1,
                  tabs: [
                    Tab(
                      text: "Хочу посетить",
                    ),
                    Tab(
                      text: "Посетил",
                    ),
                  ],
                ),
              ),
            ),
          ),
          title: Align(
            alignment: Alignment.center,
            child: Text(
              "Избранное",
              style: AppTypography.text18Style,
            ),
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: mocks
                      .map((e) => SightCard(
                            model: e,
                            cardType: CardType.favourites,
                          ))
                      .toList(),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: mocks
                      .map((e) => SightCard(
                            model: e,
                            cardType: CardType.favourites,
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: MainBottomNavigationBar(
          currentScreenIndex: 2,
        ),
      ),
    );
  }
}
