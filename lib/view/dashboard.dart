import 'package:flutter/material.dart';
import 'package:project_p3l_mobile/data/Karyawan.dart';

class DashboardView extends StatefulWidget {
  final Karyawan loggedInAdmin;
  const DashboardView({super.key, required this.loggedInAdmin});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
