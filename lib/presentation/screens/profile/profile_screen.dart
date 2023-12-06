import 'package:flutter/material.dart';
import 'package:minimalist_bloc_clean_architecture/base/widgets/widget.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/app/bloc/app_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends BaseScreenApp {
  const ProfileScreen({super.key});

  @override
  BaseScreenAppState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends BaseScreenAppState<ProfileScreen> {
  @override
  Widget buildScreen(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Profile Screen"),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<AppBloc>(context, listen: false).changeTheme();
              },
              child: const Text("Change theme"))
        ],
      ),
    );
  }
}
