import 'package:flutter/material.dart';

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
const filmCardColor = Color(0xFF2E2E48);
const filmTextColor = Colors.white60;

const filmMetadataTextWeight = FontWeight.w300;
const filmMainTextWeight = FontWeight.bold;

const double filmCartBorderRadius = 8;
const double minFilmCardImageHight = 80;
const double filmsGridCrossAxisSpacingFactor = 50;
const double filmsGridMainAxisSpacingFactor = 35;
const double filmsGridCrossAxisCountFactor = 280;
const double votingBarMinValue = 0.5;
const double votingBarItemSize = 20;

const int votingBarItemCount = 5;
const int filmsGridMinCrossAxisCount = 2;

const defaultPadding = EdgeInsets.all(8.0);
const filmsImagePadding = EdgeInsets.only(top: 8.0);

const votingBarIcon = Icon(Icons.star, color: Colors.amber);

const defaultSizedBox = SizedBox(
  height: 15,
);

const String logoImageURL =
    "https://static.miraheze.org/avidwiki/thumb/e/eb/Awesomeness_Films_%282016%29.png/534px-Awesomeness_Films_%282016%29.png";

// -------------DUMMY-DATA-------------------------

const List<Map> dummyCategoryMap = [
  {"name": "films"},
  {"name": "search"},
  {"name": "working"},
  {"name": "playing"}
];
const List<Map> dummyContentMap = [
  {
    "id": "1",
    "title": "The Shawshank Redemption",
    "date": "1994-09-23",
    "duration": "2h 22m",
    "rate": 4.9,
    "image":
        "https://m.media-amazon.com/images/M/MV5BNDE3ODcxYzMtY2YzZC00NmNlLWJiNDMtZDViZWM2MzIxZDYwXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_FMjpg_UX1000_.jpg",
    "category": "Drama"
  },
  {
    "id": "2",
    "title": "The Godfather",
    "date": "1972-03-14",
    "duration": "2h 58m",
    "rate": 4.5,
    "image":
        "https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg",
    "category": "Crime"
  },
  {
    "id": "3",
    "title": "Pulp Fiction",
    "date": "1994-10-14",
    "duration": "2h 34m",
    "rate": 3.5,
    "image":
        "https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg",
    "category": "Crime"
  },
  {
    "id": "4",
    "title": "The Dark Knight",
    "date": "2008-07-18",
    "duration": "2h 32m",
    "rate": 2.8,
    "image":
        "https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg",
    "category": "Action"
  },
  {
    "id": "5",
    "title": "The Lord of the Rings: The Return of the King",
    "date": "2003-12-17",
    "duration": "3h 21m",
    "rate": 2.5,
    "image":
        "https://m.media-amazon.com/images/M/MV5BNzA5ZDNlZWMtM2NhNS00NDJjLTk4NDItYTRmY2EwMWZlMTY3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg",
    "category": "Adventure"
  },
  {
    "id": "6",
    "title": "Fight Club",
    "date": "1999-10-15",
    "duration": "2h 19m",
    "rate": 4.8,
    "image":
        "https://m.media-amazon.com/images/M/MV5BNDIzNDU0YzEtYzE5Ni00ZjlkLTk5ZjgtNjM3NWE4YzA3Nzk3XkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_.jpg",
    "category": "Drama"
  },
  {
    "id": "7",
    "title": "Forrest Gump",
    "date": "1994-07-06",
    "duration": "2h 22m",
    "rate": 4.7,
    "image":
        "https://m.media-amazon.com/images/M/MV5BNWIwODRlZTUtY2U3ZS00Yzg1LWJhNzYtMmZiYmEyNmU1NjMzXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg",
    "category": "Drama"
  },
  {
    "id": "8",
    "title": "Inception",
    "date": "2010-07-16",
    "duration": "2h 28m",
    "rate": 3.8,
    "image":
        "https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_.jpg",
    "category": "Sci-Fi"
  },
  {
    "id": "9",
    "title": "The Matrix",
    "date": "1999-03-31",
    "duration": "2h 16m",
    "rate": 4.5,
    "image":
        "https://m.media-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg",
    "category": "Sci-Fi"
  },
  {
    "id": "10",
    "title": "The Silence of the Lambs",
    "date": "1991-02-14",
    "duration": "1h 58m",
    "rate": 2.6,
    "image":
        "https://m.media-amazon.com/images/M/MV5BNjNhZTk0ZmEtNjJhMi00YzFlLWE1MmEtYzM1M2ZmMGMwMTU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg",
    "category": "Thriller"
  },
  {
    "id": "11",
    "title": "Schindler's List",
    "date": "1993-11-30",
    "duration": "3h 15m",
    "rate": 1.5,
    "image":
        "https://m.media-amazon.com/images/M/MV5BNDE4OTMxMTctNmRhYy00NWE2LTg3YzItYTk3M2UwOTU5Njg4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg",
    "category": "Drama"
  },
  {
    "id": "12",
    "title": "The Lion King",
    "date": "1994-06-15",
    "duration": "1h 28m",
    "rate": 2.0,
    "image":
        "https://m.media-amazon.com/images/M/MV5BYTYxNGMyZTYtMjE3MS00MzNjLWFjNmYtMDk3N2FmM2JiM2M1XkEyXkFqcGdeQXVyNjY5NDU4NzI@._V1_.jpg",
    "category": "Animation"
  },
  {
    "id": "13",
    "title": "Goodfellas",
    "date": "1990-09-12",
    "duration": "2h 25m",
    "rate": 2.7,
    "image":
        "https://m.media-amazon.com/images/M/MV5BY2NkZjEzMDgtN2RjYy00YzM1LWI4ZmQtMjIwYjFjNmI3ZGEwXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg",
    "category": "Crime"
  },
  {
    "id": "14",
    "title": "The Avengers",
    "date": "2012-04-11",
    "duration": "2h 23m",
    "rate": 4.5,
    "image":
        "https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg",
    "category": "Action"
  },
  {
    "id": "15",
    "title": "Back to the Future",
    "date": "1985-07-03",
    "duration": "1h 56m",
    "rate": 4.5,
    "image":
        "https://m.media-amazon.com/images/M/MV5BZmU0M2Y1OGUtZjIxNi00ZjBkLTg1MjgtOWIyNThiZWIwYjRiXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg",
    "category": "Adventure"
  },
  {
    "id": "16",
    "title": "Saving Private Ryan",
    "date": "1998-07-24",
    "duration": "2h 49m",
    "rate": 2.5,
    "image":
        "https://m.media-amazon.com/images/M/MV5BZjhkMDM4MWItZTVjOC00ZDRhLThmYTAtM2I5NzBmNmNlMzI1XkEyXkFqcGdeQXVyNDYyMDk5MTU@._V1_FMjpg_UX1000_.jpg",
    "category": "War"
  },
  {
    "id": "17",
    "title": "The Departed",
    "date": "2006-09-26",
    "duration": "2h 31m",
    "rate": 1.7,
    "image":
        "https://m.media-amazon.com/images/M/MV5BMTI1MTY2OTIxNV5BMl5BanBnXkFtZTYwNjQ4NjY3._V1_.jpg",
    "category": "Crime"
  },
  {
    "id": "18",
    "title": "Interstellar",
    "date": "2014-11-05",
    "duration": "2h 49m",
    "rate": 5.0,
    "image":
        "https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg",
    "category": "Sci-Fi"
  },
  {
    "id": "19",
    "title": "Gladiator",
    "date": "2000-05-01",
    "duration": "2h 35m",
    "rate": 4.0,
    "image":
        "https://upload.wikimedia.org/wikipedia/en/f/fb/Gladiator_%282000_film_poster%29.png",
    "category": "Action"
  },
  {
    "id": "20",
    "title": "The Green Mile",
    "date": "1999-12-10",
    "duration": "3h 9m",
    "rate": 5.0,
    "image":
        "https://m.media-amazon.com/images/M/MV5BMTUxMzQyNjA5MF5BMl5BanBnXkFtZTYwOTU2NTY3._V1_FMjpg_UX1000_.jpg",
    "category": "Drama"
  }
];
