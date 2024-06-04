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
              accountName:
                  Text(widget.loggedInAdmin.nama_karyawan ?? 'No Name'),
              accountEmail: Text(widget.loggedInAdmin.jabatan ?? 'No Position'),
            ),
            ListTile(
              title: Text('Data Produk'),
              onTap: () {
                // Handle Data Produk tap
                // Navigator.push(context, MaterialPageRoute(builder: (context) => DataProdukView()));
              },
            ),
            ListTile(
              title: Text('Data Hampers'),
              onTap: () {
                // Handle Data Hampers tap
                // Navigator.push(context, MaterialPageRoute(builder: (context) => DataHampersView()));
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
          ],
        ),
      ),
      body: const Placeholder(),
    );
  }
}
