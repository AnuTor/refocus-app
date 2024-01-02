import 'package:flutter/material.dart';
import 'package:refocus/screens/intro_screen.dart';

class IntroWelcome extends StatefulWidget {
  static const routeName = '/intro-welcome';
  const IntroWelcome({super.key});

  @override
  State<IntroWelcome> createState() => _IntroWelcomeState();
}

class _IntroWelcomeState extends State<IntroWelcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              '¡Bienvenido a ReFocus!',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            Text(
              'Antes de continuar con el registro dentro de la plataforma, le pedimos que complete dos cuestionarios.\n\n'
              'Estos cuestionarios servirán para determinar el estado base de bienestar sobre el cual luego poder realizar un seguimiento con cuestionarios futuros.\n\n'
              'Luego de realizar estos cuestionarios, podrá proceder a la ventana de registro en la cual luego de colocar sus datos podrá hacer uso de la plataforma.\n\n'
              '¡Bienvenido!',
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
                  'Comenzar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
