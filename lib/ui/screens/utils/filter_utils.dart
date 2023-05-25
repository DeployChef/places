import 'dart:math';

import 'package:flutter/material.dart';
import 'package:places/domain/categories.dart';
import 'package:places/domain/sight.dart';

/// так как используется на трех экранах (главный, фильтр, поиск)
/// вынесла в отдельный файл
/// поиск карточек по фильтру
List<Sight> filterData({required List<Sight> data, required List<Categories> categories, required CenterPoint centerPoint, required RangeValues distance}) {
  List<Sight> result = [];

  for (var i = 0; i < categories.length; i++) {
    for (var k = 0; k < data.length; k++) {
      if (data[k].type.toLowerCase() == categories[i].name.toLowerCase() && _arePointsNear(checkPointLat: data[k].lat, checkPointLon: data[k].lon, centerPoint: centerPoint, distance: distance)) {
        result.add(data[k]);
      }
    }
  }

  return result;
}

/// поиск карточек по расстоянию
/// https://stackoverflow.com/questions/24680247/check-if-a-latitude-and-longitude-is-within-a-circle-google-maps
/// distance в метрах, переводим в км
bool _arePointsNear({required double checkPointLat, required double checkPointLon, required CenterPoint centerPoint, required RangeValues distance}) {
  const ky = 40000 / 360;
  final kx = cos(pi * centerPoint.lat / 180.0) * ky;
  final dx = (centerPoint.lon - checkPointLon).abs() * kx;
  final dy = (centerPoint.lat - checkPointLat).abs() * ky;
  final d = sqrt(dx * dx + dy * dy);
  final minDistance = (distance.start / 1000).round();
  final maxDistance = (distance.end / 1000).round();

  return d >= minDistance && d <= maxDistance;
}

/// стартовая точка поиска с названием и координатами
class CenterPoint {
  CenterPoint({required this.lat, required this.lon, required this.name});

  final double lat;
  final double lon;
  final String name;
}

/// настройки фильтра
/// для передачи между экранами
/// [categories] выбранные категории
/// [distance] расстояние из слайдера
/// [centerPoint] стартовая точка поиска
class FilterSettings {
  final List<Categories> categories;
  final RangeValues distance;
  final CenterPoint centerPoint;

  FilterSettings({
    required this.categories,
    required this.distance,
    required this.centerPoint,
  });
}
