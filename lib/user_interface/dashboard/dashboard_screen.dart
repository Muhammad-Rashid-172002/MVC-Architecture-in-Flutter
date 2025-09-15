import 'package:flutter/material.dart';

class DashboardSreen extends StatefulWidget {
  const DashboardSreen({super.key});

  @override
  State<DashboardSreen> createState() => _DashboardSreenState();
}

class _DashboardSreenState extends State<DashboardSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Center(child: Text('Welcome to the Dashboard')),
    );
  }
}
