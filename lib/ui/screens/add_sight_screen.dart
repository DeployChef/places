import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/components/button_clear.dart';
import 'package:places/ui/components/button_save.dart';
import 'package:places/ui/components/icon_svg.dart';
import 'package:places/ui/components/title_leading_appbar.dart';
import 'package:places/ui/screens/res/assets.dart';
import 'package:places/ui/screens/res/sizes.dart';
import 'package:places/ui/screens/select_category_screen.dart';
import 'package:places/ui/screens/sight_list_screen.dart';

const double heightInput = 40;

class AddSightScreen extends StatefulWidget {
  const AddSightScreen({Key? key}) : super(key: key);

  @override
  State<AddSightScreen> createState() => _AddSightScreenState();
}

class _AddSightScreenState extends State<AddSightScreen> {
  final _formKey = GlobalKey<FormState>();

  /// регулярные выражения
  final _namePattern = RegExp(r'^[a-zа-яA-ZА-Я0-9 ]+$');
  final _coordinatesPattern = RegExp(r'^-?[0-9]{1,3}(?:\.[0-9]{1,10})?$');

  final addNewSightLabelSelectedCategory = 'КАТЕГОРИЯ';
  final addNewSightLabelName = 'НАЗВАНИЕ';
  final addNewSightLabelLat = 'ШИРОТА';
  final addNewSightLabelLon = 'ДОЛГОТА';
  final addNewSightLabelDetails = 'ОПИСАНИЕ';
  final addNewSightTitleShowOnMap = 'Указать на карте';
  final emptyCategory = 'Не выбрано';
  final errorEmptyCategory = 'Выберите Категорию';
  final errorEmptyName = 'Заполните Название';
  final errorShortName = 'Название слишком короткое';
  final errorIncorrectName = 'Только буквы и цифры';
  final errorEmptyCoordinates = 'Укажите данные';
  final errorIncorrectCoordinates = 'Некорректные данные';
  final errorEmptyDetails = 'Заполните Описание min 100 символов';
  final errorShortDetails = 'Описание меньше 100 символов';
  final addNewSightAlertDialogHeader = 'Данные сохранены';
  final addNewSightAlertDialogLat = 'Широта:\n';
  final addNewSightAlertDialogLon = 'Долгота:\n';

  /// кнопка сохранения при старте отключена
  bool _isButtonEnabled = false;
  VoidCallback? _submitForm;

  /// сюда сохраним данные из формы
  String? _selectedCategory;
  String? _name;
  double? _lat;
  double? _lon;
  String? _details;

  final _categoryController = TextEditingController();
  final _nameController = TextEditingController();
  final _latController = TextEditingController();
  final _lonController = TextEditingController();
  final _detailsController = TextEditingController();

  final _categoryFocus = FocusNode();
  final _nameFocus = FocusNode();
  final _latFocus = FocusNode();
  final _lonFocus = FocusNode();
  final _detailsFocus = FocusNode();

  FocusNode? _currentFocus;

  @override
  void initState() {
    super.initState();

    _categoryController.addListener(() => setState(() {}));
    _nameController.addListener(() => setState(() {}));
    _latController.addListener(() => setState(() {}));
    _lonController.addListener(() => setState(() {}));
    _detailsController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _categoryController.dispose();
    _nameController.dispose();
    _latController.dispose();
    _lonController.dispose();
    _detailsController.dispose();

    _categoryFocus.dispose();
    _nameFocus.dispose();
    _latFocus.dispose();
    _lonFocus.dispose();
    _detailsFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedCategory == null) {
      _categoryController.text = "Не выбрано";
    } else {
      _categoryController.text = _selectedCategory!;

      /// если все поля что-то содержат, то кнопка активна
      _isButtonEnabled = _nameController.text.isNotEmpty && _latController.text.isNotEmpty && _lonController.text.isNotEmpty && _detailsController.text.isNotEmpty;
    }

    var theme = Theme.of(context);

    if (_isButtonEnabled)
      _submitForm = () {
        final isValid = _formKey.currentState!.validate();

        if (isValid) {
          _formKey.currentState!.save();

          /// получаем id последнего элемента в массиве
          final int _newId = mocks.last.id + 1;

          /// временно
          const _imgPreview = 'https://img1.fonwall.ru/o/dg/coast-beach-sand-ocean.jpeg';

          /// сюда сохраним данные полей
          Sight newSight = Sight(
            id: _newId,
            type: _selectedCategory!,
            name: _name!,
            lat: _lat!,
            lon: _lon!,
            details: _details!,
            visited: false,
            visitingDate: "",
            url: _imgPreview,
          );

          /// и потом добавим в общий список
          mocks.add(newSight);

          /// подтверждаем сохранение данных
          _showDialog(
            category: _selectedCategory!,
            name: _name!,
            lat: _lat!,
            lon: _lon!,
            details: _details!,
          );
        }
      };
    else
      _submitForm = null;

