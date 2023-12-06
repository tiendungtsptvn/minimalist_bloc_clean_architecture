import 'package:flutter/material.dart';
import 'package:minimalist_bloc_clean_architecture/base/widgets/widget.dart';

class HomeScreen extends BaseScreenApp {
  const HomeScreen({super.key});

  @override
  BaseScreenAppState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseScreenAppState<HomeScreen> {
  @override
  Widget buildScreen(BuildContext context) {
    return const Center(
      child: Text("Home Screen"),
    );
  }
}
