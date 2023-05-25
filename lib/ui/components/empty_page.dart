import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/screens/res/sizes.dart';

class EmptyPage extends StatelessWidget {
  final String icon;
  final String header;
  final String text;

  const EmptyPage({Key? key, required this.icon, required this.header, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            icon,
            color: Theme.of(context).colorScheme.background,
            width: 64,
            height: 64,
          ),
          sizedBoxH24,
          Text(
            header,
            style: Theme.of(context).primaryTextTheme.headline6,
            textAlign: TextAlign.center,
          ),
          sizedBoxH8,
          Text(
            text,
            style: Theme.of(context).primaryTextTheme.bodyText2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
