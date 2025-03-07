// To parse this JSON data, do
//
//     final movieList = movieListFromJson(jsonString);

import 'dart:convert';

MovieList movieListFromJson(String str) => MovieList.fromJson(json.decode(str));

String movieListToJson(MovieList data) => json.encode(data.toJson());

class MovieList {
  final Response response;
  final Data data;

  MovieList({
    required this.response,
    required this.data,
  });

  factory MovieList.fromJson(Map<String, dynamic> json) => MovieList(
        response: Response.fromJson(json["response"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "response": response.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  final List<Movie> movies;
  final Pagination pagination;

  Data({
    required this.movies,
    required this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        movies: List<Movie>.from(json["movies"].map((x) => Movie.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "movies": List<dynamic>.from(movies.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
      };
}

class Movie {
  final String id;
  final String movieId;
  final String title;
  final String year;
  final String rated;
  final String released;
  final String runtime;
  final String genre;
  final String director;
  final String writer;
  final String actors;
  final String plot;
  final String language;
  final String country;
  final String awards;
  final String poster;
  final String metascore;
  final String imdbRating;
  final String imdbVotes;
  final String imdbId;
  final String type;
  final String response;
  final List<String> images;
  final bool comingSoon;
  final bool isFavorite;

  Movie({
    required this.id,
    required this.movieId,
    required this.title,
    required this.year,
    required this.rated,
    required this.released,
    required this.runtime,
    required this.genre,
    required this.director,
    required this.writer,
    required this.actors,
    required this.plot,
    required this.language,
    required this.country,
    required this.awards,
    required this.poster,
    required this.metascore,
    required this.imdbRating,
    required this.imdbVotes,
    required this.imdbId,
    required this.type,
    required this.response,
    required this.images,
    required this.comingSoon,
    required this.isFavorite,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["_id"],
        movieId: json["id"],
        title: json["Title"],
        year: json["Year"],
        rated: json["Rated"],
        released: json["Released"],
        runtime: json["Runtime"],
        genre: json["Genre"],
        director: json["Director"],
        writer: json["Writer"],
        actors: json["Actors"],
        plot: json["Plot"],
        language: json["Language"],
        country: json["Country"],
        awards: json["Awards"],
        poster: json["Poster"],
        metascore: json["Metascore"],
        imdbRating: json["imdbRating"],
        imdbVotes: json["imdbVotes"],
        imdbId: json["imdbID"],
        type: json["Type"],
        response: json["Response"],
        images: List<String>.from(json["Images"].map((x) => x)),
        comingSoon: json["ComingSoon"],
        isFavorite: json["isFavorite"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "id": movieId,
        "Title": title,
        "Year": year,
        "Rated": rated,
        "Released": released,
        "Runtime": runtime,
        "Genre": genre,
        "Director": director,
        "Writer": writer,
        "Actors": actors,
        "Plot": plot,
        "Language": language,
        "Country": country,
        "Awards": awards,
        "Poster": poster,
        "Metascore": metascore,
        "imdbRating": imdbRating,
        "imdbVotes": imdbVotes,
        "imdbID": imdbId,
        "Type": type,
        "Response": response,
        "Images": List<dynamic>.from(images.map((x) => x)),
        "ComingSoon": comingSoon,
        "isFavorite": isFavorite,
      };

  Movie copyWith({
    String? id,
    String? movieId,
    String? title,
    String? year,
    String? rated,
    String? released,
    String? runtime,
    String? genre,
    String? director,
    String? writer,
    String? actors,
    String? plot,
    String? language,
    String? country,
    String? awards,
    String? poster,
    String? metascore,
    String? imdbRating,
    String? imdbVotes,
    String? imdbId,
    String? type,
    String? response,
    List<String>? images,
    bool? comingSoon,
    bool? isFavorite,
  }) {
    return Movie(
      id: id ?? this.id,
      movieId: movieId ?? this.movieId,
      title: title ?? this.title,
      year: year ?? this.year,
      rated: rated ?? this.rated,
      released: released ?? this.released,
      runtime: runtime ?? this.runtime,
      genre: genre ?? this.genre,
      director: director ?? this.director,
      writer: writer ?? this.writer,
      actors: actors ?? this.actors,
      plot: plot ?? this.plot,
      language: language ?? this.language,
      country: country ?? this.country,
      awards: awards ?? this.awards,
      poster: poster ?? this.poster,
      metascore: metascore ?? this.metascore,
      imdbRating: imdbRating ?? this.imdbRating,
      imdbVotes: imdbVotes ?? this.imdbVotes,
      imdbId: imdbId ?? this.imdbId,
      type: type ?? this.type,
      response: response ?? this.response,
      images: images ?? this.images,
      comingSoon: comingSoon ?? this.comingSoon,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

class Pagination {
  final int totalCount;
  final int perPage;
  final int maxPage;
  final int currentPage;

  Pagination({
    required this.totalCount,
    required this.perPage,
    required this.maxPage,
    required this.currentPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        totalCount: json["totalCount"],
        perPage: json["perPage"],
        maxPage: json["maxPage"],
        currentPage: json["currentPage"],
      );

  Map<String, dynamic> toJson() => {
        "totalCount": totalCount,
        "perPage": perPage,
        "maxPage": maxPage,
        "currentPage": currentPage,
      };
}

class Response {
  final int code;
  final String message;

  Response({
    required this.code,
    required this.message,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
