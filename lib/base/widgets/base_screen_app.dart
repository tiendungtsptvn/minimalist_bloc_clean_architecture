import 'package:flutter/material.dart';
import 'package:minimalist_bloc_clean_architecture/resource/style/app_colors.dart';

abstract class BaseScreenApp extends StatefulWidget {
  const BaseScreenApp({super.key});
}

abstract class BaseScreenAppState<T extends BaseScreenApp> extends State<T> {

  @override
  void initState() {
    print("initState");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppColors.of(context);
    print("Building BaseScreenApp");
    return buildScreen(context);
  }

  Widget buildScreen(BuildContext context);
}

