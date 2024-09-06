import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme.dart';
import 'features/meditation/presentation/bloc/daily_quote/daily_quote_bloc.dart';
import 'features/meditation/presentation/bloc/daily_quote/daily_quote_event.dart';
import 'features/meditation/presentation/bloc/mood_message/mood_message_bloc.dart';
import 'features/music/presentation/bloc/song_bloc.dart';
import 'features/music/presentation/bloc/song_event.dart';
import 'injection_container.dart' as di;
import 'presentation/bottomNavBar/bloc/navigation_bloc.dart';
import 'presentation/onboarding/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => NavigationBloc(),
          ),
          BlocProvider(create: (context) => di.sl<SongBloc>()..add(FetchSongs())),
          BlocProvider(
            create: (context) => di.sl<DailyQuoteBloc>()..add(FetchDailyQuote()),
          ),
          BlocProvider(create: (context) => di.sl<MoodMessageBloc>())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          home: const OnboardingScreen(),
        ));
  }
}
