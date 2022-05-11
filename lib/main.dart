import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screens/sight_details.dart';
import 'package:places/ui/screens/sight_list_screen.dart';
import 'package:places/ui/screens/visiting_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VisitingScreen(), //SightDetails(model: mocks[0]), //,
    );
  }
}
