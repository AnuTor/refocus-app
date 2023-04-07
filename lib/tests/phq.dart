import 'package:flutter/material.dart';

import '../providers/survey.dart';
import '../providers/questions.dart';

var phq = Survey(
    id: 1,
    title:
        'Durante las últimas 2 semanas, ¿qué tan seguido ha tenido molestias debido a los siguientes problemas?',
    options: [
      'Ningun dia',
      'Varios dias',
      'Mas de la mitad de los dias',
      'Casi todos los dias'
    ],
    questions: [
      Question(id: 1, question: 'Poco interés o placer en hacer cosas'),
      Question(
          id: 2,
          question: 'Se ha sentido decaído(a), deprimido(a) o sin esperanzas'),
      Question(
          id: 3,
          question:
              'Ha tenido dificultad para quedarse o permanecer dormido(a), o ha dormido demasiado'),
      Question(id: 4, question: 'Se ha sentido cansado(a) o con poca energía'),
      Question(id: 5, question: 'Sin apetito o ha comido en exceso'),
      Question(
          id: 6,
          question:
              'Se ha sentido mal con usted mismo(a) – o que es un fracaso o que ha quedado mal con usted mismo(a) o con su familia'),
      Question(
          id: 7,
          question:
              ' Ha tenido dificultad para concentrarse en ciertas actividades, tales como leer el periódico o ver la televisión'),
      Question(
          id: 8,
          question:
              '¿Se ha movido o hablado tan lento que otras personas podrían haberlo notado? o lo contrario – muy inquieto(a) o agitado(a) que ha estado moviéndose mucho más de lo normal '),
      Question(
          id: 9,
          question:
              'Pensamientos de que estaría mejor muerto(a) o de lastimarse de alguna manera'),
    ]);
