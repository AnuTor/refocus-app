import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './screens/auth_screen.dart';
import './screens/tabs_screen.dart';
import './screens/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> initialization = Firebase.initializeApp();

    return FutureBuilder(
        // Initialize FlutterFire:
        future: initialization,
        builder: (context, appSnapshot) {
          
          return MaterialApp(
            title: 'Refocus App',
            theme: ThemeData(
              fontFamily: 'Raleway',
              brightness: Brightness.light,
              primarySwatch: Colors.lightBlue,
              appBarTheme: const AppBarTheme(
                foregroundColor: Colors.white,
              ),
              textTheme: const TextTheme(
                headline6: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
            ),
            home: appSnapshot.connectionState != ConnectionState.done
                ? const SplashScreen()
                : StreamBuilder(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (ctx, userSnapshot) {
                      if (userSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const SplashScreen();
                      }
                      if (userSnapshot.hasData) {
                        return const TabsScreen();
                      }
                      return const AuthScreen();
                    }),
            onUnknownRoute: (settings) {
              return MaterialPageRoute(
                builder: (ctx) => const AuthScreen(),
              );
            },
          );
        });
  }
}
