import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("КАТЕГОРИИ"),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCategory(theme, "Отель", icHotel),
                _buildCategory(theme, "Ресторан", icRestaurant),
                _buildCategory(theme, "Особое место", icParticular),
              ],
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCategory(theme, "Парк", icPark),
                _buildCategory(theme, "Музей", icMuseum),
                _buildCategory(theme, "Кафе", icCafe),
              ],
            ),
            SizedBox(height: 56),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Расстояние"),
                    Text("от 10 до 30 км"),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: double.infinity,
                  child: RangeSlider(
                    min: 10,
                    max: 30,
                    values: RangeValues(13, 24),
                    onChanged: (newValue) {},
                  ),
                ),
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
          label: Text("ПОКАЗАТЬ (190)"),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Container _buildCategory(ThemeData theme, String title, String iconPath) {
    return Container(
      height: 96,
      width: 92,
      child: Column(
        children: [
          SizedBox(
            height: 64,
            width: 64,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.accentColor.withOpacity(0.16),
                  ),
                  height: double.infinity,
                  width: double.infinity,
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      iconPath,
                      color: theme.accentColor,
                    ),
                    splashColor: theme.accentColor.withOpacity(0.5),
                  ),
                ),
                _showSelected(),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(title),
        ],
      ),
    );
  }

  Widget _showSelected() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Stack(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: ShapeDecoration(
              shape: CircleBorder(),
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: SvgPicture.asset(
              icTick,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
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
