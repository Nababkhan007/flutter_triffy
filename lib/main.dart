import 'package:flutter/material.dart';

void main() => runApp(const Triffy());

class Triffy extends StatelessWidget {
  const Triffy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Triffy",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Triffy",
          ),
        ),
      ),
    );
  }
}
