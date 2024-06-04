import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'view/home.dart';

void main() async {
  // Ensure the Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize date formatting for the desired locale
  await initializeDateFormatting('id_ID', null);

  // Run the app wrapped with ProviderScope for Riverpod
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atma Kitchen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}
