import 'package:flutter/material.dart';
import 'package:places/ui/components/icon_svg.dart';
import 'package:places/ui/screens/res/assets.dart';
import 'package:places/ui/screens/res/sizes.dart';

class SearchBarStatic extends StatelessWidget {
  final VoidCallback? onTapSearch;
  final VoidCallback? onPressedFilter;

  const SearchBarStatic({
    Key? key,
    this.onTapSearch,
    this.onPressedFilter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radiusSearchInput),
      child: Stack(
        children: [
          Container(
            color: Theme.of(context).primaryColorLight,
            width: double.infinity,
            height: heightInput,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                sizedBoxW12,
                IconSvg(
                  icon: icSearch,
                  width: 24,
                  height: 24,
                  color: Theme.of(context).colorScheme.background, //.inactiveBlack,
                ),
                sizedBoxW12,
                Text(
                  "Поиск",
                  style: Theme.of(context).primaryTextTheme.subtitle1!.copyWith(
                        color: Theme.of(context).colorScheme.background,
                      ), //.inactiveBlack),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: onTapSearch,
              ),
            ),
          ),
          Positioned(
            top: 4,
            bottom: 4,
            right: 0,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: IconSvg(
                icon: icFilter,
                color: Theme.of(context).accentColor,
              ),
              onPressed: onPressedFilter,
              splashRadius: 20,
              splashColor: Theme.of(context).accentColor.withOpacity(0.25),
            ),
          ),
        ],
      ),
    );
  }
}
