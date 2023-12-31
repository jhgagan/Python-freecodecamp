import 'package:flutter/material.dart';

class Sustainability extends StatefulWidget {
  const Sustainability({super.key});


  @override
  State<Sustainability> createState() => _SustainabilityState();
}

class _SustainabilityState extends State<Sustainability> {
  @override
  Widget build(BuildContext context) {

    const Color bgColor = Colors.black;

    return const Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: bgColor,

      body: Center(
        child: Text("SUSTAINABILITY"),)
    );
  }
}