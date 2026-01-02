import 'package:flutter/material.dart';

import '../../app/base/widgets/base_screen_app.dart';

class HomeScreen extends AppStateful {
  const HomeScreen({super.key});

  @override
  AppStatefulState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends AppStatefulState<HomeScreen> {
  @override
  Widget buildScreen(BuildContext context) {
    return const Center(
      child: Text("Home Screen"),
    );
  }
}
