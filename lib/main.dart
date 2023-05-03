import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screens/add_sight_screen.dart';
import 'package:places/ui/screens/filters_screen.dart';
import 'package:places/ui/screens/res/themes.dart';
import 'package:places/ui/screens/settings_screen.dart';
import 'package:places/ui/screens/sight_details.dart';
import 'package:places/ui/screens/sight_list_screen.dart';
import 'package:places/ui/screens/visiting_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> _darkTheme = ValueNotifier<bool>(false);

    return ChangeNotifierProvider(
      create: (contex) => _darkTheme,
      child: Consumer<ValueNotifier<bool>>(
        builder: (context, value, child) => MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ru', ''),
            Locale('en', ''),
          ],
          title: 'Places',
          theme: _darkTheme.value ? AppTheme.darkTheme : AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          //home: SettingsScreen(),
          //home: FiltersScreen(),
          home: SightListScreen(),
          //home: SightDetails(model: mocks[0]),
          //home: AddSightScreen(),
        ),
      ),
    );
  }
}
