import 'package:flutter/material.dart';
import 'package:places/domain/categories.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/components/button_save.dart';
import 'package:places/ui/components/icon_leading_appbar.dart';
import 'package:places/ui/components/icon_svg.dart';
import 'package:places/ui/screens/res/assets.dart';
import 'package:places/ui/screens/res/sizes.dart';

class SelectCategoryScreen extends StatefulWidget {
  final String? selectedCategory;

  SelectCategoryScreen({Key? key, this.selectedCategory}) : super(key: key);

  @override
  State<SelectCategoryScreen> createState() => _SelectCategoryScreenState();
}

class _SelectCategoryScreenState extends State<SelectCategoryScreen> {
  /// кнопка сохранения при старте отключена
  bool _isButtonEnabled = false;
  VoidCallback? _onPressed;

  /// категории
  List<Categories> _categories = categories;

  /// название выбранной категории
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    if (widget.selectedCategory != null && _selectedCategory == null) {
      _isButtonEnabled = true;
      _selectedCategory = widget.selectedCategory;
    }

    if (_isButtonEnabled) {
      /// сохраняем выбранную категорию и передаём ее на предыдущий экран
      _onPressed = () {
        Navigator.pop(context, _selectedCategory);
      };
    }

    return Scaffold(
      appBar: _buildSelectCategoryAppBar(),
      body: _buildCategories(),
      floatingActionButton: ButtonSave(
        title: "СОХРАНИТЬ",
        isButtonEnabled: _isButtonEnabled,
        onPressed: _onPressed,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
    );
  }

  /// AppBar
  PreferredSizeWidget _buildSelectCategoryAppBar() => AppBar(
        toolbarHeight: toolbarHeightStandard,
        leading: SmallLeadingIcon(
          icon: icArrow,
          onPressed: _back,
        ),
        leadingWidth: 64,
        title: Text(
          "Категория",
        ),
        centerTitle: true,
      );

  /// категории
  _buildCategories() => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              for (var i = 0; i < _categories.length; i++) ...[
                _buildCategoryItem(categoryItem: _categories[i], selectedCategoryName: _selectedCategory),
                Divider(height: 1),
              ],
            ],
          ),
        ),
      );

  /// категория
  Widget _buildCategoryItem({required Categories categoryItem, String? selectedCategoryName}) {
    final Widget title = Text(
      categoryItem.name,
      style: Theme.of(context).primaryTextTheme.subtitle1,
    );

    const padding = EdgeInsets.zero;

    /// сохраняем выбранную категорию
    /// делаем активной кнопку
    /// увеличиваем счетчик кликов по категориям (т.к. по нему опредеяем был
    /// ли выбор категории на этом экране)
    void myOnTap() {
      setState(() {
        _selectedCategory = categoryItem.name;
        _isButtonEnabled = true;
      });
    }

    if (categoryItem.name == selectedCategoryName) {
      return ListTile(
        title: title,
        trailing: IconSvg(
          icon: icTick,
          color: Theme.of(context).accentColor,
        ),
        contentPadding: padding,
        onTap: myOnTap,
      );
    } else {
      return ListTile(
        title: title,
        contentPadding: padding,
        onTap: myOnTap,
      );
    }
  }

  /// вернуться на предыдущий экран без сохранения
  void _back() {
    Navigator.pop(context, widget.selectedCategory);
  }
}
