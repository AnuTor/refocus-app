import '../providers/survey.dart';
import '../providers/questions.dart';

Survey cerq(int id) {
  return Survey(
    id: id,
    testName: 'CERQ',
    title:
        'Generalmente todos hemos tenido que afrontar ahora o en el pasado sucesos negativos o desagradables. '
        'Cada persona responde de una forma característica y propia ante estas situaciones. '
        'Por medio de las siguientes preguntas tratamos de conocer en qué piensas cuando experimentas sucesos de este tipo.',
    options: [
      '1 Casi Nunca',
      '2 Algunas veces',
      '3 Ocasionalmente',
      '4 Generalmente',
      '5 Casi siempre',
    ],
    questions: [
      Question(
        id: 1,
        question: 'Pienso que tengo que aceptar que esto sucedió'),
      Question(
        id: 2,
        question: 'Siento que otros son los culpables de lo que pasó'),
      Question(
        id: 3,
        question: 'Sigo pensando en lo terrible que es lo que me pasó'),
      Question(
        id: 4,
        question: 'Pienso que otras personas pasan experiencias mucho peores'),
      Question(
        id: 5,
        question: 'Pienso cómo puedo afrontar mejor la situación'),
      Question(
        id: 6,
        question:
          'Pienso en cosas agradables que no tienen nada que ver con lo que ocurrió'),
      Question(
        id: 7,
        question:
          'Estoy preocupado por lo que pienso y siento acerca de lo que ocurrió'),
      Question(
        id: 8,
        question: 'Pienso que tengo que aceptar la situación'),
      Question(
        id: 9,
        question: 'Siento que soy el/la responsable de lo que sucedió'),
      Question(
        id: 10,
        question: 
          'Pienso que no ha sido tan malo en comparación con otras cosas'),
      Question(
        id: 11,
        question: 'Pienso que la situación tiene también su lado positivo'),
      Question(
        id: 12,
        question: 
          'Pienso en algo agradable en lugar de pensar en lo que sucedió'),
      Question(
        id: 13,
        question:
          'Pienso demasiado en los sentimientos que la situación me generó'),
      Question(
        id: 14,
        question: 'Siento que otros son responsables de lo que pasó'),
      Question(
        id: 15,
        question:
          'Planifico qué es lo mejor que puedo hacer en esta situación'),
      Question(
        id: 16,
        question: 'Le busco el lado positivo al asunto'),
      Question(
        id: 17,
        question: 
          'Pienso que la causa de lo que pasó radica fundamentalmente en mí'),
      Question(
        id: 18,
        question: 'Constantemente pienso en lo horrible que fue la situación'),
    ],
  );
}
