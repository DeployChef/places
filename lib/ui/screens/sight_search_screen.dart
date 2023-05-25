import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/categories.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/components/bottom_navigaion_bar.dart';
import 'package:places/ui/components/button_text.dart';
import 'package:places/ui/components/empty_page.dart';
import 'package:places/ui/components/search_bar.dart';
import 'package:places/ui/components/search_bar_static.dart';
import 'package:places/ui/screens/res/assets.dart';
import 'package:places/ui/screens/res/sizes.dart';
import 'package:places/ui/screens/sight_details.dart';
import 'package:places/ui/screens/utils/filter_utils.dart';

class SightSearchScreen extends StatefulWidget {
  final FilterSettings? filter;

  const SightSearchScreen({Key? key, this.filter}) : super(key: key);

  @override
  State<SightSearchScreen> createState() => _SightSearchScreenState();
}

class _SightSearchScreenState extends State<SightSearchScreen> {
  /// запишем результаты по отмене фокуса или отправке запроса кнопкой клавиатуры
  /// или если был тап по результату автопоиска по таймеру
  List<String> _dataResults = [];
  String? _lastSearch;

  final TextEditingController _searchController = TextEditingController();
  late StreamController<List<Sight>> _streamController;
  Stream<List<Sight>>? _stream;

  /// для передачи / снятия фокуса по тапам и через клавиатуру
  final _searchFocus = FocusNode();
  FocusNode? _currentFocus;

  /// для показа лоадера
  bool _isBusy = false;

  /// нефильтрованные данные
  final List<Sight> _fullData = mocks;

  /// отфильтрованные результаты
  List<Sight> _filteredData = [];

  @override
  void initState() {
    super.initState();

    _searchController.addListener(() => setState(() {}));
    _streamController = StreamController();
    _stream = _streamController.stream;

    if (widget.filter != null) {
      _filteredData = filterData(data: _fullData, categories: widget.filter!.categories, centerPoint: widget.filter!.centerPoint, distance: widget.filter!.distance);
    }
  }

  /// клик по кнопке клавиатуры - отправить запрос на поиск
  _searchOnEditingComplete() async {
    _search();
    _searchFocus.unfocus();
    _currentFocus = null;

    _writeRequest(
      data: _dataResults,
      controller: _searchController,
    );
  }

  /// клик по полю поиска
  _searchOnTap() {
    FocusScope.of(context).requestFocus(_searchFocus);
    setState(() {
      _currentFocus = _searchFocus;
    });
  }

  void _writeRequest({required List<String> data, required TextEditingController controller}) {
    if (controller.text.isNotEmpty && !data.contains(controller.text)) {
      if (data.length >= 5) {
        for (var i = 0; i < data.length - 1; i++) {
          var buf = data[i + 1];
          data[i] = buf;
        }
        data[data.length - 1] = controller.text.trim();
      } else {
        data.add(controller.text.trim());
      }
    }
  }

  Future<void> _search() async {
    if (_searchController.text == null || _searchController.text.trim().length == 0) {
      _streamController.add([]);

      return;
    }

    /// на время поиска показываем лоадер
    setState(() => _isBusy = true);

    final result = await _searchData(
      data: widget.filter != null ? _filteredData : _fullData,
      query: _searchController.text,
    );

    setState(() => _isBusy = false);

    _streamController.add(result);
    _lastSearch = _searchController.text;
  }

