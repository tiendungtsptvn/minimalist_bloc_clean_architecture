import 'package:flutter/material.dart';

import '../../../l10n/generated/l10n.dart';
import '../../app/base/widgets/base_screen_app.dart';

class HomeScreen extends AppStateful {
  const HomeScreen({super.key});

  @override
  AppStatefulState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends AppStatefulState<HomeScreen> {
  @override
  Widget buildScreen(BuildContext context) {
    return Center(
      child: Text(AppLocale.current.home),
    );
  }
}
