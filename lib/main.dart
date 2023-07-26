import 'package:flutter/material.dart';
import 'package:movie_app/widgets/auth/auth_widget.dart';
import 'package:movie_app/widgets/main_screen/main_screen_widget.dart';
import 'package:movie_app/widgets/movie_details/movie_details_widget.dart';
import 'package:movie_app/widgets/theme/app_colors.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie DB',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.mainDarkBlue,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.mainDarkBlue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),
      routes: {
        '/auth': (context) => const AuthWidget(),
        '/main_screen': (context) => const MainScreenWidget(),
        '/main_screen/movie_details': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;

          if (arguments is int) {
            return MovieDetailsWidget(
              movieId: arguments,
            );
          }

          return const MovieDetailsWidget(
            movieId: 0,
          );
        },
      },
      initialRoute: '/auth',
    );
  }
}