  /// поиск в базе по запросу
  Future<List<Sight>> _searchData({required List<Sight> data, required String query}) async {
    List<Sight> result = [];

    for (var i = 0; i < data.length; i++) {
      if (data[i].name.toLowerCase().contains(query.trim().toLowerCase())) {
        result.add(data[i]);
      }
    }

    /// типа ждём ответ от сервера - временно
    await Future.delayed(Duration(seconds: 2));

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_isBusy) _buildLoaderWaiting(),
          Expanded(
            child: StreamBuilder(
                stream: _stream,
                builder: (BuildContext context, AsyncSnapshot<List<Sight>> snapshot) {
                  if (snapshot.hasError) {
                    //return _buildSearchError();
                  }

                  if (snapshot.hasData && !snapshot.hasError) {
                    if (snapshot.data!.isEmpty) {
                      return _buildSearchResultEmpty();
                    } else {
                      return _buildSearchResult(snapshot.data!);
                    }
                  }

                  return _buildTempStreamBuilderResult();
                }),
          ),
        ],
      ),
      bottomNavigationBar: const MainBottomNavigationBar(currentScreenIndex: 0),
    );
  }

  /// для отображения истории поиска чтобы скрывать историю во время
  /// процесса поиска
  Widget _buildTempStreamBuilderResult() {
    if (_isBusy) {
      return SizedBox(width: 0);
    } else {
      return _buildSearchHistory(_dataResults);
    }
  }

  Widget _buildSearchResultEmpty() {
    return const EmptyPage(
      icon: icEmptySearch,
      header: "Ничего не найдено.",
      text: "Попрпобуйте изменить параметры поиска",
    );
  }

  Widget _buildLoaderWaiting() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: const CircularProgressIndicator(),
          width: 40,
          height: 40,
        ),
      ),
    );
  }

  /// история поисковых запросов
  Widget _buildSearchHistory(List<String> data) {
    if (data.isEmpty) {
      return SizedBox(width: 0);
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ВЫ ИСКАЛИ',
              style: Theme.of(context).textTheme.caption!.copyWith(color: Theme.of(context).colorScheme.background),
            ),
            const SizedBox(height: 4),
            for (int i = 0; i < data.length; i++) ...[
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: Text(
                  data[i],
                  style: Theme.of(context).primaryTextTheme.subtitle1!.copyWith(color: Theme.of(context).colorScheme.background),
                ),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      data.removeAt(i);
                    });
                  },
                  icon: SvgPicture.asset(
                    icClear,
                    color: Theme.of(context).colorScheme.background,
                  ),
                  splashRadius: 24,
                ),
                onTap: () {
                  _searchController.text = data[i];
                  _search();
                },
              ),
              Divider(),
            ],
            ButtonText(
              title: 'Очистить историю',
              onPressed: () {
                setState(() {
                  data.clear();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  /// список найденных результатов
  Widget _buildSearchResult(List<Sight> data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: ListView.separated(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildSearchItem(data[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 1.0,
            indent: 72,
          );
        },
      ),
    );
  }

  /// карточка для результатов поиска
  Widget _buildSearchItem(Sight card) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(radiusCard),
        child: Image(
          width: 56.0,
          height: 56.0,
          image: NetworkImage(card.url),
          fit: BoxFit.cover,
        ),
      ),
      title: RichText(
        text: TextSpan(
          children: _buildRichText(
            string: card.name,
            search: _lastSearch ?? "",
          ),
        ),
      ),
      subtitle: Text(
        card.type,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      onTap: () {
        _writeRequest(
          data: _dataResults,
          controller: _searchController,
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SightDetails(model: card),
          ),
        );
      },
    );
  }

  /// для карточки результатов: выделяем жирным найденный запрос
  List<TextSpan> _buildRichText({required String string, required String search}) {
    List<TextSpan> result = [];
    int findIndex = string.toLowerCase().indexOf(search.toLowerCase());

    // искомое слово В начале
    if (findIndex == 0) {
      result.add(
        TextSpan(
          text: string.substring(0, search.length),
          style: Theme.of(context).textTheme.headline5,
        ),
      );

      result.add(
        TextSpan(
          text: string.substring(search.length),
          style: Theme.of(context).primaryTextTheme.subtitle1,
        ),
      );
    }
    // искомое слово В конце
    else if (string.length == findIndex + search.length) {
      result.add(
        TextSpan(
          text: string.substring(0, findIndex),
          style: Theme.of(context).primaryTextTheme.subtitle1,
        ),
      );

      result.add(
        TextSpan(
          text: string.substring(findIndex),
          style: Theme.of(context).textTheme.headline5,
        ),
      );
    }
    // искомое слово В середине
    else {
      result.add(
        TextSpan(
          text: string.substring(0, findIndex),
          style: Theme.of(context).primaryTextTheme.subtitle1,
        ),
      );

      result.add(
        TextSpan(
            text: string.substring(
              findIndex,
              findIndex + search.length,
            ),
            style: Theme.of(context).textTheme.headline5),
      );

      result.add(
        TextSpan(
          text: string.substring(findIndex + search.length),
          style: Theme.of(context).primaryTextTheme.subtitle1,
        ),
      );
    }

    return result;
  }

  /// appBar
  PreferredSizeWidget _buildAppBar() => PreferredSize(
        preferredSize: Size.fromHeight(132),
        child: AppBar(
          leading: Container(),
          flexibleSpace: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context, widget.filter),
                    child: Text(
                      "Список интересных мест",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  sizedBoxH24,
                  SearchBar(
                    controller: _searchController,
                    focus: _searchFocus,
                    onEditingComplete: _searchOnEditingComplete,
                    onTap: _searchOnTap,
                    data: _dataResults,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
