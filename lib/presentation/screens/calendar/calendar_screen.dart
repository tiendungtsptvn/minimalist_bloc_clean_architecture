import 'package:flutter/material.dart';
import 'package:minimalist_bloc_clean_architecture/core/base/widgets/widget.dart';

class CalendarScreen extends AppStateful {
  const CalendarScreen({super.key});

  @override
  AppStatefulState<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends AppStatefulState<CalendarScreen> {
  @override
  Widget buildScreen(BuildContext context) {
    return const Center(
      child: Text("Calendar Screen"),
    );
  }
}
