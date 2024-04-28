import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = 'Mr.Sandman';
  String email = 'email@contoh.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
              },
              child: CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage('https://contoh.com/foto.jpg'),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 24),
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                  },
                ),
              ],
            ),
            Text(
              email,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
              },
              child: Text('Ganti Password'),
            ),
          ],
        ),
      ),
    );
  }
}
