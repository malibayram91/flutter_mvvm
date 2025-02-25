// To parse this JSON data, do
//
//     final moviesMain = moviesMainFromJson(jsonString);

import 'dart:convert';

MoviesMain moviesMainFromJson(String str) =>
    MoviesMain.fromJson(json.decode(str));

String moviesMainToJson(MoviesMain data) => json.encode(data.toJson());

class MoviesMain {
  MoviesMain({
    this.movies,
  });

  List<Movie>? movies;

  factory MoviesMain.fromJson(Map<String, dynamic> json) => MoviesMain(
        movies: json["movies"] == null
            ? null
            : List<Movie>.from(json["movies"].map((x) => Movie.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "movies": movies == null
            ? null
            : List<dynamic>.from(movies!.map((x) => x.toJson())),
      };
}

class Movie {
  Movie({
    this.id,
    this.title,
    this.year,
    this.genres,
    this.ratings,
    this.poster,
    this.contentRating,
    this.duration,
    this.releaseDate,
    this.averageRating,
    // this.originalTitle,
    this.storyline,
    this.actors,
    this.imdbRating,
    this.posterurl,
  });

  String? id;
  String? title;
  String? year;
  List<String>? genres;
  List<int>? ratings;
  String? poster;
  String? contentRating;
  String? duration;
  String? releaseDate;
  int? averageRating;
  // OriginalTitle? originalTitle;
  String? storyline;
  List<String>? actors;
  dynamic imdbRating;
  String? posterurl;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["id"],
        title: json["title"],
        year: json["year"],
        genres: json["genres"] == null
            ? null
            : List<String>.from(json["genres"].map((x) => x)),
        ratings: json["ratings"] == null
            ? null
            : List<int>.from(json["ratings"].map((x) => x)),
        poster: json["poster"],
        contentRating: json["contentRating"],
        duration: json["duration"],
        releaseDate: json["releaseDate"],
        averageRating: json["averageRating"],
        // originalTitle: json["originalTitle"] == null ? null : originalTitleValues.map[json["originalTitle"]],
        storyline: json["storyline"],
        actors: json["actors"] == null
            ? null
            : List<String>.from(json["actors"].map((x) => x)),
        imdbRating: json["imdbRating"],
        posterurl: json["posterurl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "year": year,
        "genres":
            genres == null ? null : List<dynamic>.from(genres!.map((x) => x)),
        "ratings":
            ratings == null ? null : List<dynamic>.from(ratings!.map((x) => x)),
        "poster": poster,
        "contentRating": contentRating,
        "duration": duration,
        "releaseDate": releaseDate,
        "averageRating": averageRating,
        // "originalTitle": originalTitle == null ? null : originalTitleValues.reverse[originalTitle],
        "storyline": storyline,
        "actors":
            actors == null ? null : List<dynamic>.from(actors!.map((x) => x)),
        "imdbRating": imdbRating,
        "posterurl": posterurl,
      };
}

// enum OriginalTitle { EMPTY, ANNIHILATION, A_WRINKLE_IN_TIME, THE_LEISURE_SEEKER, CE_QUI_NOUS_LIE }

/*final originalTitleValues = EnumValues({
  "Annihilation": OriginalTitle.ANNIHILATION,
  "A Wrinkle in Time": OriginalTitle.A_WRINKLE_IN_TIME,
  "Ce qui nous lie": OriginalTitle.CE_QUI_NOUS_LIE,
  "": OriginalTitle.EMPTY,
  "The Leisure Seeker": OriginalTitle.THE_LEISURE_SEEKER
});*/

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));

    return reverseMap!;
  }
}
