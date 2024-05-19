import 'package:project_p3l_mobile/client/ProdukClient.dart';
import 'package:project_p3l_mobile/client/HampersClient.dart';
import 'package:project_p3l_mobile/client/ResepClient.dart';
import 'package:project_p3l_mobile/data/Resep.dart';
import 'package:project_p3l_mobile/data/Hampers.dart';
import 'package:project_p3l_mobile/data/Produk.dart';
import 'package:flutter/material.dart';

class ProdukPage extends StatefulWidget {
  const ProdukPage({Key? key}) : super(key: key);

  @override
  State<ProdukPage> createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  List<Hampers> hampersList = [];
  List<Produk> produkList = [];
  Map<int, Resep?> resepMap = {};
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      await fetchHampersList();
      await fetchProdukList();
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to fetch data: $e';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> fetchHampersList() async {
    try {
      List<Hampers> hampers = await HampersClient.fetchAll();
      setState(() {
        hampersList = hampers;
      });
    } catch (e) {
      print(e);
      throw Exception('Failed to load hampers');
    }
  }

  Future<void> fetchProdukList() async {
    try {
      List<Produk> produk = await ProdukClient.fetchAll();
      for (var produkItem in produk) {
        if (produkItem.tipe_produk == 'Asli' && produkItem.id_resep != null) {
          Resep? resep = await findResep(produkItem.id_resep!);
          resepMap[produkItem.id_resep!] = resep;
        }
      }
      setState(() {
        produkList = produk;
      });
    } catch (e) {
      print(e);
      throw Exception('Failed to load products');
    }
  }

  Future<Resep?> findResep(int idResep) async {
    try {
      Resep resep = await ResepClient.find(idResep);
      return resep;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Produk> produkAsliList =
        produkList.where((produk) => produk.tipe_produk == 'Asli').toList();
    List<Produk> produkTitipanList =
        produkList.where((produk) => produk.tipe_produk == 'Titipan').toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Atma Kitchen'),
        backgroundColor: const Color(0xFF783B31),
      ),
      backgroundColor: const Color(0xFFC98D83),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : ListView(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          'Our Products',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: produkAsliList.length,
                        itemBuilder: (context, index) {
                          Produk produk = produkAsliList[index];
                          Resep? resep = resepMap[produk.id_resep];
                          return ProductCard(
                              produk: produk,
                              kuotaHarian:
                                  resep?.kuota_harian?.toString() ?? 'Unknown');
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          'Our Hampers',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: hampersList.length,
                        itemBuilder: (context, index) {
                          Hampers hampers = hampersList[index];
                          return HampersCard(hampers: hampers);
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          'Lain - Lain',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: produkTitipanList.length,
                        itemBuilder: (context, index) {
                          Produk produk = produkTitipanList[index];
                          return ProductCard(
                              produk: produk, kuotaHarian: 'Unknown');
                        },
                      ),
                    ),
                  ],
                ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Produk produk;
  final String kuotaHarian;

  const ProductCard({Key? key, required this.produk, required this.kuotaHarian})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Image.network(
                  produk.gambar_produk ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              produk.nama_produk ?? '',
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Stok : ${produk.jumlah_stok}"),
                if (kuotaHarian != 'Unknown') Text("Kuota : $kuotaHarian"),
              ],
            ),
            Text(
              'Rp. ${produk.harga}',
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}

class HampersCard extends StatelessWidget {
  final Hampers hampers;

  const HampersCard({Key? key, required this.hampers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Image.network(
                  hampers.gambar_hampers ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              hampers.nama_hampers ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Rp. ${hampers.harga_hampers}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
