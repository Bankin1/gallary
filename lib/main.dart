import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'blocs/image_bloc.dart';
import 'blocs/theme_bloc.dart';
import 'repositories/image_repository.dart';
import 'screens/home_screen.dart';
import 'screens/favorite_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/about_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // if (defaultTargetPlatform == TargetPlatform.windows ||
  //     defaultTargetPlatform == TargetPlatform.linux ||
  //     defaultTargetPlatform == TargetPlatform.macOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  // }

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isDarkMode = prefs.getBool('isDarkMode') ?? false;

  runApp(MyApp(isDarkMode: isDarkMode));
}

class MyApp extends StatelessWidget {
  final bool isDarkMode;

  MyApp({required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ImageBloc(repository: ImageRepository()),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(isDarkMode: isDarkMode),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Image Gallery App',
            theme: state.isDarkMode ? ThemeData.dark() : ThemeData.light(),
            home: HomeScreen(),
            routes: {
              '/favorites': (context) => FavoriteScreen(),
              '/settings': (context) => SettingsScreen(),
              '/about': (context) => AboutScreen(),
            },
          );
        },
      ),
    );
  }
}