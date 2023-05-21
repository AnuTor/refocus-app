import '../providers/survey.dart';
import '../providers/questions.dart';

var cerq = Survey(
    id: 2,
    testName: 'CERQ',
    title:
      'Generalmente todos hemos tenido que afrontar ahora o en el pasado sucesos negativos o desagradables. '
      'Cada persona responde de una forma característica y propia ante estas situaciones. '
      'Por medio de las siguientes preguntas tratamos de conocer en qué piensas cuando experimentas sucesos de este tipo.',
    options: [
      'Nunca',
      'Algunas veces',
      'Ocasionalmente',
      'Generalmente',
      'Casi siempre',
    ],
    questions: [
      Question(
        id: 1,
        question: 'Siento que soy el/la culpable de lo ocurrido'),
      Question(
        id: 2,
        question: 'Pienso que tengo que aceptar que esto sucedió'),
      Question(
        id: 3,
        question: 'Con frecuencia pienso en cómo me siento acerca de lo que ocurrió'),
      Question(
        id: 4,
        question: 'Pienso en cosas más agradables que lo ocurrido'),
      Question(
        id: 5,
        question: 'Pienso en qué es lo mejor que puedo hacer, frente a esta situación'),
      Question(
        id: 6,
        question: 'Pienso que puedo aprender algo de esta situación'),
      Question(
        id: 7,
        question: 'Pienso que todo podría haber sido mucho peor'),
      Question(
        id: 8,
        question: 'Con frecuencia pienso que lo que me pasó es mucho peor de lo que les pasó a otras personas'),
      Question(
        id: 9,
        question: 'Siento que otros son los culpables de lo que pasó'),
      Question(
        id: 10,
        question: 'Sigo pensando en lo terrible que es lo que me pasó'),
      Question(
        id: 11,
        question: 'Pienso que otras personas pasan experiencias mucho peores'),
      Question(
        id: 12,
        question: 'Pienso que puedo fortalecerme a partir de lo que sucedió'),
      Question(
        id: 13,
        question: 'Pienso cómo puedo afrontar mejor la situación'),
      Question(
        id: 14,
        question: 'Pienso en cosas agradables que no tienen nada que ver con lo que ocurrió'),
      Question(
        id: 15,
        question: 'Estoy preocupado por lo que pienso y siento acerca de lo que ocurrió'),
      Question(
        id: 16,
        question: 'Pienso que tengo que aceptar la situación'),
      Question(
        id: 17,
        question: 'Siento que soy el/la responsable de lo que sucedió'),
      Question(
        id: 18,
        question: 'Quiero comprender por qué me siento de esta forma por lo que me ha ocurrido'),
      Question(
        id: 19,
        question: 'Pienso cómo puedo cambiar la situación'),
      Question(
        id: 20,
        question: 'Pienso que no ha sido tan malo en comparación con otras cosas'),
      Question(
        id: 21,
        question: 'Pienso en los errores que otros cometieron'),
      Question(
        id: 22,
        question: 'Con frecuencia pienso que lo que me pasó es lo peor que le puede pasar a una persona'),
      Question(
        id: 23,
        question: 'Pienso que la situación tiene también su lado positivo'),
      Question(
        id: 24,
        question: 'Pienso en algo agradable en lugar de pensar en lo que sucedió'),
      Question(
        id: 25,
        question: 'Pienso que no puedo cambiar nada al respecto'),
      Question(
        id: 26,
        question: 'Pienso en los errores que cometí'),
      Question(
        id: 27,
        question: 'Pienso demasiado en los sentimientos que la situación me generó'),
      Question(
        id: 28,
        question: 'Pienso en experiencias agradables'),
      Question(
        id: 29,
        question: 'Siento que otros son responsables de lo que pasó'),
      Question(
        id: 30,
        question: 'Planifico qué es lo mejor que puedo hacer en esta situación'),
      Question(
        id: 31,
        question: 'Le busco el lado positivo al asunto'),
      Question(
        id: 32,
        question: 'Pienso que tengo que aprender a vivir con lo que pasó'),
      Question(
        id: 33,
        question: 'Pienso que la causa de lo que pasó radica fundamentalmente en mí'),
      Question(
        id: 34,
        question: 'Me digo a mi mismo/a que hay cosas peores en la vida'),
      Question(
        id: 35,
        question: 'Constantemente pienso en lo horrible que fue la situación'),
      Question(
        id: 36,
        question: 'Siento que la causa radica fundamentalmente en otros'),
    ],
);
