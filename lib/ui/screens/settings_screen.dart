import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/ui/components/icon_svg.dart';
import 'package:places/ui/screens/res/assets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Настройки"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 0),
              title: Text("Темная тема"),
              trailing: CupertinoSwitch(value: true, onChanged: (newValue) {}),
            ),
            Divider(),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 0),
              title: Text("Смотреть туториал"),
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
