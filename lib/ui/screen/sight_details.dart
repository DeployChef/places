import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/domain/sight.dart';
import 'package:places/helpers.dart';

class SightDetails extends StatelessWidget {
  final Sight model;

  const SightDetails({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    height: 1000,
                    width: double.infinity,
                    color: Helpers.getRandomColor(),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(16),
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
