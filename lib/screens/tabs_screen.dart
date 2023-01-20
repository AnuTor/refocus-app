import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './routes_screen.dart';
import './profile_screen.dart';
import './tools_screen.dart';
import './main_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': const MainScreen(),
        'title': 'Inicio',
      },
      {
        'page': const RoutesScreen(),
        'title': 'Rutas',
      },
      {
        'page': const ToolsScreen(),
        'title': 'Herramientas',
      },
      {
        'page': const ProfileScreen(),
        'title': 'Perfil',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
        actions: [
          _selectedPageIndex == 3
              ? DropdownButton(
                  underline: Container(),
                  icon: Icon(
                    Icons.more_vert,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  items: [
                    DropdownMenuItem(
                      value: 'logout',
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.exit_to_app,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          const SizedBox(width: 8),
                          const Text('Cerrar sesión'),
                        ],
                      ),
                    ),
                  ],
                  onChanged: (itemIdentifier) {
                    if (itemIdentifier == 'logout') {
                      FirebaseAuth.instance.signOut();
                    }
                  },
                )
              : IconButton(
                  icon: Icon(
                    Icons.star,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () {},
                ),
        ],
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.white,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.rocket_outlined),
            activeIcon: const Icon(Icons.rocket),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.route_outlined),
            activeIcon: const Icon(Icons.route),
            label: 'Rutas',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.build_outlined),
            activeIcon: const Icon(Icons.build),
            label: 'Herramientas',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.person_outline),
            activeIcon: const Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
