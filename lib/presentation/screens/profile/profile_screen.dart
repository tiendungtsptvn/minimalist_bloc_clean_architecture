import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/base/widgets/base_screen_app.dart';
import '../../app/locale/locale_cubit.dart';
import '../../app/theme/theme_cubit.dart';

class ProfileScreen extends AppStateful {
  const ProfileScreen({super.key});

  @override
  AppStatefulState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends AppStatefulState<ProfileScreen> {
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
              context.read<ThemeCubit>().changeTheme();
            },
            child: const Text("Change theme"),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              context.read<LocaleCubit>().switchLanguage();
            },
            child: const Text("Change language"),
          ),
        ],
      ),
    );
  }
}
