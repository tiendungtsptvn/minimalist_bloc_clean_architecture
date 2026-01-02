import 'package:flutter/material.dart';
import 'package:minimalist_bloc_clean_architecture/core/base/widgets/widget.dart';

class FocusesScreen extends AppStateful {
  const FocusesScreen({super.key});

  @override
  AppStatefulState<FocusesScreen> createState() => _FocusesScreenState();
}

class _FocusesScreenState extends AppStatefulState<FocusesScreen> {
  @override
  Widget buildScreen(BuildContext context) {
    return const Center(
      child: Text("Focuses Screen"),
    );
  }
}
