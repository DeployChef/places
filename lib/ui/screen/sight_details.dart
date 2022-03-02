import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/styles/color_constants.dart';
import 'package:places/styles/styles.dart';
import 'package:places/utils/helpers.dart';

class SightDetails extends StatelessWidget {
  final Sight model;

  const SightDetails({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const locateButtonText = 'ПОСТРОИТЬ МАРШРУТ';
    const calendarButtonText = 'Запланировать';
    const favoriteButtenText = 'В Избранное';

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 360,
                  width: double.infinity,
                  color: Helpers.getRandomColor(),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.name,
                        style: text24Style,
                      ),
                      Row(
                        children: [
                          Text(
                            model.type,
                            style: text14BoldStyle,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          const Text(
                            'закрыто до 09:00',
                            style: text14BoldSecondary2Style,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Text(
                          model.details,
                          style: text14Style,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 48,
                            width: double.infinity,
                            color: const Color(0xff4CAF50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.location_pin,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  locateButtonText,
                                  style: textWightButton14Style,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Icon(
                                  Icons.calendar_today,
                                  color: colorDisable,
                                  size: 24,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  calendarButtonText,
                                  style: text14InactiveStyle,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 38,
                          ),
                          Expanded(
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.favorite_border_rounded,
                                  size: 24,
                                  color: colorWhiteSecondary,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  favoriteButtenText,
                                  style: text14Style,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 36, left: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 32,
                  width: 32,
                  color: Colors.white,
                  child: const Center(
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
