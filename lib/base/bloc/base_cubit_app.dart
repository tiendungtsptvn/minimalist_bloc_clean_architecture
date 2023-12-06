import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubitApp<State> extends Cubit<State> {
  BaseCubitApp(super.initialState);
}