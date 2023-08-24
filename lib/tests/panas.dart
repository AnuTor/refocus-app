import '../providers/survey.dart';
import '../providers/questions.dart';

Survey panas(int id) {
  return Survey(
    id: id,
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
      Question(id: 2, question: 'Afligido o disgustado'),
      Question(id: 3, question: 'Culpable'),
      Question(id: 4, question: 'Asustado o temeroso'),
      Question(id: 5, question: 'Entusiasmado'),
      Question(id: 6, question: 'Inspirado'),
      Question(id: 7, question: 'Nervioso'),
      Question(id: 8, question: 'Decidido'),
      Question(id: 9, question: 'Activo'),
    ],
  );
}
