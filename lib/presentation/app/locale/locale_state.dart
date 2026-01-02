import 'dart:ui';

import 'package:equatable/equatable.dart';

class LocaleState extends Equatable {
  final Locale currentLocale;

  const LocaleState({required this.currentLocale});

  LocaleState copyWith({Locale? currentLocale}) {
    return LocaleState(
      currentLocale: currentLocale ?? this.currentLocale,
    );
  }

  @override
  List<Object?> get props => [currentLocale];
}
