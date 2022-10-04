import 'package:flutter/material.dart';

import '../constants/theme.dart';
import '../widgets/navigation/navigation_bottom_bar.dart';
import '../widgets/navigation/navigation_top_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: NavigationTopBar(),
        bottomNavigationBar: NavigationBottomBar(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.only(top: Spacing.extraLarge),
            padding: const EdgeInsets.all(Spacing.regular),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              ],
            ),
          ),
        ),
      ),
  }
}
