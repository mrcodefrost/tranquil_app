import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranquil/core/theme.dart';
import 'package:tranquil/presentation/homePage/home_page.dart';

import 'presentation/bottomNavbar/bloc/navigation_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NavigationBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        // home: OnboardingScreen(),
        // home: MeditationScreen(),
        home: HomeScreen(),
      ),
    );
  }
}
