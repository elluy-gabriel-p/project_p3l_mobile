import 'package:flutter/material.dart';
import 'package:project_p3l_mobile/data/Karyawan.dart';
import 'package:project_p3l_mobile/view/login.dart';

class DashboardAdminView extends StatefulWidget {
  final Karyawan loggedInAdmin;
  const DashboardAdminView({Key? key, required this.loggedInAdmin})
      : super(key: key);

  @override
  State<DashboardAdminView> createState() => _DashboardAdminViewState();
}

class _DashboardAdminViewState extends State<DashboardAdminView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard Admin'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(widget.loggedInAdmin.nama_karyawan!),
              accountEmail: Text(widget.loggedInAdmin.jabatan!),
            ),
            ListTile(
              title: Text('Data Produk'),
              onTap: () {
                // Handle menu 1 tap
              },
            ),
            ListTile(
              title: Text('Data Hampers'),
              onTap: () {
                // Handle menu 2 tap
              },
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: ElevatedButton(
                onPressed: () {
                  // Handle logout tap
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Set button color to red
                ),
                child: Text('Logout'),
              ),
            ),
          ],
        ),
      ),
      body: const Placeholder(),
    );
  }
}
