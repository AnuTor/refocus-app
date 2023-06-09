import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './activity.dart';
import './path.dart';
import '../tests/cerq.dart';
import '../tests/gad.dart';
import '../tests/panas.dart';
import '../tests/phq.dart';

class Routes with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String _username = "";
  DateTime _userStartdate = DateTime.now();
  final List<Path> _items = [
    Path(
      id: 1,
      days: 7,
      title: 'Relajación',
      subtitle: 'Técnicas que te ayudarán a alcanzar un estado emocional de '
          'baja activación, a sentirte más tranquilo y relajado.',
      image: 'assets/images/relaxing_at_home.png',
      activities: [
        Activity(
            id: 1,
            title: 'Presentación',
            image: 'assets/images/relaxing_at_home.png',
            text:
                'Día a día nos enfrentamos a diferentes eventos estresantes. Los eventos estresantes son situaciones que desencadenan en nosotros emociones negativas o desagradables como ansiedad, tristeza, miedo o irritabilidad. Si bien las emociones negativas son útiles para identificar situaciones potencialmente dañinas y atender a ellas, muchas veces nos desbordan y obstaculizan en nuestros quehaceres u objetivos diarios. Afortunadamente, existen estrategias que podemos aprender para manejar la respuesta emocional que experimentamos ante un evento dado. Aquí aprenderás a cambiar tu forma de pensar o interpretar la situación y verás que, de esta forma, puedes regular tu estado emocional. En otras palabras, si cambias la forma de pensar sobre la situación podrás cambiar la forma en que ese evento te impacta emocionalmente, ya sea disminuyendo la intensidad de la emoción experimentada (por ejemplo, no sintiendo tanta ansiedad) o logrando experimentar otra emoción distinta (por ejemplo, pasando de una emoción de angustia a una emoción agradable de tranquilidad). Es sabido también que es más dificultoso cambiar la forma de pensar o buscar formas de pensar alternativas cuando uno se encuentra bajo un estado emocional intenso. Por ejemplo, es muy difícil para una persona que se encuentra pasando por alguna crisis de angustia o tristeza profunda no tener pensamientos negativos sobre sí mismo, los demás y el mundo que lo rodea. Es por todo esto que en primer lugar aprenderás técnicas de relajación que te ayuden a alcanzar un estado emocional de baja activación (en otras palabras, a sentirte tranquilo-relajado), estado que facilitará la búsqueda de pensamientos o formas de interpretación alternativas.'),
        Activity(
            id: 2,
            title: 'Relajación',
            image: 'assets/images/meditation.png',
            text:
                'Lograr estar relajados/tranquilos es un paso fundamental, tanto para lograr calmarnos ante un evento estresante como para aplicar las técnicas de modificación de pensamientos que veremos luego.'
                '\n\nEjercicios de Respiración\n\n'
                'Una de las técnicas más sencillas de relajación son los ejercicios de respiración. En general, el objetivo de los ejercicios de respiración es fomentar la respiración diafragmática, a un ritmo lento, profundo y homogéneo.\n\n'
                'Para practicar este tipo de ejercicios, uno puede sentarse cómodamente con los pies apoyados en el suelo, o recostarse en algún lugar cómodo. Luego colocamos las manos suavemente sobre el estómago, de manera que los pulgares se encuentren inmediatamente debajo de la última costilla. Ahora, la respiración debe hacerse intentando mantener el pecho y hombros tan quietos y relajados como se pueda.\n\n'
                'Al respirar, hay que imaginar que uno está llenando de aire el estómago, como si fuera un globo grande y blando; esto permitirá lograr una respiración diafragmática. Hay que recordar que en este modo de respiración la inhalación debe ser profunda, con un ritmo lento, tranquilo y suave. La exhalación también debe ser lenta, suave y relativamente pasiva. Además, cuando exhalamos el aire debe producirse una pausa hasta que la necesidad de oxígeno provoque la inhalación automática y relajada.\n\n'
                'Este ejercicio puede hacerse también recostado y variando un poco la técnica. Uno se recuesta, coloca las manos en el regazo o a un costado, y se relaja. Comenzamos a respirar con suavidad, dejando que el flujo de aire sea leve y homogéneo. Mientras respiramos cerramos los ojos y nos imaginamos en un lugar que nos haga sentir plenos, tranquilos, relajados. Nos concentramos en ese lugar, estamos ahí, sentimos el aire y percibimos el entorno imaginario que nos rodea. Intentamos hacer tan vívidas como se puedan estas imágenes de este lugar tranquilo, que nos hace sentir plenos y relajados. Mientras tanto dejamos que el flujo de aire que entra por la nariz sea tan suave y pausado como sea posible. Respiramos profundamente, y nos relajamos, dejando que el aire salga al exterior lenta y naturalmente, sin esfuerzo. Seguimos respirando de este modo, inhalando y exhalando el aire con lentitud y suavidad, a nuestro propio ritmo. Reposadamente mientras respiramos prestamos atención a la calma interna que se produce.\n\n'
                'Podemos combinar la forma anterior de respirar con inhalaciones lentas y profundas, haciendo una pequeña pausa y manteniendo el aire en nuestro interior. Luego expulsamos el aire lentamente por la boca, como si estuviéramos soplando la llama de una vela para hacer oscilar, pero sin hacer que se apague. Expulsamos la tensión junto con el aire.'),
        Activity(
          id: 3,
          title: 'Audio de relajación',
          subtitle: "Estar presentes",
          image: 'assets/images/app_meditating.png',
          text:
              'En esta actividad vamos a realizar un nuevo ejercicio para el cual te vas a guiar de un audio.',
          audio: true,
          audiofile: 'estar-presentes-practica.mp3',
        ),
      ],
      surveys: [panas(5)],
    ),
    Path(
      id: 2,
      days: 7,
      title: 'Modificación de pensamiento',
      subtitle:
          'Técnicas para lograr un pensamiento más equilibrado, refocalizar y buscar interpretaciones alternativas.',
      image: 'assets/images/two_relaxation.png',
      activities: [
        Activity(
            id: 1,
            title: 'Técnicas para lograr un pensamiento más equilibrado',
            image: 'assets/images/landscape_photographer.png',
            text:
                'La primera premisa fundamental sobre la que se basan estas técnicas es que NO es la situación o el evento lo que directamente determina cómo nos sentimos o comportamos, SINO la forma en que evaluamos, pensamos, o interpretamos esas situaciones. Por lo cual, si cambiamos la forma en que evaluamos, pensamos, o interpretamos esas situaciones, podremos modificar la forma en qué nos sentimos y comportamos ante dichas situaciones. Así, la segunda premisa en la que se basan estas técnicas es que la modificación de pensamientos disfuncionales, poco realistas o distorsionados, dará lugar a un mayor bienestar en la persona. Se entiende por pensamientos disfuncionales aquellas formas de pensar que distorsionan la realidad, producen malestar e interfieren con la habilidad de la persona para alcanzar sus objetivos. Esto nos lleva a la tercera premisa: existen múltiples formas de pensar o interpretar una situación que la persona podría adoptar. Estas formas de pensar, ideas o interpretaciones son aprendidas, no innatas, y, por lo tanto, pueden modificarse.\n\n'
                'Por ejemplo, al hacer estos ejercicios (situación o evento) puedes pensar “Esto es muy difícil, nunca lograré aprenderlo” (pensamiento) lo cual te generará un estado emocional de tristeza (emoción) y llevará a que dejes de realizar las actividades propuestas (comportamiento). Como puedes ver, no es el ejercicio en sí mismo (la situación o el evento) lo que te genera tristeza (la emoción desencadenada) y te lleva a abandonar los ejercicios (el comportamiento), sino el pensamiento que tienes respecto a los ejercicios (pensar que “Esto es muy difícil, nunca lograré aprenderlo”). Siguiendo con el ejemplo, para sentirte mejor ante esta situación podrías buscar formas alternativas de pensar la situación; por ejemplo, podrías pensar “Si bien esto me cuesta mucho ahora, si dedico un poco de tiempo cada día seguro lograré entenderlo y podré realizar luego los ejercicios sin mayores problemas”. Esta nueva forma de pensar se asociará a emociones agradables o mayor bienestar, y motivará a que continúes aprendiendo.\n\n'
                'En este contexto, es importante que tengas también presente algunas de las distorsiones de pensamiento más comunes, presentes en la mayoría de nosotras/os:\n\n'
                '• Pensamiento Todo o Nada; o Pensamiento Dicotómico: Analizar una situación mediante dos categorías (o soy totalmente útil, o soy totalmente inútil), en vez de pensarla como un continuo (puedo tener cierta dificultad pero también soy capaz de seguir haciendo ciertas cosas).\n\n'
                '• Catastrofización (Lectura negativa del Futuro): Se prevé un futuro negativo, sin considerar otros resultados más probables.\n\n'
                '• Descalificar o descontar lo positivo.\n\n'
                '• Magnificación (de lo negativo)/Minimización (de lo positivo).\n\n'
                '• Visión de Túnel: Ver solamente los aspectos negativos de una situación.\n\n'
                '• Abstracción Selectiva/Filtro Mental: Se presta mucha atención a los detalles negativos, sin tener en cuenta el panorama más amplio.\n\n'
                '• Razonamiento Emocional: Pensar que algo (una creencia, un pensamiento) tiene que ser verdad dado que “así lo siento”, ignorando, descalificando, o descontando evidencia contraria.\n\n'
                '• Etiquetamiento: Dar una definición global y rígida sobre sí mismo, los demás, alguna situación, o el futuro, sin considerar evidencia que pueda ser más razonable, más flexible, y más concreta. Por ejemplo “Soy un inútil; Ya no sirvo”.\n\n'
                '• Lectura de Mente: Se cree saber lo que las otras personas están pensando, fallando en considerar otras opciones más razonables o posibles.\n\n'
                '• Sobregeneralización: Hacer una conclusión negativa general que va mucho más allá de la situación particular.\n\n'
                '• Personalización: Creer que el comportamiento negativo de las demás personas es causado por el paciente, sin considerar explicaciones más plausibles de su comportamiento.\n\n'
                '• Afirmaciones de “Debería” o “Debo” (Imperativas/Un Mando, una Orden): Tener una idea precisa y fija respecto cómo uno o los otros deben comportarse, sobrestimando lo malo que significa que tales expectativas no se cumplan.\n\n'
                '¿Alguna de estas cosas te han pasado? Intenta reflexionar sobre esto unos minutos e intenta recordar momentos en que has pensado de alguna de estas maneras.\n\n'
                'Cada vez que identifiques algunas de estas distorsiones de pensamiento o interpretaciones similares, ten en cuenta las siguientes premisas: a- son ideas, no necesariamente son verdaderas; b- que puedes estar convencido fuertemente de estas ideas o pensamientos, hasta puedes “sentir” que son verdaderas, y, sin embargo, ser mayor o enteramente falsas o incorrectas; y c- que, siendo ideas o pensamientos, pueden ser evaluadas y modificadas. Teniendo todo esto en mente, en la próxima actividad exploraremos algunas técnicas para lograr un pensamiento más equilibrado.'),
        Activity(
          id: 2,
          title: 'Refocalización Positiva',
          image: 'assets/images/two_relaxation.png',
          text:
              'Recuerda! Para realizar la siguiente actividad debes estar relajado, te recomendamos comenzar con un ejercicio de relajación y asegúrate de lograr un estado emocional de baja activación (esto es, lograr sentirse previamente relajado y tranquilo).\n\n'
              '1. Descripción:\n\n'
              'Una de las estrategias que podemos aprender para regular nuestro estado emocional es la Refocalización Positiva (RP). Esta estrategia se basa en la idea de que encontrar algo bueno incluso en las situaciones más difíciles o adversas puede provocar respuestas emocionales diferentes (por ejemplo, pasar de sentir ansiedad a sentirse optimista). Esto significa que centrarse en cualquier aspecto positivo que se pueda encontrar en una situación puede cambiar cómo te sientes respecto a ella, pasando de un estado emocional negativo a un estado emocional positivo.\n\n'
              'Ejemplo: Por ejemplo, realizando algún curso de formación académica o profesional nos encontramos con un docente que, quizás de manera injusta, ha pedido que reelaboremos la entrega final del curso. Por supuesto, en un comienzo podemos pensar “esto es realmente injusto”, y sentirnos enojados y desanimados con el curso. Sin embargo, sentirnos así seguramente obstaculizará que reelaboremos el trabajo y que podamos culminar el cursado. En este caso, puede ser útil intentar buscar aspectos positivos que puedan rescatarse de esta situación. Por ejemplo, podríamos pensar “es una buena oportunidad para desarrollar algunos puntos del trabajo en mayor profundidad y aprender más sobre la temática”. Seguramente, al pensar en los aspectos positivos que pueden rescatarse nos sentiremos mejor y más motivados a terminar el trabajo.\n\n'
              '2. Ejercicio de Reinterpretación Positiva:\n\n'
              'Piensa en un evento reciente ante el que hayas experimentado una emoción negativa o desagradable. Aunque hay muchas maneras en que este acontecimiento puede estar afectándote negativamente en este momento, piensa en los aspectos positivos que pueden rescatarse de la situación:\n\n'
              'a. Intenta explorar las formas en que puedes crecer a partir de esta experiencia. ¿Qué lecciones, nuevos conocimientos o cambios de perspectiva te ha aportado este acontecimiento que puedan ayudarte a partir de ahora?\n\n'
              'b. Piensa en cómo la experiencia vivida ahora puede ayudarte a sentirte más fuerte o más capaz de afrontar algo similar, o incluso de afrontar nuevos retos en el futuro.\n\n'
              'c. ¿Cómo puedes aprender a relacionarte, empatizar o ayudar a otros a superar retos similares en el futuro?\n\n'
              'd. Ahora haz un esfuerzo por pensar en todos los demás beneficios potenciales, por pequeños que sean, que pueden derivarse de la experiencia vivida.\n\n'
              'Reflexiona sobre cada uno de estos puntos durante unos segundos.',
        ),
        Activity(
          id: 3,
          title: 'Reinterpretación o Interpretación Alternativa',
          image: 'assets/images/through_the_window.png',
          text: '1. Descripción:\n\n'
              'Otra de las estrategias que podemos aprender para regular nuestro estado emocional es la Reinterpretación o Interpretación Alternativa (RP). Esta estrategia se basa en la idea de que las distintas formas de interpretar o pensar una situación pueden provocar emociones diferentes. Esto significa que encontrar nuevas formas de pensar sobre una situación puede cambiar cómo te sientes respecto a ella, pasando de un estado emocional negativo a un estado emocional positivo.\n\n'
              'Ejemplo: Practicando algún deporte con amigos podemos cometer alguna falla (por ejemplo, errar a la pelota y perder un punto o el partido). Ante esto podemos pensar “soy un inútil para los deportes, no sé para qué sigo viniendo”. Interpretar así la situación seguramente nos hará sentir tristes y enojados con nosotros mismos. Esto último hará que muy probablemente dejemos de ir a jugar a este deporte con nuestros amigos. En cambio, si pensamos que “fallar es parte del juego, y lo importante es identificar en qué nos equivocamos e intentar mejorar aceptando nuestras limitaciones” seguramente nos sentiremos mejor con nosotros mismos y sigamos practicando este deporte con nuestros amigos.\n\n'
              '2. Ejercicio de Reinterpretación:\n\n'
              'Piensa en un evento reciente ante el que hayas experimentado una emoción negativa o desagradable. Aunque hay muchas maneras en que este acontecimiento puede estar afectándote negativamente en este momento, intenta encontrarle nuevas interpretaciones a lo sucedido. La pregunta central que debes hacerte aquí es: ¿Puede haber un punto de vista alternativo para interpretar lo sucedido? Otros ejercicios que pueden ayudarte:\n\n'
              'a. Ante un evento negativo muchas veces concluimos que se trata de una situación muy grave que tiene consecuencias nefastas para nosotros o nuestros allegados. Piensa: ¿es una situación realmente tan grave? Intenta una forma alternativa de pensar la situación que te ayuda a relativizar (visualizar como menos catastrófico o grave) lo sucedido. Para ayudarte a obtener una visión más realista del asunto puedes hacerte, consecutivamente, las siguientes preguntas: a- ¿Qué es lo peor que podría pasar? ¿Podría vivir con eso?, b- ¿Qué sería lo mejor que podría pasar?, y c- ¿Qué resultados serían más realistas?\n\n'
              'Reflexiona sobre esto durante unos segundos.\n\n'
              'b. Ante un evento negativo muchas veces concluimos que TODO está mal, que TODO terminará de la peor manera, que nosotros no servimos para NADA o los demás no sirven para NADA ¿Puedes pensar en evidencia o situaciones que contradigan este tipo de conclusiones categóricas (de TODO o NADA) sobre el evento? Has un esfuerzo por buscar formas de pensar alternativas que sean más equilibradas, realistas y justas con lo sucedido. Aquí suele ayudar buscar matices en la interpretación de las situaciones que nos permitan arribar a una conclusión menos categórica: es poco probable que las cosas sean o TOTALMENTE NEGRAS o TOTALMENTE BLANCAS, seguro podremos encontrar matices de grises intermedios entre estos dos polos de pensamiento. Para ayudarte a obtener una visión más realista del asunto puedes hacerte, consecutivamente, las siguientes preguntas: a- ¿Qué evidencia tengo a favor de esta interpretación o pensamiento?, y b- ¿Qué evidencia hay que contradiga esta idea o pensamiento?\n\n'
              'Reflexiona sobre esto durante unos segundos.\n\n'
              'c. Otro ejercicio útil cuando nos enfrentamos a una situación desagradable es pensar qué le diríamos a un amigo que se encontrara en la misma situación ¿cuál sería tu consejo? Muchas veces nos resulta más fácil encontrar formas de pensamiento más equilibrados (menos catastróficas y menos categóricas -de TODO o NADA-) cuando hacemos el ejercicio de pensar qué le recomendaríamos a un amigo o ser querido que estuviera pasando una situación similar. Otras preguntas que puedes hacerte en este sentido: ¿Qué tipo de pensamiento tendría un amigo/familiar en una situación semejante? ¿Qué le dirías a un amigo/familiar si en una situación similar tuviera ese pensamiento?\n\n'
              'Reflexiona sobre esto durante unos segundos.',
        ),
      ],
      surveys: [
        panas(6),
        cerq(7),
        gad(8),
        phq(9),
      ],
    ),
  ];

  List<Path> get items {
    return [..._items];
  }

  DateTime get startdate => _userStartdate;

  String get username => _username;

  Path findById(int id) {
    return _items.firstWhere((route) => route.id == id);
  }

  Path findByPathname(String pathname) {
    return _items.firstWhere((route) => route.title == pathname);
  }

  void fetchdata() async {
    User user = _firebaseAuth.currentUser!;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get()
        .then((userData) {
      _username = userData.data()!['username'];
      _userStartdate = userData.data()!['startdate'].toDate();
      _items[0].startdate = DateUtils.dateOnly(_userStartdate);
      _items[1].startdate =
          DateUtils.dateOnly(_userStartdate).add(const Duration(days: 7));
      notifyListeners();
    });
  }

  void cleandata() {
    _username = "";
    for (int i = 0; i < _items.length; i++) {
      for (int j = 0; j < _items[i].surveys!.length; j++) {
        _items[i].surveys![j].clearDoneState();
      }
    }
  }
}
