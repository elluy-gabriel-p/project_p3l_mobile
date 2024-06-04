import 'package:flutter/material.dart';
import 'package:project_p3l_mobile/client/BahanBakuClient.dart';
import 'package:project_p3l_mobile/data/BahanBaku.dart';
import 'package:project_p3l_mobile/data/Karyawan.dart';
import 'package:project_p3l_mobile/view/login.dart';
import 'package:project_p3l_mobile/view/report/stok_bahan_pdf.dart'; // Import the createPdf function from its file

class DashboardOwnerView extends StatefulWidget {
  final Karyawan loggedInOwner;
  const DashboardOwnerView({super.key, required this.loggedInOwner});

  @override
  State<DashboardOwnerView> createState() => _DashboardOwnerViewState();
}

class _DashboardOwnerViewState extends State<DashboardOwnerView> {
  List<BahanBaku> bahanBakuList = [];

  Future<void> getBahanBakuList() async {
    try {
      List<BahanBaku> bahanBaku = await BahanBakuClient.fetchAll();
      setState(() {
        bahanBakuList = bahanBaku;
        print("sudah");
      });
    } catch (e) {
      print(e);
      throw Exception('Failed to load bahan baku');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getBahanBakuList();
    super.initState();
  }

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
              accountName:
                  Text(widget.loggedInOwner.nama_karyawan ?? 'No Name'),
              accountEmail: Text(widget.loggedInOwner.jabatan ?? 'No Position'),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
            ListTile(
              title: Text('Data Produk'),
              onTap: () {
                // Handle menu 1 tap
                // Navigator.push(context, MaterialPageRoute(builder: (context) => DataProdukView()));
              },
            ),
            ListTile(
              title: Text('Data Hampers'),
              onTap: () {
                // Handle menu 2 tap
                // Navigator.push(context, MaterialPageRoute(builder: (context) => DataHampersView()));
              },
            ),
            ListTile(
              title: Text('Data Karyawan'),
              onTap: () {
                // Handle menu 3 tap
                // Navigator.push(context, MaterialPageRoute(builder: (context) => DataKaryawanView()));
              },
            ),
            ListTile(
              title: Text('Laporan Stok Produk'),
              onTap: () async {
                // Call createPdf function and navigate to PreviewScreen
                await createPdf(context);
              },
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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
      body: const Center(
        child: Text(
          'Welcome to the Owner Dashboard',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
