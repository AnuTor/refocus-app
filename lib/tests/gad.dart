import 'package:flutter/material.dart';

import '../providers/survey.dart';
import '../providers/questions.dart';

var gad = Survey(
    id: 2,
    testName: 'GAD',
    title:
        '¿Durante la última semana, con qué frecuencia sintió́ molestias por los siguientes problemas?',
    options: [
      'Nunca',
      'Varios dias',
      'Mas de la mitad de los dias',
      'Todos los dias',
    ],
    questions: [
      Question(
          id: 1,
          question:
              'Sentirse nervioso/a, ansioso/a o con los nervios de punta'),
      Question(
          id: 2,
          question:
              'No poder dejar de preocuparse o no poder controlar la preocupación'),
      Question(id: 3, question: 'Preocuparse demasiado por diferentes cosas'),
      Question(id: 4, question: 'Dificultad para relajarse'),
      Question(
          id: 5,
          question:
              'Estar tan inquieto/a que es difícil permanecer sentado/a quieto/a'),
      Question(id: 6, question: 'Enojarse o irritarse con facilidad'),
      Question(
          id: 7,
          question: 'Sentirse con miedo como si algo terrible fuera a suceder'),
    ]);
