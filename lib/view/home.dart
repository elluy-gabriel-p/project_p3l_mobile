import 'package:flutter/material.dart';
import 'package:project_p3l_mobile/data/User.dart';
import 'package:project_p3l_mobile/view/login.dart';
import 'package:project_p3l_mobile/view/presensi.dart';
import 'package:project_p3l_mobile/view/profile.dart';
import 'package:project_p3l_mobile/view/produk.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
          backgroundColor: Colors.deepPurple,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
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
                            MaterialPageRoute(
                                builder: (context) => const PresensiPage()),
                          );
                        },
                        child: const Center(
                          child: Icon(Icons.fingerprint,
                              size: 70, color: Colors.white),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.cyan,
                      child: InkWell(
                        onTap: () {},
                        child: const Center(
                          child:
                              Icon(Icons.mail, size: 70, color: Colors.white),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.blue,
                      child: InkWell(
                        onTap: () {},
                        child: const Center(
                          child:
                              Icon(Icons.phone, size: 70, color: Colors.white),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.green,
                      child: InkWell(
                        onTap: () {
                          // Handle logout tap
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginView()),
                          );
                        },
                        child: const Center(
                          child:
                              Icon(Icons.login, size: 70, color: Colors.white),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.purple,
                      child: InkWell(
                        onTap: () {},
                        child: const Center(
                          child:
                              Icon(Icons.book, size: 70, color: Colors.white),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.red,
                      child: InkWell(
                        onTap: () {
                          // Handle logout tap
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginView()),
                          );
                        },
                        child: const Center(
                          child:
                              Icon(Icons.logout, size: 70, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Image.network('https://via.placeholder.com/400x200',
                  width: double.infinity),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'Delicious pasta with a rich tomato sauce, garnished with fresh basil.'),
              ),
              Image.network('https://via.placeholder.com/400x200',
                  width: double.infinity),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'A classic cheeseburger with lettuce, tomato, and a side of fries.'),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.breakfast_dining_rounded),
              label: 'Produk',
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
          currentIndex: 1,
          onTap: (index) {
            if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            } else if (index == 0) {
              // Handle logout tap
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProdukPage()),
              );
            }
          },
        ),
      ),
    );
  }
}
