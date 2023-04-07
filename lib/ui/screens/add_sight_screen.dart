import 'package:flutter/material.dart';
import 'package:places/ui/components/button_clear.dart';

const double heightInput = 40;

class AddSightScreen extends StatefulWidget {
  const AddSightScreen({Key? key}) : super(key: key);

  @override
  State<AddSightScreen> createState() => _AddSightScreenState();
}

class _AddSightScreenState extends State<AddSightScreen> {
  final _formKey = GlobalKey<FormState>();

  /// кнопка сохранения при старте отключена
  bool _isButtonEnabled = false;

  String? _selectedCategory;

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
      if (_nameController.text.isNotEmpty && _latController.text.isNotEmpty && _lonController.text.isNotEmpty && _detailsController.text.isNotEmpty) {
        _isButtonEnabled = true;
      }
    }

    var theme = Theme.of(context);
    return Scaffold(
      appBar: _buildAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("КАТЕГОРИЯ"),
                    SizedBox(
                      height: 24,
                    ),
                    ..._buildName(theme),
                    SizedBox(
                      height: 24,
                    ),
                    _createCoordinatePicker(theme),
                    SizedBox(
                      height: 12,
                    ),
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
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                width: double.infinity,
                child: FloatingActionButton.extended(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  label: Text("СОЗДАТЬ"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
          ),
        )
      ];

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      leadingWidth: 100,
      leading: TextButton(
        child: Text(
          "Отмена",
        ),
        onPressed: () {},
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
