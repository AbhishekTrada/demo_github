import 'package:flutter/material.dart';

class GameBullz extends StatelessWidget {
  const GameBullz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo"),
      ),
      body: const Column(
        children: [
          Center(child: Text("Flutter Demo")),
          Center(child: Text("Flutter Demo")),
          Center(child: Text("Flutter Demo")),
        ],
      ),
    );
  }
}
