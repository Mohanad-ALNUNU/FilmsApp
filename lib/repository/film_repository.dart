import 'package:revesion_app/utils/constants.dart';

class FilmRepository {
  Future<List<Map>> simulateHTTP(List<Map> dataToGet) async {
    await Future.delayed(const Duration(seconds: 0));
    return dataToGet;
  }

  Future<List<Map>> getFilms() {
    return simulateHTTP(dummyContentMap);
  }

  Future<List<Map>> getCategories() {
    return simulateHTTP(dummyCategoryMap);
  }
}
