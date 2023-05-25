import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    final locale = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final backgroundColor = theme.colorScheme.background;

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
              children: [
                sizedBoxW12,
                IconSvg(
                  icon: icSearch,
                  color: backgroundColor, // .inactiveBlack,.
                ),
                sizedBoxW12,
                Text(
                  locale.search,
                  style: theme.primaryTextTheme.subtitle1!.copyWith(
                    color: backgroundColor,
                  ), // .inactiveBlack),.
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
                color: theme.accentColor,
              ),
              onPressed: onPressedFilter,
              splashRadius: 20,
              splashColor: theme.accentColor.withOpacity(0.25),
            ),
          ),
        ],
      ),
    );
  }
}
