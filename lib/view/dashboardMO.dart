import 'package:flutter/material.dart';
import 'package:project_p3l_mobile/data/Karyawan.dart';
import 'package:project_p3l_mobile/view/login.dart';
import 'package:project_p3l_mobile/view/report/stok_bahan_pdf.dart';

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
              accountName: Text(widget.loggedInMO.nama_karyawan ?? 'No Name'),
              accountEmail: Text(widget.loggedInMO.jabatan ?? 'No Position'),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
            ListTile(
              title: Text('Data Presensi'),
              onTap: () {
                // Handle Data Presensi tap
                // Navigator.push(context, MaterialPageRoute(builder: (context) => DataPresensiView()));
              },
            ),
            ListTile(
              title: Text('Data Jabatan'),
              onTap: () {
                // Handle Data Jabatan tap
                // Navigator.push(context, MaterialPageRoute(builder: (context) => DataJabatanView()));
              },
            ),
            ListTile(
              title: Text('Laporan Stok Bahan Baku'),
              onTap: () {
                // Handle Laporan Stok Bahan Baku tap
                createPdf(
                    context); // Call the createPdf function from stok_bahan_pdf.dart
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  // Handle logout
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
      body: const Center(
        child: Text(
          'Welcome to the MO Dashboard',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
