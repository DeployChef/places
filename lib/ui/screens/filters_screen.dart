import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/domain/categories.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/components/button_save.dart';
import 'package:places/ui/components/small_leading_icon.dart';
import 'package:places/ui/components/icon_svg.dart';
import 'package:places/ui/screens/res/assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:places/ui/screens/utils/filter_utils.dart';

class FiltersScreen extends StatefulWidget {
  final FilterSettings? filter;

  const FiltersScreen({Key? key, this.filter}) : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  late AppLocalizations _locale;
  List<Categories> _categories = categories.toList();

  /// нефильтрованные данные если юзер не настраивал фильтр
  final List<Sight> _fullData = mocks;

  /// отфильтрованные данные
  List<Sight> _filteredData = [];

  /// только выбранные категории для функции поиска и передачи на другой экран
  List<Categories> _filteredCategories = [];

  /// стартовые данные для слайдера в метрах
  RangeValues _startDataSlider() => RangeValues(100, 3000);

  VoidCallback? _acceptFilter;
  bool _isButtonEnabled = false;

  RangeValues _currentRangeValues = RangeValues(100, 3000);

  /// центральная точка поиска
  /// красная площадь для теста
  final CenterPoint _startSearchPoint = CenterPoint(
    lat: 55.753564,
    lon: 37.621085,
    name: 'Москва, Красная площадь',
  );

  @override
  void initState() {
    if (widget.filter != null) {
      _filteredCategories = widget.filter!.categories;
      _currentRangeValues = widget.filter!.distance;
      _startCategories(widget.filter!.categories);
      _filteredData = filterData(
        data: _fullData,
        categories: _filteredCategories,
        centerPoint: _startSearchPoint,
        distance: _currentRangeValues,
      );
    } else {
      _currentRangeValues = _startDataSlider();
    }
    super.initState();
  }

  void _startCategories(List<Categories> selectedCategories) {
    selectedCategories.forEach((element) => _categories.where((c) => c.name == element.name).forEach((fi) {
          fi.isSelected = true;
        }));
  }

  @override
  Widget build(BuildContext context) {
    if (_filteredData.isNotEmpty) {
      _isButtonEnabled = true;

      _acceptFilter = () {
        final _filterSettings = FilterSettings(
          categories: _filteredCategories,
          distance: _currentRangeValues,
          centerPoint: _startSearchPoint,
        );

        Navigator.pop(context, _filterSettings);
      };
    } else {
      _isButtonEnabled = false;
      _acceptFilter = null;
    }

    var theme = Theme.of(context);
    _locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: _createSettingsAppbar(theme),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            _buildCategories(theme),
            SizedBox(height: 56),
            _buildRange(theme),
          ],
        ),
      ),
      floatingActionButton: ButtonSave(
        title: "${_locale.show.toUpperCase()} (${_filteredData.length})",
        isButtonEnabled: _isButtonEnabled,
        onPressed: _acceptFilter,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Column _buildRange(ThemeData theme) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _locale.distance,
              style: theme.primaryTextTheme.subtitle1,
            ),
            Text(
              _locale.rangeTitle,
              style: theme.primaryTextTheme.subtitle1,
            ),
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
                _filteredData = filterData(
                  data: _fullData, // база карточек
                  categories: _filteredCategories, // выбранные категории
                  centerPoint: _startSearchPoint, // точка отсчёта расстояния
                  distance: _currentRangeValues,
                );
              });
            },
          ),
        ),
      ],
    );
  }

  Column _buildCategories(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _locale.categories,
        ),
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

  Container _buildCategory(ThemeData theme, Categories category) {
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
                        _filteredCategories = _filterCategories();
                        _filteredData = filterData(
                          data: _fullData,
                          categories: _filteredCategories,
                          centerPoint: _startSearchPoint,
                          distance: _currentRangeValues,
                        );
                      });
                    },
                    icon: SvgPicture.asset(
                      category.iconPath,
                      color: theme.accentColor,
                    ),
                    splashColor: theme.accentColor.withOpacity(0.5),
                  ),
                ),
                if (category.isSelected) _showSelected(theme),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            category.name,
            style: theme.textTheme.caption,
          ),
        ],
      ),
    );
  }

  Widget _showSelected(ThemeData theme) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: 16,
        height: 16,
        decoration: ShapeDecoration(
          shape: CircleBorder(),
          color: theme.colorScheme.primary,
        ),
        child: SvgPicture.asset(
          icTick,
          color: theme.primaryColor,
        ),
      ),
    );
  }

  /// оставляем только выбранные категории и передаем их в поиск
  List<Categories> _filterCategories() {
    return _categories.where((c) => c.isSelected).toList();
  }

  /// очистка выбранных категорий
  void _clearCategories() {
    _categories.forEach((c) => c.isSelected = false);
  }

  AppBar _createSettingsAppbar(ThemeData theme) {
    return AppBar(
      leading: SmallLeadingIcon(
        icon: icArrow,
        onPressed: () {
          Navigator.pop(context, widget.filter);
        },
      ),
      title: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          child: Text(
            _locale.clear,
            style: theme.textTheme.headline5?.copyWith(
              color: theme.accentColor,
            ),
          ),
          onPressed: () {
            setState(() {
              _clearCategories();
              _currentRangeValues = _startDataSlider();
              _filteredData.clear();
            });
          },
        ),
      ),
    );
  }
}
