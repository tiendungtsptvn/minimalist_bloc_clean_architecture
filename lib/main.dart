import 'package:flutter/material.dart';
import 'dependency_injection.dart';
import 'presentation/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependency();
  runApp(const MyApp());
}
