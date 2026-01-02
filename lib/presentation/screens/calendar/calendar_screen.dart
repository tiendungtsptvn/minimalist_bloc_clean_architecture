import 'package:flutter/material.dart';

import '../../app/base/widgets/base_screen_app.dart';

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
