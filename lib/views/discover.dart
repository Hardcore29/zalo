import 'package:flutter/material.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<StatefulWidget> createState() => DiscoverState();
}

class DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Chưa có gì để khám phá..."),
    );
  }
}
