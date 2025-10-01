import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_project/core/routing/app_router.dart';
import 'package:task_project/core/values/values.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Task Project',
      routerConfig: AppRouter.router,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.white,
        textTheme: GoogleFonts.albertSansTextTheme(Theme.of(context).textTheme),
        primaryTextTheme: GoogleFonts.albertSansTextTheme(Theme.of(context).primaryTextTheme),
        fontFamily: GoogleFonts.albertSans().fontFamily,
      ),
    );
  }
}
