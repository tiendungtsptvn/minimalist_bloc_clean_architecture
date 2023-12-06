import 'package:flutter/material.dart';
import 'package:minimalist_bloc_clean_architecture/base/widgets/widget.dart';

class FocusesScreen extends BaseScreenApp {
  const FocusesScreen({super.key});

  @override
  BaseScreenAppState<FocusesScreen> createState() => _FocusesScreenState();
}

class _FocusesScreenState extends BaseScreenAppState<FocusesScreen> {
  @override
  Widget buildScreen(BuildContext context) {
    return const Center(
      child: Text("Focuses Screen"),
    );
  }
}
