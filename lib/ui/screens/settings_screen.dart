import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/ui/components/bottom_navigaion_bar.dart';
import 'package:places/ui/components/icon_svg.dart';
import 'package:places/ui/screens/res/assets.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          locale.settings,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: MainBottomNavigationBar(
        currentScreenIndex: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 0),
              title: Text(
                locale.darkTheme,
                style: theme.primaryTextTheme.subtitle1,
              ),
              trailing: ThemeSwitch(),
            ),
            Divider(),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 0),
              title: Text(
                locale.watchHelp,
                style: theme.primaryTextTheme.subtitle1,
              ),
              trailing: IconButton(
                icon: IconSvg(
                  icon: icInfo,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () {},
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({
    Key? key,
  }) : super(key: key);

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Consumer<ValueNotifier<bool>>(
      builder: (context, darkTheme, child) => CupertinoSwitch(
        trackColor: theme.primaryColorDark,
        value: darkTheme.value,
        onChanged: (newValue) {
          darkTheme.value = newValue;
        },
      ),
    );
  }
}
