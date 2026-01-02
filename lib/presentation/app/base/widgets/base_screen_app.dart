import 'package:flutter/material.dart';
import 'package:minimalist_bloc_clean_architecture/resource/style/app_colors.dart';

abstract class AppStateless extends StatelessWidget {
  const AppStateless({super.key});

  @override
  Widget build(BuildContext context) {
    AppColors.of(context);
    return buildScreen(context);
  }

  Widget buildScreen(BuildContext context);
}

abstract class AppStateful extends StatefulWidget {
  const AppStateful({super.key});
}

abstract class AppStatefulState<T extends AppStateful> extends State<T> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppColors.of(context);
    return buildScreen(context);
  }

  Widget buildScreen(BuildContext context);
}
