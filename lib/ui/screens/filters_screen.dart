import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/components/icon_svg.dart';
import 'package:places/ui/screens/res/assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Category {
  String name;
  String iconPath;
  bool isSelected;

  Category({required this.name, required this.iconPath, this.isSelected = false});
}

class CenterPoint {
  final double lat;
  final double lon;
  final String name;

  CenterPoint({required this.lat, required this.lon, required this.name});
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  late List<Category> _categories;

  RangeValues _currentRangeValues = RangeValues(100, 3000);
  int _sightCount = 0;

  /// центральная точка поиска
  /// красная площадь для теста
  final CenterPoint _moscowPoint = CenterPoint(
    lat: 55.753564,
    lon: 37.621085,
    name: 'Москва, Красная площадь',
  );

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final locale = AppLocalizations.of(context)!;

    _categories = [
      Category(name: locale.hotel, iconPath: icHotel),
      Category(name: locale.restaurant, iconPath: icRestaurant),
      Category(name: locale.specialPlace, iconPath: icParticular),
      Category(name: locale.park, iconPath: icPark),
      Category(name: locale.museum, iconPath: icMuseum),
      Category(name: locale.cafe, iconPath: icCafe),
    ];

    return Scaffold(
      appBar: _createSettingsAppbar(theme, locale),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            _buildCategories(theme, locale),
            SizedBox(height: 56),
            _buildRange(locale),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        child: FloatingActionButton.extended(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          onPressed: () {},
          label: Text("${locale.show.toUpperCase()} ($_sightCount)"),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Column _buildRange(AppLocalizations locale) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(locale.distance),
            Text(locale.rangeTitle),
          ],
        ),
        SizedBox(
          height: 24,
        ),
        SizedBox(
          width: double.infinity,
          child: RangeSlider(
            min: 100,
            max: 10000,
            values: _currentRangeValues,
            onChanged: (newValue) {
              setState(() {
                _currentRangeValues = newValue;
                _findSight();
              });
            },
          ),
        ),
      ],
    );
  }

  Column _buildCategories(ThemeData theme, AppLocalizations locale) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(locale.categories),
        SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildCategory(theme, _categories[0]),
            _buildCategory(theme, _categories[1]),
            _buildCategory(theme, _categories[2]),
          ],
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildCategory(theme, _categories[3]),
            _buildCategory(theme, _categories[4]),
            _buildCategory(theme, _categories[5]),
          ],
        ),
      ],
    );
  }

  Container _buildCategory(ThemeData theme, Category category) {
    return Container(
      height: 96,
      width: 92,
      child: Column(
        children: [
          SizedBox(
            height: 64,
            width: 64,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.accentColor.withOpacity(0.16),
                  ),
                  height: double.infinity,
                  width: double.infinity,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        category.isSelected = !category.isSelected;
                        _findSight();
                      });
                    },
                    icon: SvgPicture.asset(
                      category.iconPath,
                      color: theme.accentColor,
                    ),
                    splashColor: theme.accentColor.withOpacity(0.5),
                  ),
                ),
                if (category.isSelected) _showSelected(),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(category.name),
        ],
      ),
    );
  }

  Widget _showSelected() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Stack(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: ShapeDecoration(
              shape: CircleBorder(),
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: SvgPicture.asset(
              icTick,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  bool _arePointsNear(double sightLat, double sightLon, CenterPoint centerPoint, RangeValues distance) {
    const ky = 40000 / 360;
    final kx = cos(pi * centerPoint.lat / 180.0) * ky;
    final dx = (centerPoint.lon - sightLon).abs() * kx;
    final dy = (centerPoint.lat - sightLat).abs() * ky;
    final d = sqrt(dx * dx + dy * dy);
    final minDistance = (distance.start / 1000).round();
    final maxDistance = (distance.end / 1000).round();

    return d >= minDistance && d <= maxDistance;
  }

  void _findSight() {
    var selectedCategoryTypes = _categories.where((element) => element.isSelected).map((e) => e.name.toLowerCase()).toList();

    var count = mocks.where((c) => selectedCategoryTypes.any((element) => element == c.type) && _arePointsNear(c.lat, c.lon, _moscowPoint, _currentRangeValues)).toList().length;

    setState(() {
      _sightCount = count;
    });
  }

  AppBar _createSettingsAppbar(ThemeData theme, AppLocalizations locale) {
    return AppBar(
      leading: Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: IconSvg(
            icon: icArrow,
            color: theme.colorScheme.onPrimary,
          )),
      title: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          child: Text(
            locale.clear,
            style: theme.textTheme.headline5?.copyWith(
              color: theme.accentColor,
            ),
          ),
          onPressed: () {
            setState(() {
              _categories.forEach(
                (element) => element.isSelected = false,
              );
              _currentRangeValues = RangeValues(100, 3000);
              _findSight();
            });
          },
        ),
      ),
    );
  }
}
