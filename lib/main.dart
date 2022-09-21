import 'package:flutter/material.dart';

import './screens/tabs_screen.dart';
import './screens/start_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      fontFamily: 'Raleway',
    );

    return MaterialApp(
      title: 'Refocus App',
      theme: theme.copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.lightBlue,
        ).copyWith(
          secondary: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(
              fontSize: 21,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
            )),
      ),
      routes: {
        '/': (ctx) => const TabsScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => const StartScreen(),
        );
      },
    );
  }
}
