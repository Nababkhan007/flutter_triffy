import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body, fab;
  final FloatingActionButtonLocation fabLocation;

  const CustomScaffold({
    Key? key,
    required this.body,
    required this.fab,
    this.fabLocation = FloatingActionButtonLocation.endFloat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      floatingActionButton: fab,
      floatingActionButtonLocation: fabLocation,
    );
  }
}
