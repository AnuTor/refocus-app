import 'package:flutter/material.dart';

import './activity.dart';
import './path.dart';

class Routes with ChangeNotifier {
  final List<Path> _items = [
    Path(
        id: 1,
        days: 10,
        startdate: DateTime(2023, 01, 01),
        title: 'Relajación',
        subtitle:
            'Se describe en qué consiste la relajación y sus beneficios asociados. Escribo mas texto para ver como se corta',
        image:
            'https://www.stroke.org/-/media/Feature/Promo/QuizSnack/undraw_Meditation_re_gll0.jpg?h=483&w=700&hash=BB23470361B6F5F0E12990F4FEDF8718',
        activities: [
          Activity(
              id: 1,
              title: 'Presentación',
              image:
                  'https://www.stroke.org/-/media/Feature/Promo/QuizSnack/undraw_Meditation_re_gll0.jpg?h=483&w=700&hash=BB23470361B6F5F0E12990F4FEDF8718',
              text:
                  'Día a día nos enfrentamos a diferentes eventos estresantes. Los eventos estresantes son situaciones que desencadenan en nosotros emociones negativas o desagradables como ansiedad, tristeza, miedo o irritabilidad. Si bien las emociones negativas son útiles para identificar situaciones potencialmente dañinas y atender a ellas, muchas veces nos desbordan y obstaculizan en nuestros quehaceres u objetivos diarios. Afortunadamente, existen estrategias que podemos aprender para manejar la respuesta emocional que experimentamos ante un evento dado. Aquí aprenderás a cambiar tu forma de pensar o interpretar la situación y verás que, de esta forma, puedes regular tu estado emocional. En otras palabras, si cambias la forma de pensar sobre la situación podrás cambiar la forma en que ese evento te impacta emocionalmente, ya sea disminuyendo la intensidad de la emoción experimentada (por ejemplo, no sintiendo tanta ansiedad) o logrando experimentar otra emoción distinta (por ejemplo, pasando de una emoción de angustia a una emoción agradable de tranquilidad). Es sabido también que es más dificultoso cambiar la forma de pensar o buscar formas de pensar alternativas cuando uno se encuentra bajo un estado emocional intenso. Por ejemplo, es muy difícil para una persona que se encuentra pasando por alguna crisis de angustia o tristeza profunda no tener pensamientos negativos sobre sí mismo, los demás y el mundo que lo rodea. Es por todo esto que en primer lugar aprenderás técnicas de relajación que te ayuden a alcanzar un estado emocional de baja activación (en otras palabras, a sentirte tranquilo-relajado), estado que facilitará la búsqueda de pensamientos o formas de interpretación alternativas.'
          ),
          Activity(
              id: 2,
              title: 'Relajación',
              image:
                  'https://www.stroke.org/-/media/Feature/Promo/QuizSnack/undraw_Meditation_re_gll0.jpg?h=483&w=700&hash=BB23470361B6F5F0E12990F4FEDF8718',
              text:
                  'Lograr estar relajados/tranquilos es un paso fundamental, tanto para lograr calmarnos ante un evento estresante como para aplicar las técnicas de modificación de pensamientos que veremos luego.'
                  '\n\nEjercicios de Respiración\n\n'
                  'Una de las técnicas más sencillas de relajación son los ejercicios de respiración. En general, el objetivo de los ejercicios de respiración es fomentar la respiración diafragmática, a un ritmo lento, profundo y homogéneo.\n\n'
                  'Para practicar este tipo de ejercicios, uno puede sentarse cómodamente con los pies apoyados en el suelo, o recostarse en algún lugar cómodo. Luego colocamos las manos suavemente sobre el estómago, de manera que los pulgares se encuentren inmediatamente debajo de la última costilla. Ahora, la respiración debe hacerse intentando mantener el pecho y hombros tan quietos y relajados como se pueda.\n\n'
                  'Al respirar, hay que imaginar que uno está llenando de aire el estómago, como si fuera un globo grande y blando; esto permitirá lograr una respiración diafragmática. Hay que recordar que en este modo de respiración la inhalación debe ser profunda, con un ritmo lento, tranquilo y suave. La exhalación también debe ser lenta, suave y relativamente pasiva. Además, cuando exhalamos el aire debe producirse una pausa hasta que la necesidad de oxígeno provoque la inhalación automática y relajada.\n\n'
                  'Este ejercicio puede hacerse también recostado y variando un poco la técnica. Uno se recuesta, coloca las manos en el regazo o a un costado, y se relaja. Comenzamos a respirar con suavidad, dejando que el flujo de aire sea leve y homogéneo. Mientras respiramos cerramos los ojos y nos imaginamos en un lugar que nos haga sentir plenos, tranquilos, relajados. Nos concentramos en ese lugar, estamos ahí, sentimos el aire y percibimos el entorno imaginario que nos rodea. Intentamos hacer tan vívidas como se puedan estas imágenes de este lugar tranquilo, que nos hace sentir plenos y relajados. Mientras tanto dejamos que el flujo de aire que entra por la nariz sea tan suave y pausado como sea posible. Respiramos profundamente, y nos relajamos, dejando que el aire salga al exterior lenta y naturalmente, sin esfuerzo. Seguimos respirando de este modo, inhalando y exhalando el aire con lentitud y suavidad, a nuestro propio ritmo. Reposadamente mientras respiramos prestamos atención a la calma interna que se produce.\n\n'
                  'Podemos combinar la forma anterior de respirar con inhalaciones lentas y profundas, haciendo una pequeña pausa y manteniendo el aire en nuestro interior. Luego expulsamos el aire lentamente por la boca, como si estuviéramos soplando la llama de una vela para hacer oscilar, pero sin hacer que se apague. Expulsamos la tensión junto con el aire.'
          )
        ]
    ),
    Path(
        id: 2,
        days: 6,
        startdate: DateTime(2023, 01, 01 + 11),
        title: 'Evocación de eventos positivos',
        subtitle:
            'Se describe en qué consiste la evocación de eventos positivos y sus beneficios asociados.',
        image:
            'https://www.stroke.org/-/media/Feature/Promo/QuizSnack/undraw_fitness_stats_sht6.jpg?h=515&w=740&hash=943528F20E83D48E8CDF437359001DE7',
        activities: [
          Activity(
              id: 1,
              title: 'Técnicas para lograr un pensamiento más equilibrado',
              image:
                  'https://www.stroke.org/-/media/Feature/Promo/QuizSnack/undraw_fitness_stats_sht6.jpg?h=515&w=740&hash=943528F20E83D48E8CDF437359001DE7',
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
                  '¿Alguna de estas cosas te han pasado? Intenta reflexionar sobre esto unos minutos e intenta recordar momentos en que has pensado de alguna de estas maneras.'
          ),
          Activity(
              id: 2,
              title: 'Evocación de eventos positivos',
              image:
                  'https://www.stroke.org/-/media/Feature/Promo/QuizSnack/undraw_fitness_stats_sht6.jpg?h=515&w=740&hash=943528F20E83D48E8CDF437359001DE7',
              text: 'texto'
          )
        ]
    ),
    Path(
        id: 3,
        days: 7,
        startdate: DateTime(2023, 01, 01 + 18),
        title: 'Reinterpretación Positiva',
        subtitle:
            'Se describe en qué consiste la evocación de eventos positivos y sus beneficios asociados.',
        image:
            'https://www.goredforwomen.org/-/media/Feature/Promo/QuizSnack/undraw_sleep_analysis_o5f9.jpg?h=554&w=700&hash=C45FA7B3B72899FD8F78EAAE7C8701CE',
        activities: [
          Activity(
              id: 1,
              title: 'Reinterpretación Positiva',
              image:
                  'https://www.stroke.org/-/media/Feature/Promo/QuizSnack/undraw_Meditation_re_gll0.jpg?h=483&w=700&hash=BB23470361B6F5F0E12990F4FEDF8718',
              text: 'texto'
          ),
          Activity(
              id: 2,
              title: 'Reinterpretación Positiva',
              image:
                  'https://www.stroke.org/-/media/Feature/Promo/QuizSnack/undraw_Meditation_re_gll0.jpg?h=483&w=700&hash=BB23470361B6F5F0E12990F4FEDF8718',
              text: 'texto'
          )
        ]
    ),
  ];
  // var _showFavoritesOnly = false;

  List<Path> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

//  List<RouteElement> get favoriteItems {
//    return _items.where((prodItem) => prodItem.isFavorite).toList();
//  }

  Path findById(int id) {
    return _items.firstWhere((route) => route.id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
