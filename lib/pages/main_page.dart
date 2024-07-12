import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:map_flutter_yandex/models/search_model.dart';
import 'package:map_flutter_yandex/pages/detail_page.dart';
import 'package:map_flutter_yandex/pages/yandex_map.dart';
import 'package:map_flutter_yandex/service/dio_service.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  bool _isSearching = false;
  bool isMap = false;

  final TextEditingController _searchController = TextEditingController();
  List<Result> results = [];

  //pages
  final PageController controller = PageController();
  final List<Widget> _pages = const <Widget>[CustomYandexMap()];

  Future<void> searchLocations(String text) async {
    String? result = await NetworkService.getData(
        api: NetworkService.apiTitle,
        param: NetworkService.paramSearchProduct(text));
    if (result != null) {
      SearchModel title = searchModelFromJson(result);
      results = title.results ?? [];
      isMap = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: _isSearching
            ? TextField(
                controller: _searchController,
                onChanged: (text) async {
                  await searchLocations(text);
                },
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Search map...',
                  hintStyle: TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                ),
              )
            : const Text(
                'Map',
                style: TextStyle(color: Colors.white),
              ),
        backgroundColor: const Color.fromARGB(255, 30, 61, 77),
        elevation: 0,
        actions: [
          _isSearching
              ? IconButton(
                  icon: const Icon(Icons.clear, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      _isSearching = false;
                      _searchController.clear();
                      isMap = false;
                    });
                  })
              : IconButton(
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      _isSearching = true;
                    });
                  },
                ),
        ],
      ),

      body: isMap
          ? ListView.builder(
              itemCount: results.length,
              itemBuilder: (BuildContext context, int index) {
                log('natija           $results');
                var pr = results[index];
                return Card(
                  color: const Color.fromARGB(255, 30, 61, 77),
                  child: ListTile(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => DetailPage(_currentIndex))),
                    title: Text(
                      pr.title?.text ?? "",
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      pr.distance?.text ?? "",
                      style: const TextStyle(color: Colors.white54),
                    ),
                  ),
                );
              },
            )
          : _pages[_currentIndex],
      // body: isMap
      //     ? _pages[_currentIndex]
      //     : ListView.builder(
      //         itemCount: results.length,
      //         itemBuilder: (BuildContext context, int index) {
      //           var pr = results[index];
      //           return Card(
      //             color: const Color.fromARGB(255, 30, 61, 77),
      //             child: ListTile(
      //               title: Text(
      //                 pr.title.text,
      //                 style: const TextStyle(color: Colors.white),
      //               ),
      //               subtitle: Text(
      //                 pr.distance.text,
      //                 style: const TextStyle(color: Colors.white54),
      //               ),
      //             ),
      //           );
      //         },
      //       ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 30, 61, 77),
        elevation: 0,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.blueGrey,
        selectedFontSize: 20,
        unselectedIconTheme: const IconThemeData(size: 15),
        selectedIconTheme: const IconThemeData(size: 20),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map,
            ),
            label: '',
            activeIcon: Icon(
              Icons.map_outlined,
              color: Colors.red,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hiking_outlined),
            label: '',
            activeIcon: Icon(
              Icons.hiking_outlined,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
