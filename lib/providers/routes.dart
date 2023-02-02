import 'package:flutter/material.dart';

import './activity.dart';
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
        imagen: 'https://www.stroke.org/-/media/Feature/Promo/QuizSnack/undraw_Meditation_re_gll0.jpg?h=483&w=700&hash=BB23470361B6F5F0E12990F4FEDF8718',
        actividades: [
          Activity(id: 1, title: "Refocus App", text: "Día a día nos enfrentamos a diferentes eventos estresantes. Los eventos estresantes son situaciones que desencadenan en nosotros emociones negativas o desagradables como ansiedad, tristeza, miedo o irritabilidad. Si bien las emociones negativas son útiles para identificar situaciones potencialmente dañinas y atender a ellas, muchas veces nos desbordan y obstaculizan en nuestros quehaceres u objetivos diarios. Afortunadamente, existen estrategias que podemos aprender para manejar la respuesta emocional que experimentamos ante un evento dado. Aquí aprenderás a cambiar tu forma de pensar o interpretar la situación y verás que, de esta forma, puedes regular tu estado emocional. En otras palabras, si cambias la forma de pensar sobre la situación podrás cambiar la forma en que ese evento te impacta emocionalmente, ya sea disminuyendo la intensidad de la emoción experimentada (por ejemplo, no sintiendo tanta ansiedad) o logrando experimentar otra emoción distinta (por ejemplo, pasando de una emoción de angustia a una emoción agradable de tranquilidad). Es sabido también que es más dificultoso cambiar la forma de pensar o buscar formas de pensar alternativas cuando uno se encuentra bajo un estado emocional intenso. Por ejemplo, es muy difícil para una persona que se encuentra pasando por alguna crisis de angustia o tristeza profunda no tener pensamientos negativos sobre sí mismo, los demás y el mundo que lo rodea. Es por todo esto que en primer lugar aprenderás técnicas de relajación que te ayuden a alcanzar un estado emocional de baja activación (en otras palabras, a sentirte tranquilo-relajado), estado que facilitará la búsqueda de pensamientos o formas de interpretación alternativas."),
          Activity(id: 2, title: "Relajación", text: "Lograr estar relajados/tranquilos es un paso fundamental, tanto para lograr calmarnos ante un evento estresante como para aplicar las técnicas de modificación de pensamientos que veremos luego.\n\nEjercicios de Respiración\n\nUna de las técnicas más sencillas de...")
        ]),
    Path(
        id: 2,
        dias: 6,
        ingreso: DateTime(2023, 01, 01 + 11),
        titulo: 'Evocación de eventos positivos',
        subtitulo:
            'Se describe en qué consiste la evocación de eventos positivos y sus beneficios asociados.',
        imagen: 'https://www.stroke.org/-/media/Feature/Promo/QuizSnack/undraw_fitness_stats_sht6.jpg?h=515&w=740&hash=943528F20E83D48E8CDF437359001DE7',
        actividades: [
          Activity(id: 2, title: "Título", text: "texto"),
          Activity(id: 2, title: "Título", text: "texto")
        ]),
    Path(
        id: 3,
        dias: 7,
        ingreso: DateTime(2023, 01, 01 + 18),
        titulo: 'Reinterpretación Positiva',
        subtitulo:
            'Se describe en qué consiste la evocación de eventos positivos y sus beneficios asociados.',
        imagen: 'https://www.goredforwomen.org/-/media/Feature/Promo/QuizSnack/undraw_sleep_analysis_o5f9.jpg?h=554&w=700&hash=C45FA7B3B72899FD8F78EAAE7C8701CE',
        actividades: [
          Activity(id: 2, title: "Título", text: "texto"),
          Activity(id: 2, title: "Título", text: "texto")
        ]),
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
