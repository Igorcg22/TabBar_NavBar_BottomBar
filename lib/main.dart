import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// utilizei a documentação para fazer: https://api.flutter.dev/flutter/material/NavigationBar-class.html e https://api.flutter.dev/flutter/material/TabBar-class.html

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  
  int _bottomNavIndex = 0;

  final List<Color> _bgColors = [
    const Color.fromARGB(255, 0, 0, 255),
    const Color.fromARGB(255, 0, 255, 0),
    const Color.fromARGB(255, 255, 255, 0),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: _bgColors[_bottomNavIndex],
        
        appBar: AppBar(
          title: const Text('Navegação Independente'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.cloud_outlined), text: 'Top 1'),
              Tab(icon: Icon(Icons.beach_access), text: 'Top 2'),
              Tab(icon: Icon(Icons.brightness_5), text: 'Top 3'),
            ],
          ),
        ),

        body: const TabBarView(
          children: [
            Center(child: Text("Aba 1")),
            Center(child: Text("Aba 2")),
            Center(child: Text("Aba 3")),
          ],
        ),

        bottomNavigationBar: NavigationBar(
          selectedIndex: _bottomNavIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _bottomNavIndex = index;
            });
          },
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: 'Azul',
            ),

            NavigationDestination(
              icon: Icon(Icons.eco_outlined),
              label: 'Verde',
            ),

            NavigationDestination(
              icon: Icon(Icons.wb_sunny_outlined),
              label: 'amarelo',
            ),
          ],
        ),
      ),
    );
  }
}