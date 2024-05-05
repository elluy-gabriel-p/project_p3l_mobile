import 'package:flutter/material.dart';
import 'package:project_p3l_mobile/data/Karyawan.dart';

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
        title: Text('Dashboard Admin'),
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
            // Add more menu items as needed
          ],
        ),
      ),
      body: const Placeholder(),
    );
  }
}
