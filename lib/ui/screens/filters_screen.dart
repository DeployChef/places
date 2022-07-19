import 'package:flutter/material.dart';
import 'package:places/ui/components/icon_svg.dart';
import 'package:places/ui/screens/res/assets.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: _createSettingsAppbar(theme),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            Text("КАТЕГОРИИ"),
            SizedBox(),
            Row(),
            SizedBox(),
            Row(),
            SizedBox(),
            Column(
              children: [
                Row(),
                SizedBox(),
                RangeSlider(min: 10, max: 30, values: RangeValues(13, 24), onChanged: (newValue) {}),
              ],
            )
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
          label: Text("wdwd"),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  AppBar _createSettingsAppbar(ThemeData theme) {
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
            "Очистить",
            style: theme.textTheme.headline5?.copyWith(
              color: theme.accentColor,
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
