import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:films_app/model/film_dto.dart';
import 'package:films_app/repository/film_repository.dart';
import 'package:films_app/service/films_service.dart';
import 'package:films_app/utils/responsive.dart';
import 'package:films_app/view/films_view/components/films_grid.dart';

class FilmController extends GetxController {
  final FilmRepository _filmRepository = FilmRepository();
  RxList<dynamic> filmsToDisplay = RxList<dynamic>();
  FilmsServices filmsServices = FilmsServices();
  RxBool foundSearchResults = RxBool(false);
  RxBool isSearchBarActive = RxBool(false);

  List<Widget> displayCategories() {
    List<Widget> readyToDisplayWidgets = [];
    //TODO::categoryRepos not films
    _filmRepository
        .getCategories()
        // ignore: avoid_function_literals_in_foreach_calls
        .then((categories) => categories.forEach((category) {
              readyToDisplayWidgets.add(Row(children: [
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextButton(
                            style: TextButton.styleFrom(),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                category['name'],
                                style: const TextStyle(
                                    color: Colors.black87, fontSize: 20),
                              ),
                            ))))
              ]));
            }));
    return readyToDisplayWidgets;
  }

  Future<void> getFilms() async {
    await _filmRepository.getFilms().then((value) => value.forEach((element) {
          filmsToDisplay.add(FilmDTO.fromJson(element));
        }));
  }

  Future<void> searchFilmsByName(String keyword) async {
    // ignore: avoid_function_literals_in_foreach_calls
    filmsToDisplay.value = [];
    await _filmRepository.getFilms().then((films) => films.forEach((film) {
          var filmTitle = film['title'].toLowerCase();
          if (filmTitle.contains(keyword.toLowerCase()) && keyword.length > 3) {
            filmsToDisplay.add(FilmDTO.fromJson(film));
          }
        }));
  }

  static double getFilmMetadataTextSize(BuildContext context, int textLength) {
    return 5.27273 * (Responsive.getScreenReolution(context)['width']! / 1920) +
        5.8;
  }

  static double getFilmMainTextSize(BuildContext context, int textLength) {
    return 5.27273 *
            ((Responsive.getScreenReolution(context)['width']! - (textLength)) /
                1920) +
        7;
  }

  void showWatchDialog(String id) {
    Get.dialog(Container(
      color: Colors.red,
      child: Text(id),
    ));
  }
}
