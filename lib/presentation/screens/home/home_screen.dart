import 'package:flutter/material.dart';
import 'package:minimalist_bloc_clean_architecture/core/base/widgets/widget.dart';

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
