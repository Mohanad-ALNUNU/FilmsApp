import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revesion_app/controller/film_controller.dart';

import 'package:revesion_app/view/films_view/components/films_grid.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchContentScreenState();
}

TextEditingController searchBarController = TextEditingController();
bool foundSearchResults = false;
Map<String, Map> searchResults = {};

class _SearchContentScreenState extends State<SearchView> {
  final FilmController _homeController = Get.put(FilmController());
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double searchBarWidth = screenWidth / 3;
    double searchBarPosTop = screenHeight / 3;
    double activeSearchBarWidth = screenWidth / 1.5;
    double activeSearchBarPosTop = 15;
    _homeController.filmsToDisplay.value = [];
    return Obx(
      () => Stack(
        children: [
          _homeController.filmsToDisplay.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: FilmsGrid(isSearchView: true),
                )
              : Container(),
          _homeController.filmsToDisplay.isEmpty &&
                  _homeController.isSearchBarActive.value
              ? AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  width: double.infinity,
                  height: double.infinity,
                  color: const Color(0xFF2E2E48),
                  child: Center(
                      child: Text(
                    "No result found!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: sqrt(screenHeight * screenWidth) / 20,
                        fontWeight: FontWeight.w200),
                  )),
                )
              : Container(),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            left: _homeController.isSearchBarActive.value
                ? ((screenWidth / 2) - ((activeSearchBarWidth / 2)))
                : ((screenWidth / 2) - ((searchBarWidth / 2))),
            top: _homeController.isSearchBarActive.value
                ? activeSearchBarPosTop
                : searchBarPosTop,
            width: _homeController.isSearchBarActive.value
                ? activeSearchBarWidth
                : searchBarWidth,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        _homeController.searchFilmsByName(value);
                        if (value.isNotEmpty) {
                          _homeController.isSearchBarActive.value = true;
                        } else {
                          _homeController.isSearchBarActive.value = false;
                        }
                      },
                      controller: searchBarController,
                    ),
                  ),
                  const Icon(Icons.search),
                  const SizedBox(
                    width: 5,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
