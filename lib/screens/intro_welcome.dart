import 'package:flutter/material.dart';
import 'package:refocus/screens/intro_screen.dart';

class IntroWelcome extends StatefulWidget {
  static const routeName = '/intro-welcome';
  const IntroWelcome({Key? key}) : super(key: key);

  @override
  State<IntroWelcome> createState() => _IntroWelcomeState();
}

class _IntroWelcomeState extends State<IntroWelcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const SizedBox(height: 20),
              Text(
                '¡Bienvenido/a a ReFocus!',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              Text(
                'Para poder registrarte en la plataforma necesitamos que completes dos breves cuestionarios.\n\n'
                'El propósito de los mismos será determinar tu estado de ánimo general al momento de comenzar a utilizar la aplicación y nos permitirán realizar un seguimiento comparativo con cuestionarios futuros.\n\n'
                'Una vez completados estos cuestionarios podrás acceder a la ventana de registro para crear tu cuenta y comenzar a utilizar la app.\n\n'
                'Al presionar en \'Aceptar\' estarás dando tu consentimiento para participar de este estudio y para que se recopilen y registren datos de uso de la app y de las respuestas a los respectivos cuestionarios. Recuerda que no se recopilan datos personales y que se respetará el anonimato de las respuestas.\n\n',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              InkWell(
                onTap: () =>
                    Navigator.of(context).pushNamed(IntroScreen.routeName),
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: const Text(
                    'Aceptar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
