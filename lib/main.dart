import 'package:baby_milestone_tracker/screens/introscreen_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
        title: 'Baby Milestone Tracker',
        theme: MyAppThemes.lightTheme,
        darkTheme: MyAppThemes.darkTheme,
        themeMode: ThemeMode.system, // Default mode
        debugShowCheckedModeBanner: false,
        home: const IntroScreenConfig());
  }
}

class MyAppThemes {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
    brightness: Brightness.light,
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
  );
}
