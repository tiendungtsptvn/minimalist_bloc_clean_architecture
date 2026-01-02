import 'package:flutter/material.dart';

import '../../app/base/widgets/base_screen_app.dart';

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
