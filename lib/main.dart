import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/providers/main_provider.dart';
import 'package:foodapp/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              //primary: const Color(0xAA758ECD),
              //secondary: const Color(0xAA506fbf),
              primary: const Color(0xAA21A179),
              secondary: const Color(0xAA21A179),
            ),
        brightness: Brightness.light,
        fontFamily: 'Poppins',
      ),
      darkTheme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: const Color(0xAAF06543),
              onPrimary: Colors.white,
              secondary: const Color(0xAAF09D51),
              onSecondary: Colors.black,
              brightness: Brightness.dark,
              background: const Color(0xAA313638),
            ),
        scaffoldBackgroundColor: const Color(0xAA313638),
        fontFamily: 'Poppins',
      ),
      home: ScreenUtilInit(designSize: const Size(375, 812), builder: () => const HomeScreen()),
    );
  }
}
