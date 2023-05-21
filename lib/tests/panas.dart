import '../providers/survey.dart';
import '../providers/questions.dart';

var panas = Survey(
    id: 1,
    testName: 'PANAS',
    title:
      'Utilizando la escala de respuestas propuesta a continuación, señala en qué medida has experimentado en la última semana las siguientes emociones.',
    options: [
      'Muy poco o nada',
      'Un poco',
      'Medianamente',
      'Bastante',
      'Mucho o totalmente',
    ],
    questions: [
      Question(id: 1, question: 'Interesado'),
      Question(id: 2, question: 'Afligido'),
      Question(id: 3, question: 'Disgustado'),
      Question(id: 4, question: 'Fuerte'),
      Question(id: 5, question: 'Culpable'),
      Question(id: 6, question: 'Asustado'),
      Question(id: 7, question: 'Hostil'),
      Question(id: 8, question: 'Entusiasmado'),
      Question(id: 9, question: 'Orgulloso'),
      Question(id: 10, question: 'Irritable'),
      Question(id: 11, question: 'Avergonzado'),
      Question(id: 12, question: 'Inspirado'),
      Question(id: 13, question: 'Nervioso'),
      Question(id: 14, question: 'Decidido'),
      Question(id: 15, question: 'Atento'),
      Question(id: 16, question: 'Intranquilo'),
      Question(id: 17, question: 'Activo'),
    ],
);
