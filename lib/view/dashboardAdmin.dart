import 'package:flutter/material.dart';
import 'package:project_p3l_mobile/data/Karyawan.dart';

class DashboardAdminView extends StatefulWidget {
  final Karyawan loggedInAdmin;
  const DashboardAdminView({super.key, required this.loggedInAdmin});

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
            // Add more menu items as needed
          ],
        ),
      ),
      body: const Placeholder(),
    );
  }
}
