import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeEvent {}

class ToggleTheme extends ThemeEvent {}

class ThemeState {
  final bool isDarkMode;

  ThemeState({required this.isDarkMode});
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc({required bool isDarkMode}) : super(ThemeState(isDarkMode: isDarkMode)) {
    on<ToggleTheme>(_toggleTheme);
  }

  Future<void> _toggleTheme(ToggleTheme event, Emitter<ThemeState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = !state.isDarkMode;
    await prefs.setBool('isDarkMode', isDarkMode);
    emit(ThemeState(isDarkMode: isDarkMode));
  }
}
