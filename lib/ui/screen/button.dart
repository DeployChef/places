// ignore_for_file: prefer_single_quotes, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MegaButton extends StatelessWidget {
  const MegaButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 48,
        width: double.infinity,
        color: Color(0xff4CAF50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Icon(
              Icons.zoom_out_map_sharp,
              color: Colors.white,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "ПОСТРОИТЬ МАРШРУТ",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
