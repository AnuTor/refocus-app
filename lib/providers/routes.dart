import 'package:flutter/material.dart';

import './path.dart';

class Routes with ChangeNotifier {
  final List<Path> _items = [
    Path(
        id: 1,
        dias: 10,
        ingreso: DateTime(2023, 01, 01),
        titulo: 'Relajación',
        subtitulo:
            'Se describe en qué consiste la relajación y sus beneficios asociados. Escribo mas texto para ver como se corta',
        imagen:
            'https://www.stroke.org/-/media/Feature/Promo/QuizSnack/undraw_Meditation_re_gll0.jpg?h=483&w=700&hash=BB23470361B6F5F0E12990F4FEDF8718'),
    Path(
        id: 2,
        dias: 6,
        ingreso: DateTime(2023, 01, 01 + 11),
        titulo: 'Evocación de eventos positivos',
        subtitulo:
            'Se describe en qué consiste la evocación de eventos positivos y sus beneficios asociados.',
        imagen:
            'https://www.stroke.org/-/media/Feature/Promo/QuizSnack/undraw_fitness_stats_sht6.jpg?h=515&w=740&hash=943528F20E83D48E8CDF437359001DE7'),
    Path(
        id: 3,
        dias: 7,
        ingreso: DateTime(2023, 01, 01 + 18),
        titulo: 'Reinterpretación Positiva',
        subtitulo:
            'Se describe en qué consiste la evocación de eventos positivos y sus beneficios asociados.',
        imagen:
            'https://www.goredforwomen.org/-/media/Feature/Promo/QuizSnack/undraw_sleep_analysis_o5f9.jpg?h=554&w=700&hash=C45FA7B3B72899FD8F78EAAE7C8701CE'),
  ];
  // var _showFavoritesOnly = false;

  List<Path> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

//  List<RouteElement> get favoriteItems {
//    return _items.where((prodItem) => prodItem.isFavorite).toList();
//  }

  Path findById(int id) {
    return _items.firstWhere((route) => route.id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