    return Scaffold(
      appBar: _buildAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ..._buildCategory(),
                    sizedBoxH24,
                    ..._buildName(theme),
                    sizedBoxH24,
                    _createCoordinatePicker(theme),
                    sizedBoxH12,
                    ..._buildDescription(theme),
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ButtonSave(
                title: "СОЗДАТЬ",
                isButtonEnabled: _isButtonEnabled,
                onPressed: _submitForm,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Поле Категория
  List<Widget> _buildCategory() {
    return [
      Text(addNewSightLabelSelectedCategory),
      SizedBox(
        height: 12,
      ),
      SizedBox(
        height: 48,
        child: Theme(
          data: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
              errorStyle: TextStyle(fontSize: 0),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: _categoryController.text != emptyCategory ? Theme.of(context).accentColor.withOpacity(0.4) : Theme.of(context).colorScheme.secondary.withOpacity(0.24),
                  width: 1,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary.withOpacity(0.24),
                  style: BorderStyle.solid,
                  width: 1,
                ),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).errorColor.withOpacity(0.4),
                  style: BorderStyle.solid,
                  width: 1,
                ),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).errorColor.withOpacity(0.4),
                  style: BorderStyle.solid,
                  width: 2,
                ),
              ),
            ),
          ),
          child: TextFormField(
            focusNode: _categoryFocus,
            autofocus: true,
            controller: _categoryController,
            showCursor: false,
            maxLines: 1,
            style: _selectedCategory == null ? Theme.of(context).primaryTextTheme.subtitle1!.copyWith(color: Theme.of(context).colorScheme.secondary) : Theme.of(context).primaryTextTheme.subtitle1,
            readOnly: true,
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: IconSvg(
                  icon: icView,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            validator: _validateCategory,
            onSaved: (value) => setState(() => _selectedCategory = value),
            onTap: () {
              _returnCategoryFromSelectCategoryScreen();
            },
          ),
        ),
      ),
    ];
  }

  /// получаем выбранную категорию из экрана с категориями
  void _returnCategoryFromSelectCategoryScreen() async {
    final String? result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SelectCategoryScreen(
                selectedCategory: _selectedCategory,
              ) //SelectCategoryScreen(selectedCategory: _selectedCategory),
          ),
    );
    setState(() {
      _selectedCategory = result;
      _fieldFocusChange(context, _categoryFocus, _nameFocus);
    });
  }

  /// переключение фокуса в полях формы
  void _fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
    setState(() {
      _currentFocus = nextFocus;
    });
  }

  List<Widget> _buildDescription(ThemeData theme) => [
        Text("Описание".toUpperCase()),
        SizedBox(
          height: 12,
        ),
        TextFormField(
          focusNode: _detailsFocus,
          autofocus: true,
          onEditingComplete: () {
            _detailsFocus.unfocus();
            _currentFocus = null;
          },
          onTap: () {
            setState(() {
              _currentFocus = _detailsFocus;
            });
          },
          controller: _detailsController,
          cursorHeight: 24,
          cursorWidth: 1,
          maxLength: 300,
          maxLines: 3,
          textInputAction: TextInputAction.done,
          style: Theme.of(context).primaryTextTheme.subtitle1,
          decoration: InputDecoration(
            counterText: '',
            hintText: 'введите текст',
            hintStyle: theme.primaryTextTheme.subtitle1!.copyWith(color: theme.colorScheme.background),
            suffixIcon: _clearField(context, _detailsFocus, _detailsController),
            enabledBorder: _buildBorderColor(_detailsController),
          ),
          validator: _validateDetails,
          onSaved: (value) => setState(() => _details = value),
        ),
      ];

  List<Widget> _buildName(ThemeData theme) => [
        Text("Название".toUpperCase()),
        SizedBox(
          height: 12,
        ),
        SizedBox(
          height: heightInput,
          child: TextFormField(
            focusNode: _nameFocus,
            autofocus: true,
            controller: _nameController,
            onTap: () {
              setState(() {
                _currentFocus = _nameFocus;
              });
            },
            onFieldSubmitted: (_) {
              _fieldFocusChange(context, _nameFocus, _latFocus);
            },
            cursorHeight: 24,
            cursorWidth: 1,
            maxLength: 100,
            maxLines: 1,
            textInputAction: TextInputAction.next,
            style: theme.primaryTextTheme.subtitle1,
            decoration: InputDecoration(
              counterText: '',
              suffixIcon: _clearField(context, _nameFocus, _nameController),
              enabledBorder: _buildBorderColor(_nameController),
            ),
            validator: _validateName,
            onSaved: (value) => setState(() => _name = value),
          ),
        )
      ];

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      leadingWidth: 100,
      leading: TitleLeadingAppBar(
        title: "Отмена",
      ),
      title: Text(
        "Новое место",
      ),
      centerTitle: true,
    );
  }

  /// очистка поля по кнопке
  Widget _clearField(BuildContext context, FocusNode currentFocus, TextEditingController controller) {
    if (currentFocus == _currentFocus && controller.text.isNotEmpty) {
      return ButtonClear(controller: controller);
    }

    return const SizedBox(width: 0);
  }

  InputBorder _buildBorderColor(TextEditingController controller) => Theme.of(context).inputDecorationTheme.enabledBorder!.copyWith(
        borderSide: BorderSide(
          color: controller.text.isNotEmpty ? Theme.of(context).accentColor.withOpacity(0.4) : Theme.of(context).accentColor.withOpacity(0.4),
          style: BorderStyle.solid,
          width: 1,
        ),
      );

  /// валидация полей
  String? _validateCategory(String? value) {
    if (value == null || value.isEmpty || value == emptyCategory) return errorEmptyCategory;

    return null;
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) return errorEmptyName;
    if (value.length < 5) return errorShortName;
    if (!_namePattern.hasMatch(value)) return errorIncorrectName;

    return null;
  }

  String? _validateCoordinates(String? value) {
    if (value == null || value.isEmpty) return errorEmptyCoordinates;
    if (!_coordinatesPattern.hasMatch(value)) return errorIncorrectCoordinates;

    return null;
  }

  String? _validateDetails(String? value) {
    if (value == null || value.isEmpty) return errorEmptyDetails;
    if (value.length < 1) return errorShortDetails;

    return null;
  }

  /// показываем окно если форма валидна
  void _showDialog({required String category, required String name, required double lat, required double lon, required String details}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radiusCard),
            ),
            title: Text(
              addNewSightAlertDialogHeader,
              style: Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).accentColor),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  category,
                  style: Theme.of(context).primaryTextTheme.subtitle1,
                ),
                sizedBoxH12,
                Text(
                  name,
                  style: Theme.of(context).primaryTextTheme.subtitle1,
                ),
                Text(
                  '${details.substring(0, 1)} ...',
                  style: Theme.of(context).primaryTextTheme.subtitle1,
                ),
                sizedBoxH12,
                Text(
                  '$addNewSightAlertDialogLat$lat',
                  style: Theme.of(context).primaryTextTheme.bodyText2,
                ),
                Text(
                  '$addNewSightAlertDialogLon$lon',
                  style: Theme.of(context).primaryTextTheme.bodyText2,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text(
                  'Ok',
                  style: Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).accentColor),
                ),
                //splashColor: Theme.of(context).accentColor.withOpacity(0.05),
              ),
            ],
          );
        });
  }

  Widget _createCoordinatePicker(ThemeData theme) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ШИРОТА"),
                    SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: heightInput,
                      child: TextFormField(
                        focusNode: _latFocus,
                        autofocus: true,
                        controller: _latController,
                        onTap: () {
                          setState(() {
                            _currentFocus = _latFocus;
                          });
                        },
                        onFieldSubmitted: (_) {
                          _fieldFocusChange(context, _latFocus, _lonFocus);
                        },
                        cursorHeight: 24,
                        cursorWidth: 1,
                        maxLength: 50,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        style: theme.primaryTextTheme.subtitle1,
                        decoration: InputDecoration(
                          counterText: '',
                          suffixIcon: _clearField(context, _latFocus, _latController),
                          enabledBorder: _buildBorderColor(_latController),
                        ),
                        validator: _validateCoordinates,
                        onSaved: (value) => setState(() => _lat = double.tryParse(value!)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ДОЛГОТА"),
                    SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: heightInput,
                      child: TextFormField(
                        focusNode: _lonFocus,
                        autofocus: true,
                        controller: _lonController,
                        onTap: () {
                          setState(() {
                            _currentFocus = _lonFocus;
                          });
                        },
                        onFieldSubmitted: (_) {
                          _fieldFocusChange(context, _lonFocus, _detailsFocus);
                        },
                        cursorHeight: 24,
                        cursorWidth: 1,
                        maxLength: 50,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        style: theme.primaryTextTheme.subtitle1,
                        decoration: InputDecoration(
                          counterText: '',
                          suffixIcon: _clearField(context, _lonFocus, _lonController),
                          enabledBorder: _buildBorderColor(_lonController),
                        ),
                        validator: _validateCoordinates,
                        onSaved: (value) => setState(() => _lon = double.tryParse(value!)),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
            child: Text(
              "Указать на карте",
              style: theme.textTheme.headline5?.copyWith(
                color: theme.accentColor,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
