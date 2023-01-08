import 'dart:math';

import 'package:flutter/material.dart';

import 'package:revesion_app/databaseManager/contentManager.dart';
import 'package:revesion_app/widgets/filmGridView.dart';

class SearchContentScreen extends StatefulWidget {
  const SearchContentScreen({super.key});

  @override
  State<SearchContentScreen> createState() => _SearchContentScreenState();
}

bool isSearchBarActive = false;
TextEditingController searchBarController = TextEditingController();
ContentManager contentManager = ContentManager();
bool foundSearchResults = false;
Map<String, Map> searchResults = {};

class _SearchContentScreenState extends State<SearchContentScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double searchBarWidth = screenWidth / 3;
    double searchBarPosTop = screenHeight / 3;
    double activeSearchBarWidth = screenWidth / 1.5;
    double activeSearchBarPosTop = 15;
    // return FilmGridView(
    //             filmsMapToDisplay: searchResults,
    //           );
    return Stack(
      children: [
        foundSearchResults
            ? Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: FilmGridView(
                  filmsMapToDisplay: searchResults,
                ),
              )
            : Container(),
        AnimatedContainer(
          duration: const Duration(seconds: 1),
          width: double.infinity,
          height: double.infinity,
          color: searchResults.isEmpty
              ? const Color(0xFF2E2E48)
              : Colors.transparent,
          child: searchResults.isEmpty && isSearchBarActive
              ? Center(
                  child: Text(
                  "No result found!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: sqrt(screenHeight * screenWidth) / 20,
                      fontWeight: FontWeight.w200),
                ))
              : null,
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          left: isSearchBarActive
              ? ((screenWidth / 2) - ((activeSearchBarWidth / 2) ))
              : ((screenWidth / 2) - ((searchBarWidth / 2) )),
          top: isSearchBarActive ? activeSearchBarPosTop : searchBarPosTop,
          width: isSearchBarActive ? activeSearchBarWidth : searchBarWidth,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      var searchResultsTemp =
                          contentManager.searchByNameInContentMap(value);
                      if (searchResultsTemp.isNotEmpty) {
                        setState(() {
                          searchResults = searchResultsTemp;
                          foundSearchResults = true;
                        });
                      } else {
                        setState(() {
                          searchResults = searchResultsTemp;
                          foundSearchResults = false;
                        });
                      }
                      if (value.isNotEmpty) {
                        setState(() {
                          isSearchBarActive = true;
                        });
                      } else {
                        setState(() {
                          isSearchBarActive = false;
                        });
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
    );
  }
}
