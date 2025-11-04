import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cheff/src/core/theme/app_theme.dart';
import 'package:mini_cheff/src/features/chat/presentation/chat_screen.dart';
import 'package:mini_cheff/src/features/diary/presentation/diary_screen.dart';
import 'package:mini_cheff/src/features/home/presentation/home_screen.dart';
import 'package:mini_cheff/src/features/menu/presentation/menu_screen.dart';
import 'package:mini_cheff/src/features/onboarding/presentation/onboarding_flow.dart';
import 'package:mini_cheff/src/features/profile/presentation/profile_screen.dart';
import 'package:mini_cheff/src/features/scanner/presentation/scanner_screen.dart';
import 'package:mini_cheff/src/features/settings/presentation/settings_screen.dart';

class MiniCheffApp extends ConsumerWidget {
  const MiniCheffApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    return MaterialApp(
      title: 'MiniCheff',
      debugShowCheckedModeBanner: false,
      theme: theme.lightTheme,
      darkTheme: theme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: OnboardingFlow.routeName,
      routes: {
        OnboardingFlow.routeName: (_) => const OnboardingFlow(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        ScannerScreen.routeName: (_) => const ScannerScreen(),
        MenuScreen.routeName: (_) => const MenuScreen(),
        DiaryScreen.routeName: (_) => const DiaryScreen(),
        ChatScreen.routeName: (_) => const ChatScreen(),
        ProfileScreen.routeName: (_) => const ProfileScreen(),
        SettingsScreen.routeName: (_) => const SettingsScreen(),
      },
    );
  }
}
