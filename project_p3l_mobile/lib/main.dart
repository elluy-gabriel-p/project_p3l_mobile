import 'package:flutter/material.dart';
import 'presensi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
          backgroundColor: Colors.deepPurple,
        ),
        body: Center(
          child: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            padding: const EdgeInsets.all(10),
            children: <Widget>[
              Card(
                color: Colors.amber,
                child: InkWell(
                  onTap: () {
                   Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PresensiPage()),
                    );
                  },
                  child: const Center(
                    child: Icon(Icons.fingerprint, size: 70, color: Colors.white),
                  ),
                ),
              ),
              Card(
                color: Colors.green,
                child: InkWell(
                  onTap: () {
                  },
                  child: const Center(
                    child: Icon(Icons.mail, size: 70, color: Colors.white),
                  ),
                ),
              ),
              Card(
                color: Colors.blue,
                child: InkWell(
                  onTap: () {
                  },
                  child: const Center(
                    child: Icon(Icons.phone, size: 70, color: Colors.white),
                  ),
                ),
              ),
              Card(
                color: Colors.red,
                child: InkWell(
                  onTap: () {
                  },
                  child: const Center(
                    child: Icon(Icons.logout, size: 70, color: Colors.white),
                  ),
                ),
              ),
              Card(
                color: Colors.purple,
                child: InkWell(
                  onTap: () {
                  },
                  child: const Center(
                    child: Icon(Icons.book, size: 70, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.deepPurple,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
