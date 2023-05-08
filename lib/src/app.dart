import 'package:bb_stats/src/providers/isar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'screens/home.dart';
import 'screens/game.dart';
import 'screens/history.dart';
import 'screens/menu.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.isar,
  });
  final Isar isar;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        isarProvider.overrideWithValue(isar),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyStatefulWidget(),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({
    super.key,
  });

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  final _screens = [
    const HomeScreen(),
    const GameScreen(),
    const HistoryScreen(),
    const MenuScreen(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
            BottomNavigationBarItem(icon: Icon(Icons.sports_basketball), label: 'GAME'),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: 'HISTORY'),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'MENU'),
          ],
          type: BottomNavigationBarType.fixed,
        ));
  }
}