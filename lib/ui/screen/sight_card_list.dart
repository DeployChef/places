import 'package:flutter/material.dart';
import 'package:places/domain/enums/card_type.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/sight_card.dart';

class SightCardList extends StatelessWidget {
  final List<Sight> sights;
  final CardType cardType;

  const SightCardList({Key? key, required this.sights, required this.cardType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            for (var sight in sights) ...[
              SightCard(model: sight, cardType: cardType),
              const SizedBox(height: 16),
            ],
          ],
        ),
      ),
    );
  }
}
