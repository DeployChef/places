import 'package:places/domain/categories.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screens/res/assets.dart';

final List<Sight> mocks = <Sight>[
  Sight(
    id: 1,
    name: 'Воронежский областной краеведческий музей',
    lat: 55.753564,
    lon: 37.621085,
    url: 'https://upload.wikimedia.org/wikipedia/commons/4/49/Краеведческий_музей_%281%29.jpg',
    type: 'музей',
    details: 'Музей, объектом деятельности которого является документация',
    visited: true,
    visitingDate: '20 окт. 1993',
  ),
  Sight(
    id: 2,
    name: 'Памятник ленину (Ногинск)',
    lat: 55.753574,
    lon: 37.621086,
    url: 'https://vsedomarossii.ru/photos/area_50/city_2225/street_3853/_20463_1.jpg',
    type: 'особое место',
    details: 'Первый памятник ленину',
    visited: false,
    visitingDate: '20 окт. 1993',
  ),
  Sight(
    id: 3,
    name: 'Краеведческий музей',
    lat: 55.753574,
    lon: 37.621086,
    url: 'https://upload.wikimedia.org/wikipedia/commons/4/49/Краеведческий_музей_%281%29.jpg',
    type: 'музей',
    details: 'Музей, объектом деятельности которого является документация',
    visited: true,
    visitingDate: '20 окт. 1993',
  ),
];

final List<Categories> categories = [
  Categories(id: 1, name: 'Отель', icon: icHotel),
  Categories(id: 2, name: 'Ресторан', icon: icRestaurant),
  Categories(id: 3, name: 'Особое место', icon: icParticular),
  Categories(id: 4, name: 'Парк', icon: icPark),
  Categories(id: 5, name: 'Музей', icon: icMuseum),
  Categories(id: 6, name: 'Кафе', icon: icCafe),
];
