import 'package:flutter/material.dart';

class MobileHome extends StatefulWidget {
  const MobileHome({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MobileHomeState();
  }
}

class _MobileHomeState extends State<MobileHome> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff0A192F),
    );
  }
}
