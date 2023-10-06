import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './activity.dart';
import './path.dart';
import '../tests/cerq.dart';
import '../tests/panas.dart';

class Routes with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String _username = "";
  DateTime _userStartdate = DateTime.now();
  final List<Path> _items = [
    Path(
      id: 1,
      days: 7,
      title: 'Relajación',
      subtitle:
          'Técnicas que te ayudarán a alcanzar un estado emocional de baja activación, a sentirte más tranquilo y relajado.',
      image: 'assets/images/relaxing_at_home.png',
      activities: [
        Activity(
          id: 1,
          title: 'Presentación',
          subtitle: 'Introducción a ReFocus',
          image: 'assets/images/welcome.png',
          text:
              'Antes de comenzar con las actividades de relajación queremos darte la bienvenida a ReFocus. '
              'Día a día nos enfrentamos a diferentes eventos estresantes, afortunadamente, existen estrategias que podemos aprender para manejar la respuesta emocional que experimentamos ante un evento dado. '
              'Nuestra aplicación ha sido cuidadosamente diseñada para proporcionarte de herramientas y técnicas que te ayudarán a sobrellevar estas situaciones y a regular tu estado emocional.\n\n'
              'Te invitamos a escuchar un breve audio de presentación en el que profundizamos sobre los objetivos y contenidos de la aplicación. Que lo disfrutes.',
          audio: true,
          audiofile: '1_intro.m4a',
        ),
        Activity(
            id: 2,
            title: 'Relajación 1',
            subtitle: 'Introducción a la relajación',
            image: 'assets/images/meditation.png',
            text:
                'Una de las técnicas más sencillas de relajación son los ejercicios de respiración. En general, el objetivo de los ejercicios de respiración es fomentar la respiración diafragmática, a un ritmo lento, profundo y homogéneo.\n\n'
                'Para practicar este tipo de ejercicios, uno puede sentarse cómodamente con los pies apoyados en el suelo, o recostarse en algún lugar cómodo. Luego colocamos las manos suavemente sobre el estómago, de manera que los pulgares se encuentren inmediatamente debajo de la última costilla. Ahora, la respiración debe hacerse intentando mantener el pecho y hombros tan quietos y relajados como se pueda.\n\n'
                'Al respirar, hay que imaginar que uno está llenando de aire el estómago, como si fuera un globo grande y blando; esto permitirá lograr una respiración diafragmática. Hay que recordar que en este modo de respiración la inhalación debe ser profunda, con un ritmo lento, tranquilo y suave. La exhalación también debe ser lenta, suave y relativamente pasiva. Además, cuando exhalamos el aire debe producirse una pausa hasta que la necesidad de oxígeno provoque la inhalación automática y relajada.\n\n'
                'Este ejercicio puede hacerse también recostado y variando un poco la técnica. Uno se recuesta, coloca las manos en el regazo o a un costado, y se relaja. Comenzamos a respirar con suavidad, dejando que el flujo de aire sea leve y homogéneo. Mientras respiramos cerramos los ojos y nos imaginamos en un lugar que nos haga sentir plenos, tranquilos, relajados. Nos concentramos en ese lugar, estamos ahí, sentimos el aire y percibimos el entorno imaginario que nos rodea. Intentamos hacer tan vívidas como se puedan estas imágenes de este lugar tranquilo, que nos hace sentir plenos y relajados. Mientras tanto dejamos que el flujo de aire que entra por la nariz sea tan suave y pausado como sea posible. Respiramos profundamente, y nos relajamos, dejando que el aire salga al exterior lenta y naturalmente, sin esfuerzo. Seguimos respirando de este modo, inhalando y exhalando el aire con lentitud y suavidad, a nuestro propio ritmo. Reposadamente mientras respiramos prestamos atención a la calma interna que se produce.\n\n'
                'Podemos combinar la forma anterior de respirar con inhalaciones lentas y profundas, haciendo una pequeña pausa y manteniendo el aire en nuestro interior. Luego expulsamos el aire lentamente por la boca, como si estuviéramos soplando la llama de una vela para hacer oscilar, pero sin hacer que se apague. Expulsamos la tensión junto con el aire.',
            audio: true,
            audiofile: '2_intro_relajacion.m4a',
            reversed: true),
        Activity(
          id: 3,
          title: 'Relajación 2',
          subtitle: "Relajación progresiva",
          image: 'assets/images/app_meditating.png',
          text:
              'En esta actividad, vamos a practicar la relajación progresiva de todo el cuerpo con la guía de un audio para acompañarte en el proceso.\n'
              'Necesitamos para esta actividad encontrar un espacio en el que podamos estar cómodos y quietos, tanto sentados como acostados.',
          audio: true,
          audiofile: 'meditacion 1 Biota.m4a',
        ),
        Activity(
          id: 4,
          title: 'Relajación 3',
          subtitle: "Entrenamiento autógeno",
          image: 'assets/images/app_meditating.png',
          text:
              'En esta actividad, vamos a practicar la relajación basada en el entrenamiento autógeno con la guía de un audio para acompañarte en el proceso.\n'
              'Necesitamos para esta actividad encontrar un espacio en el que podamos estar cómodos y quietos, tanto sentados como acostados.',
          audio: true,
          audiofile: 'meditacion 2 Biota.m4a',
        ),
        Activity(
          id: 5,
          title: 'Relajación 4',
          subtitle: "Respiración",
          image: 'assets/images/app_meditating.png',
          text:
              'En esta actividad, vamos a practicar la relajación basada en la respiración con la guía de un audio para acompañarte en el proceso.\n'
              'Necesitamos para esta actividad encontrar un espacio en el que podamos estar cómodos y quietos, tanto sentados como acostados.',
          audio: true,
          audiofile: 'meditacion 3 Biota.m4a',
        ),
        Activity(
          id: 6,
          title: 'Relajación 5',
          subtitle: "Atención focalizada en la música",
          image: 'assets/images/app_meditating.png',
          text:
              'En esta actividad, vamos a practicar la relajación mediante la atención focalizada en la música con la guía de un audio para acompañarte en el proceso.\n'
              'Necesitamos para esta actividad encontrar un espacio en el que podamos estar cómodos y quietos, tanto sentados como acostados.',
          audio: true,
          audiofile: 'meditacion 4 Biota.m4a',
        ),
        Activity(
          id: 7,
          title: 'Relajación 6',
          subtitle: "Movimiento consciente",
          image: 'assets/images/app_meditating.png',
          text:
              'En esta actividad, vamos a practicar la relajación mediante el movimiento consciente de todo el cuerpo con la guía de un audio para acompañarte en el proceso.\n'
              'Necesitamos para esta actividad encontrar un espacio en el podamos estar sentados comodamente, con la planta de los pies en el suelo.',
          audio: true,
          audiofile: 'meditacion 5 Biota.m4a',
        ),
        Activity(
          id: 8,
          title: 'Relajación 7',
          subtitle: "Visualización creativa",
          image: 'assets/images/app_meditating.png',
          text:
              'En esta actividad, vamos a practicar la relajación mediante la visualización creativa con la guía de un audio para acompañarte en el proceso.\n'
              'Necesitamos para esta actividad encontrar un espacio en el podamos estar sentados comodamente, con la planta de los pies en el suelo.',
          audio: true,
          audiofile: 'meditacion 6 Biota.m4a',
        ),
        Activity(
          id: 8,
          title: 'Relajación 8',
          subtitle: "Estar presentes",
          image: 'assets/images/app_meditating.png',
          text:
              'En esta actividad vamos a practicar la relajación con la guía de un audio para acompañarte en el proceso.',
          audio: true,
          audiofile: '3_practica_relajacion.mp3',
        ),
      ],
      surveys: [panas(3)],
    ),
    Path(
      id: 2,
      days: 9,
      title: 'Modificación de pensamiento',
      subtitle:
          'Técnicas para lograr un pensamiento más equilibrado, refocalizar y buscar interpretaciones alternativas.',
      image: 'assets/images/art_museum.png',
      activities: [
        Activity(
          id: 1,
          title: 'Modificación de pensamiento',
          subtitle: 'Introducción y ejemplos',
          image: 'assets/images/landscape_photographer.png',
          text: 'Bienvenidos a la ruta de modificación de pensamiento. '
              'Cuando experimentamos un evento en nuestras vidas, no es este evento lo que directamente determina cómo nos sentimos o comportamos, sino la forma en que evaluamos, pensamos, o interpretamos esas situaciones.\n\n'
              'En esta sección, se presentarán técnicas para lograr un pensamiento equilibrado, junto a algunos ejemplos y ejercicios para comprender mejor dichas técnicas. '
              'Te invitamos a escuchar el siguiente audio para comenzar con el recorrido.',
          audio: true,
          audiofile: '4_intro_mod_pensamiento_ejemplos.m4a',
        ),
        Activity(
            id: 2,
            title: 'Refocalización positiva',
            subtitle: 'Introducción y ejemplo',
            image: 'assets/images/both_sides.png',
            text:
                'A continuación te presentamos un ejercicio de refocalización positiva. Recuerda! Antes de realizarlo debes estar relajado, por lo que te recomendamos comenzar con un ejercicio de relajación para lograr un estado emocional de baja activación (esto es, lograr sentirte relajado y tranquilo).\n\n'
                'Piensa en un evento reciente ante el que hayas experimentado una emoción negativa o desagradable. Aunque hay muchas maneras en que este acontecimiento puede estar afectándote negativamente en este momento, piensa en los aspectos positivos que pueden rescatarse de la situación:\n\n'
                'a. Intenta explorar las formas en que puedes crecer a partir de esta experiencia. ¿Qué lecciones, nuevos conocimientos o cambios de perspectiva te ha aportado este acontecimiento que puedan ayudarte a partir de ahora?\n\n'
                'b. Piensa en cómo la experiencia vivida ahora puede ayudarte a sentirte más fuerte o más capaz de afrontar algo similar, o incluso de afrontar nuevos retos en el futuro.\n\n'
                'c. ¿Cómo puedes aprender a relacionarte, empatizar o ayudar a otros a superar retos similares en el futuro?\n\n'
                'd. Ahora has un esfuerzo por pensar en todos los demás beneficios potenciales, por pequeños que sean, que pueden derivarse de la experiencia vivida.',
            audio: true,
            audiofile: '5_intro_refocalizacion_ejemplo.m4a',
            reversed: true),
        Activity(
            id: 3,
            title: 'Reinterpretación 1',
            subtitle: 'Introducción y ejemplo',
            image: 'assets/images/soccer.png',
            text:
                'A continuación te presentamos un ejercicio de reinterpretación. Recuerda! Antes de realizarlo debes estar relajado, por lo que te recomendamos comenzar con un ejercicio de relajación.\n\n'
                'Piensa en un evento reciente ante el que hayas experimentado una emoción negativa o desagradable. Aunque hay muchas maneras en que este acontecimiento puede estar afectándote negativamente en este momento, intenta encontrarle nuevas interpretaciones a lo sucedido. La pregunta central que debes hacerte aquí es: ¿Puede haber un punto de vista alternativo para interpretar lo sucedido?\n\n'
                'Ante un evento negativo muchas veces concluimos que se trata de una situación muy grave que tiene consecuencias nefastas para nosotros o nuestros allegados. '
                'Piensa: ¿es una situación realmente tan grave? Intenta una forma alternativa de pensar la situación que te ayude a relativizar (visualizar como menos catastrófico o grave) lo sucedido. Para ayudarte a obtener una visión más realista del asunto puedes hacerte, consecutivamente, las siguientes preguntas:\n\n'
                'a. ¿Qué es lo peor que podría pasar? ¿Podría vivir con eso?\n\n'
                'b. ¿Qué sería lo mejor que podría pasar?\n\n'
                'c. ¿Qué resultados serían más realistas?',
            audio: true,
            audiofile: '6_intro_reinterpretacion_ejemplo.m4a',
            reversed: true),
        Activity(
          id: 4,
          title: 'Reinterpretación 2',
          subtitle: 'Ejemplo',
          image: 'assets/images/random_thoughts.png',
          text:
              'Veamos otro ejercicio que nos puede ayudar a realizar una interpretación alternativa.\n\n'
              'Ante un evento negativo muchas veces concluimos que TODO está mal, que TODO terminará de la peor manera, que nosotros no servimos para NADA o los demás no sirven para NADA ¿Puedes pensar en evidencia o situaciones que contradigan este tipo de conclusiones categóricas (de TODO o NADA) sobre el evento? Haz un esfuerzo por buscar formas de pensar alternativas que sean más equilibradas, realistas y justas con lo sucedido. Aquí suele ayudar buscar matices en la interpretación de las situaciones que nos permitan arribar a una conclusión menos categórica: es poco probable que las cosas sean o TOTALMENTE NEGRAS o TOTALMENTE BLANCAS, seguro podremos encontrar matices de grises intermedios entre estos dos polos de pensamiento. Para ayudarte a obtener una visión más realista del asunto puedes hacerte, consecutivamente, las siguientes preguntas:\n\n'
              'a. ¿Qué evidencia tengo a favor de esta interpretación o pensamiento?\n\n'
              'b. ¿Qué evidencia hay que contradiga esta idea o pensamiento?',
        ),
        Activity(
            id: 5,
            title: 'Reinterpretación 3',
            subtitle: 'Ejemplo',
            image: 'assets/images/two_relaxation.png',
            text:
                'Otro ejercicio útil cuando nos enfrentamos a una situación desagradable es pensar qué le diríamos a un amigo que se encontrara en la misma situación ¿cuál sería tu consejo?\n\n'
                'Muchas veces nos resulta más fácil encontrar formas de pensamiento más equilibrados (menos catastróficas y menos categóricas -de TODO o NADA-) cuando hacemos el ejercicio de pensar qué le recomendaríamos a un amigo o ser querido que estuviera pasando una situación similar. Otras preguntas que puedes hacerte en este sentido: '
                '¿Qué tipo de pensamiento tendría un amigo/familiar en una situación semejante? '
                '¿Qué le dirías a un amigo/familiar si en una situación similar tuviera ese pensamiento?')
      ],
      surveys: [
        panas(4),
        cerq(5),
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
