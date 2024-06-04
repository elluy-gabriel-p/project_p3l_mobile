import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_p3l_mobile/view/report/preview_screen.dart';
import 'package:project_p3l_mobile/data/BahanBaku.dart';
import 'package:project_p3l_mobile/client/BahanBakuClient.dart';

Future<void> createPdf(BuildContext context) async {
  final doc = pw.Document();
  final now = DateTime.now();
  final formattedDate = DateFormat('d MMMM yyyy', 'id_ID').format(now);

  List<BahanBaku> bahanBakuList = [];
  try {
    bahanBakuList = await BahanBakuClient.fetchAll();
  } catch (e) {
    print(e);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to load bahan baku')),
    );
    return;
  }

  List<Map<String, dynamic>> data = bahanBakuList.map((bahanBaku) {
    return {
      'name': bahanBaku.nama_bahan,
      'unit': bahanBaku.satuan,
      'stock': bahanBaku.stok_bahan,
    };
  }).toList();

  doc.addPage(
    pw.MultiPage(
      build: (pw.Context context) {
        return [
          pw.Header(
            level: 0,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Atma Kitchen',
                    style: pw.TextStyle(
                        fontSize: 24, fontWeight: pw.FontWeight.bold)),
                pw.Text('Jl. Centralpark No. 10 Yogyakarta',
                    style: pw.TextStyle(fontSize: 12)),
                pw.SizedBox(height: 20),
                pw.Text('LAPORAN Stok Bahan Baku',
                    style: pw.TextStyle(
                        fontSize: 18, fontWeight: pw.FontWeight.bold)),
                pw.Text('Tanggal cetak: $formattedDate',
                    style: pw.TextStyle(fontSize: 12)),
                pw.SizedBox(height: 20),
              ],
            ),
          ),
          pw.Table.fromTextArray(
            headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            headers: ['Nama Bahan', 'Satuan', 'Stok'],
            data: data
                .map((item) => [item['name'], item['unit'], item['stock']])
                .toList(),
            border: pw.TableBorder.all(),
            cellAlignment: pw.Alignment.center,
            headerAlignment: pw.Alignment.center,
          ),
        ];
      },
    ),
  );

  // Save the PDF to a temporary directory
  final output = await getTemporaryDirectory();
  final file = File("${output.path}/laporan_stok_bahan_baku.pdf");
  await file.writeAsBytes(await doc.save());

  // Display the PDF
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PreviewScreen(doc: doc),
    ),
  );
}
