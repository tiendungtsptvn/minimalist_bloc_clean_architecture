import 'package:flutter/material.dart';
import 'package:minimalist_bloc_clean_architecture/base/widgets/widget.dart';

class CalendarScreen extends BaseScreenApp {
  const CalendarScreen({super.key});

  @override
  BaseScreenAppState<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends BaseScreenAppState<CalendarScreen> {
  @override
  Widget buildScreen(BuildContext context) {
    return const Center(
      child: Text("Calendar Screen"),
    );
  }
}
