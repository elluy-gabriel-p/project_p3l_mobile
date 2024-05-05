import 'package:flutter/material.dart';
import 'package:project_p3l_mobile/data/Karyawan.dart';
import 'package:project_p3l_mobile/view/login.dart';

class DashboardOwnerView extends StatefulWidget {
  final Karyawan loggedInOwner;
  const DashboardOwnerView({super.key, required this.loggedInOwner});

  @override
  State<DashboardOwnerView> createState() => _DashboardOwnerViewState();
}

class _DashboardOwnerViewState extends State<DashboardOwnerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard Owner'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(widget.loggedInOwner.nama_karyawan!),
              accountEmail: Text(widget.loggedInOwner.jabatan!),
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

            ListTile(
              title: Text('Data Karyawan'),
              onTap: () {
                // Handle menu 3 tap
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
            // Add more menu items as needed
          ],
        ),
      ),
      body: const Placeholder(),
    );
  }
}
