import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:places/domain/enums/card_type.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/styles/styles.dart';
import 'package:places/ui/components/bottom_navigaion_bar.dart';
import 'package:places/ui/components/icon_svg.dart';
import 'package:places/ui/components/search_bar_static.dart';
import 'package:places/ui/screens/add_sight_screen.dart';
import 'package:places/ui/screens/filters_screen.dart';
import 'package:places/ui/screens/res/assets.dart';
import 'package:places/ui/screens/res/sizes.dart';
import 'package:places/ui/screens/sight_card.dart';
import 'package:places/ui/screens/sight_card_list.dart';
import 'package:places/ui/screens/sight_search_screen.dart';
import 'package:places/ui/screens/utils/filter_utils.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  /// нефильтрованные данные если юзер не настраивал фильтр
  final List<Sight> _fullData = mocks;

  /// текущие настройки фильтра, получаем их из экрана фильтрации
  FilterSettings? _currentFilter = null;

  /// отфильтрованные данные
  List<Sight> _filteredData = [];

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: _buildAppBar(locale, theme),
      body: SightCardList(
        sights: _filteredData.isNotEmpty ? _filteredData : _fullData,
        cardType: CardType.search,
      ),
      floatingActionButton: _buildAddNewCard(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: const MainBottomNavigationBar(
        currentScreenIndex: 0,
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(AppLocalizations locale, ThemeData theme) {
    return PreferredSize(
      preferredSize: Size.fromHeight(212),
      child: AppBar(
        flexibleSpace: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  locale.placesListTitle,
                  style: theme.textTheme.headline3,
                ),
                sizedBoxH24,
                SearchBarStatic(
                  onTapSearch: _onTapSearch,
                  onPressedFilter: _onPressedFilter,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// передаем фильтр на экран поиска
  void _onTapSearch() async {
    final FilterSettings? _filter = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SightSearchScreen(filter: _currentFilter),
      ),
    );
    setState(() {
      _currentFilter = _filter;
      _filteredData = filterData(
        data: _fullData,
        categories: _currentFilter!.categories,
        centerPoint: _currentFilter!.centerPoint,
        distance: _currentFilter!.distance,
      );
    });
  }

  /// переход на экран фильтра
  /// настройки фильтра возвращаем сюда и фильтруем данные
  void _onPressedFilter() async {
    final FilterSettings? _filter = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FiltersScreen(filter: _currentFilter),
      ),
    );
    setState(() {
      _currentFilter = _filter;
      if (_currentFilter == null)
        _filteredData = _fullData;
      else
        _filteredData = filterData(data: _fullData, categories: _currentFilter!.categories, centerPoint: _currentFilter!.centerPoint, distance: _currentFilter!.distance);
    });
  }

  /// кнопка добавить новое место
  Widget _buildAddNewCard() => ElevatedButton(
        onPressed: () async {
          var result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddSightScreen(),
            ),
          );
          setState(() {});
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusButtonAddNewCard),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Colors.yellow, //Theme.of(context).colorScheme.yellow,
                Colors.green, //Theme.of(context).colorScheme.green,
              ],
            ),
            borderRadius: BorderRadius.circular(radiusButtonAddNewCard),
          ),
          child: Container(
            width: widthButtonAddNewCard,
            height: heightBigButton,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconSvg(icon: icPlus),
                sizedBoxW8,
                Text(
                  "Новое место".toUpperCase(),
                  style: Theme.of(context).textTheme.button,
                ),
              ],
            ),
          ),
        ),
      );
}
