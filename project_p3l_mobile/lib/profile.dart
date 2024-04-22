import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String userName = 'John Doe';
  final String userEmail = 'johndoe@example.com';
  final String profileImageUrl = 'https://via.placeholder.com/150';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Settings'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(profileImageUrl),
            ),
            SizedBox(height: 20),
            Text(
              userName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 10),
            Text(
              userEmail,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Change Password'),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
