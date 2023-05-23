import '../providers/survey.dart';
import '../providers/questions.dart';

Survey gad(int id) {
  return Survey(
    id: id,
    testName: 'GAD',
    title:
      'Durante la última semana, ¿con qué frecuencia sintió molestias debido a los siguientes problemas?',
    options: [
      'Nunca',
      'Varios días',
      'Más de la mitad de los días',
      'Todos los días',
    ],
    questions: [
      Question(
        id: 1,
        question: 'Sentirse nervioso/a, ansioso/a o con los nervios de punta'),
      Question(
        id: 2,
        question: 'No poder dejar de preocuparse o no poder controlar la preocupación'),
      Question(
        id: 3,
        question: 'Preocuparse demasiado por diferentes cosas'),
      Question(
        id: 4,
        question: 'Dificultad para relajarse'),
      Question(
        id: 5,
        question: 'Estar tan inquieto/a que es difícil permanecer sentado/a quieto/a'),
      Question(
        id: 6,
        question: 'Enojarse o irritarse con facilidad'),
      Question(
        id: 7,
        question: 'Sentirse con miedo, como si algo terrible fuera a suceder'),
    ],
  );
}
