import 'package:flutter/material.dart';
import 'package:movie_app/resources/resources.dart';

class Movie {
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie({
    required this.id,
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
  });
}

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({Key? key}) : super(key: key);

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
      id: 1,
      imageName: AppImages.transformers,
      title: 'Transformers: Rise of the Beasts',
      time: 'June 6, 2023',
      description:
          'When a new threat capable of destroying the entire planet emerges, Optimus Prime and the Autobots must team up with a powerful faction known as the Maximals. With the fate of humanity hanging in the balance, humans Noah and Elena will do whatever it takes to help the Transformers as they engage in the ultimate battle to save Earth.',
    ),
    Movie(
      id: 2,
      imageName: AppImages.flash,
      title: 'The Flash',
      time: 'June 13, 2023',
      description:
          'When his attempt to save his family inadvertently alters the future, Barry Allen becomes trapped in a reality in which General Zod has returned and there are no Super Heroes to turn to. In order to save the world that he is in and return to the future that he knows, Barry\'s only hope is to race for his life. But will making the ultimate sacrifice be enough to reset the universe?',
    ),
    Movie(
      id: 3,
      imageName: AppImages.barbie,
      title: 'Barbie',
      time: 'July 19, 2023',
      description:
          'Barbie and Ken are having the time of their lives in the colorful and seemingly perfect world of Barbie Land. However, when they get a chance to go to the real world, they soon discover the joys and perils of living among humans.',
    ),
    Movie(
      id: 4,
      imageName: AppImages.placeholder,
      title: 'Oppenheimer',
      time: 'July 19, 2023',
      description:
          'The story of J. Robert Oppenheimer\'s role in the development of the atomic bomb during World War II.',
    ),
    Movie(
      id: 5,
      imageName: AppImages.whouse,
      title: 'Warhorse One',
      time: 'June 6, 2023',
      description:
          'When a new threat capable of destroying the entire planet emerges, Optimus Prime and the Autobots must team up with a powerful faction known as the Maximals. With the fate of humanity hanging in the balance, humans Noah and Elena will do whatever it takes to help the Transformers as they engage in the ultimate battle to save Earth.',
    ),
    Movie(
      id: 6,
      imageName: AppImages.fastx,
      title: 'Fast X',
      time: 'June 13, 2023',
      description:
          'When his attempt to save his family inadvertently alters the future, Barry Allen becomes trapped in a reality in which General Zod has returned and there are no Super Heroes to turn to. In order to save the world that he is in and return to the future that he knows, Barry\'s only hope is to race for his life. But will making the ultimate sacrifice be enough to reset the universe?',
    ),
    Movie(
      id: 7,
      imageName: AppImages.kotz,
      title: 'Knights of the Zodiac',
      time: 'July 19, 2023',
      description:
          'Barbie and Ken are having the time of their lives in the colorful and seemingly perfect world of Barbie Land. However, when they get a chance to go to the real world, they soon discover the joys and perils of living among humans.',
    ),
    Movie(
      id: 8,
      imageName: AppImages.soffreedom,
      title: 'Sound of Freedom',
      time: 'July 19, 2023',
      description:
          'The story of J. Robert Oppenheimer\'s role in the development of the atomic bomb during World War II.',
    ),
    Movie(
      id: 9,
      imageName: AppImages.bridbox,
      title: 'Bird Box Barcelona',
      time: 'June 6, 2023',
      description:
          'When a new threat capable of destroying the entire planet emerges, Optimus Prime and the Autobots must team up with a powerful faction known as the Maximals. With the fate of humanity hanging in the balance, humans Noah and Elena will do whatever it takes to help the Transformers as they engage in the ultimate battle to save Earth.',
    ),
    Movie(
      id: 10,
      imageName: AppImages.spiderman,
      title: 'Spider-Man: Across the Spider-Verse',
      time: 'June 13, 2023',
      description:
          'When his attempt to save his family inadvertently alters the future, Barry Allen becomes trapped in a reality in which General Zod has returned and there are no Super Heroes to turn to. In order to save the world that he is in and return to the future that he knows, Barry\'s only hope is to race for his life. But will making the ultimate sacrifice be enough to reset the universe?',
    ),
    Movie(
      id: 11,
      imageName: AppImages.johnwick,
      title: 'John Wick: Chapter 4',
      time: 'July 19, 2023',
      description:
          'Barbie and Ken are having the time of their lives in the colorful and seemingly perfect world of Barbie Land. However, when they get a chance to go to the real world, they soon discover the joys and perils of living among humans.',
    ),
    Movie(
      id: 12,
      imageName: AppImages.sanandreas,
      title: 'San Andreas',
      time: 'July 19, 2023',
      description:
          'The story of J. Robert Oppenheimer\'s role in the development of the atomic bomb during World War II.',
    ),
  ];

  final _searchController = TextEditingController();

  List<Movie> _filteredMovie = [];

  void _searchMovies() {
    final query = _searchController.text;

    if (query.isNotEmpty) {
      _filteredMovie = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovie = _movies;
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _filteredMovie = _movies;
    _searchController.addListener(_searchMovies);
  }

  void _onMovieTap(int index) {
    final id = _movies[index].id;
    Navigator.of(context)
        .pushNamed('/main_screen/movie_details', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.only(top: 70),
          itemCount: _filteredMovie.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index) {
            final movie = _filteredMovie[index];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black.withOpacity(0.2),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        )
                      ],
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage(movie.imageName),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Text(
                                movie.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                movie.time,
                                style: const TextStyle(color: Colors.grey),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                movie.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      onTap: () => _onMovieTap(index),
                    ),
                  )
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Search',
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
