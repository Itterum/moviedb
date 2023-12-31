import 'package:flutter/material.dart';
import 'package:movie_app/ui/navigation/main_navigation.dart';
import 'package:movie_app/ui/widgets/movie_details/movie_details_main_info_widget.dart';
import 'package:movie_app/ui/widgets/movie_details/movie_details_main_screen_cast.dart';

class MovieDetailsWidget extends StatefulWidget {
  final int movieId;

  const MovieDetailsWidget({Key? key, required this.movieId}) : super(key: key);

  @override
  MovieDetailsWidgetState createState() => MovieDetailsWidgetState();
}

class MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Oppenheimer'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).popAndPushNamed(MainNavigationRouteNames.auth);
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: ColoredBox(
          color: const Color.fromRGBO(32, 11, 11, 1),
          child: ListView(
            children: const [
              MovieDetailsMainInfoWidget(),
              SizedBox(
                height: 30,
              ),
              MovieDetailsMainScreenCast(),
            ],
          ),
        ));
  }
}
