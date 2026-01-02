import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dependency_injection.dart';
import 'presentation/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await injectDependency();
  runApp(const MyApp());
}
