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
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Triffy",
          ),
        ),
      ),
    );
  }
}
