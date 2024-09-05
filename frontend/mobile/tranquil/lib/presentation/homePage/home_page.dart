import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranquil/features/meditation/presentation/pages/meditation_screen.dart';
import 'package:tranquil/features/music/presentation/pages/music_player_screen.dart';
import 'package:tranquil/presentation/bottomNavbar/widgets/bottom_nav_bar.dart';

import '../bottomNavbar/bloc/navigation_bloc.dart';

class HomeScreen extends StatelessWidget {
  final List<Widget> pages = [MeditationScreen(), MusicPlayerScreen()];

  BottomNavigationBarItem createBottomNavItem(
      {required String assetName,
      required bool isActive,
      required BuildContext context}) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        assetName,
        color: isActive
            ? Theme.of(context).focusColor
            : Theme.of(context).primaryColor,
      ),
      label: '',
    );
  }

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if (state is NavigationChanged) {
            return pages[state.index];
          }
          return pages[0];
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          int currentIndex = 0;
          if (state is NavigationChanged) {
            currentIndex = state.index;
          }
          final List<BottomNavigationBarItem> bottomNavigationBarItems = [
            createBottomNavItem(
              assetName: 'assets/images/menu_home.png',
              isActive: currentIndex == 0,
              context: context,
            ),
            createBottomNavItem(
              assetName: 'assets/images/menu_songs.png',
              isActive: currentIndex == 1,
              context: context,
            ),
          ];
          return BottomNavBar(
              items: bottomNavigationBarItems, currentIndex: currentIndex);
        },
      ),
    );
  }
}
