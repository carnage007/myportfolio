import 'package:flutter/widgets.dart';
import 'package:myportfolio/UI/home_page.dart';
import 'package:myportfolio/UI/mobile_home.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1000) {
          return const HomePage();
        } else {
          //return const MobileHome();
          return const HomePage();
        }
      },
    );
  }
}
