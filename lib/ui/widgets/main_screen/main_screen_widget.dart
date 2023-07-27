import 'package:flutter/material.dart';
import 'package:movie_app/domain/data_providers/session_data_provider.dart';
import 'package:movie_app/ui/navigation/main_navigation.dart';
import 'package:movie_app/ui/widgets/movie_list/movie_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  MainScreenWidgetState createState() => MainScreenWidgetState();
}

class MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;

  void onSelectTab(int index) {
    if (_selectedTab == index) return;

    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMDB'),
        actions: [
          IconButton(
            onPressed: () {
              SessionDataProvider().setSessionId(null);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: const [
          Text('Index 0: News'),
          MovieListWidget(),
          Text('Index 2: TV Shows'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'News'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Films'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'TV Shows'),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}
