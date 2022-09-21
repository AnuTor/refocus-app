import 'package:flutter/material.dart';

import '../widgets/route_element.dart';

class SelectRoute extends StatelessWidget {
  const SelectRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const <Widget>[
        RouteElement(
            titulo: 'Relajación',
            subtitulo:
                'Se describe en qué consiste la relajación y sus beneficios asociados. Escribo mas texto para ver como se corta',
            imagen:
                'https://www.stroke.org/-/media/Feature/Promo/QuizSnack/undraw_Meditation_re_gll0.jpg?h=483&w=700&hash=BB23470361B6F5F0E12990F4FEDF8718'),
        RouteElement(
            titulo: 'Evocación de eventos positivos',
            subtitulo:
                'Se describe en qué consiste la evocación de eventos positivos y sus beneficios asociados.',
            imagen:
                'https://www.stroke.org/-/media/Feature/Promo/QuizSnack/undraw_fitness_stats_sht6.jpg?h=515&w=740&hash=943528F20E83D48E8CDF437359001DE7'),
        RouteElement(
            titulo: 'Reinterpretación Positiva',
            subtitulo:
                'Se describe en qué consiste la evocación de eventos positivos y sus beneficios asociados.',
            imagen:
                'https://www.goredforwomen.org/-/media/Feature/Promo/QuizSnack/undraw_sleep_analysis_o5f9.jpg?h=554&w=700&hash=C45FA7B3B72899FD8F78EAAE7C8701CE'),
      ],
    );
  }
}
