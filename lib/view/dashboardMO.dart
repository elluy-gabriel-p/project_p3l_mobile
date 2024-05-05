import 'package:flutter/material.dart';
import 'package:project_p3l_mobile/data/Karyawan.dart';
import 'package:project_p3l_mobile/view/login.dart';

class DashboardMOView extends StatefulWidget {
  final Karyawan loggedInMO;
  const DashboardMOView({super.key, required this.loggedInMO});

  @override
  State<DashboardMOView> createState() => _DashboardMOViewState();
}

class _DashboardMOViewState extends State<DashboardMOView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard MO'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(widget.loggedInMO.nama_karyawan!),
              accountEmail: Text(widget.loggedInMO.jabatan!),
            ),
            ListTile(
              title: Text('Data Presensi'),
              onTap: () {
                // Handle menu 1 tap
              },
            ),
            ListTile(
              title: Text('Data Jabatan'),
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
            // Add more menu items as needed
          ],
        ),
      ),
      body: const Placeholder(),
    );
  }
}
