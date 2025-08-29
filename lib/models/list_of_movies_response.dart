class ListOfMoviesResponse {
  String? status;
  String? statusMessage;
  Data? data;

  ListOfMoviesResponse({this.status, this.statusMessage, this.data});

  ListOfMoviesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusMessage = json['status_message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['status_message'] = statusMessage;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? movieCount;
  int? limit;
  int? pageNumber;
  List<Movies>? movies;

  Data({this.movieCount, this.limit, this.pageNumber, this.movies});

  Data.fromJson(Map<String, dynamic> json) {
    movieCount = json['movie_count'] is int ? json['movie_count'] : int.tryParse('${json['movie_count']}');
    limit = json['limit'] is int ? json['limit'] : int.tryParse('${json['limit']}');
    pageNumber = json['page_number'] is int ? json['page_number'] : int.tryParse('${json['page_number']}');
    if (json['movies'] != null) {
      movies = <Movies>[];
      json['movies'].forEach((v) {
        movies!.add(Movies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['movie_count'] = movieCount;
    data['limit'] = limit;
    data['page_number'] = pageNumber;
    if (movies != null) {
      data['movies'] = movies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Movies {
  int? id;
  String? url;
  String? imdbCode;
  String? title;
  String? titleEnglish;
  String? titleLong;
  String? slug;
  int? year;
  double? rating;
  int? runtime;
  List<String>? genres;
  String? summary;
  String? descriptionFull;
  String? synopsis;
  String? ytTrailerCode;
  String? language;
  String? mpaRating;
  String? backgroundImage;
  String? backgroundImageOriginal;
  String? smallCoverImage;
  String? mediumCoverImage;
  String? largeCoverImage;
  String? state;
  String? dateUploaded;
  int? dateUploadedUnix;

  Movies({
    this.id,
    this.url,
    this.imdbCode,
    this.title,
    this.titleEnglish,
    this.titleLong,
    this.slug,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.summary,
    this.descriptionFull,
    this.synopsis,
    this.ytTrailerCode,
    this.language,
    this.mpaRating,
    this.backgroundImage,
    this.backgroundImageOriginal,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.state,
    this.dateUploaded,
    this.dateUploadedUnix,
  });

  Movies.fromJson(Map<String, dynamic> json) {
    id = json['id'] is int ? json['id'] : int.tryParse('${json['id']}');
    url = json['url'];
    imdbCode = json['imdb_code'];
    title = json['title'];
    titleEnglish = json['title_english'];
    titleLong = json['title_long'];
    slug = json['slug'];
    year = json['year'] is int ? json['year'] : int.tryParse('${json['year']}');

    // 👇 Safely cast rating (int or double)
    rating = json['rating'] != null ? (json['rating'] as num).toDouble() : null;

    runtime = json['runtime'] is int ? json['runtime'] : int.tryParse('${json['runtime']}');
    genres = json['genres'] != null ? List<String>.from(json['genres']) : null;
    summary = json['summary'];
    descriptionFull = json['description_full'];
    synopsis = json['synopsis'];
    ytTrailerCode = json['yt_trailer_code'];
    language = json['language'];
    mpaRating = json['mpa_rating'];
    backgroundImage = json['background_image'];
    backgroundImageOriginal = json['background_image_original'];
    smallCoverImage = json['small_cover_image'];
    mediumCoverImage = json['medium_cover_image'];
    largeCoverImage = json['large_cover_image'];
    state = json['state'];
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'] is int
        ? json['date_uploaded_unix']
        : int.tryParse('${json['date_uploaded_unix']}');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['imdb_code'] = imdbCode;
    data['title'] = title;
    data['title_english'] = titleEnglish;
    data['title_long'] = titleLong;
    data['slug'] = slug;
    data['year'] = year;
    data['rating'] = rating;
    data['runtime'] = runtime;
    data['genres'] = genres;
    data['summary'] = summary;
    data['description_full'] = descriptionFull;
    data['synopsis'] = synopsis;
    data['yt_trailer_code'] = ytTrailerCode;
    data['language'] = language;
    data['mpa_rating'] = mpaRating;
    data['background_image'] = backgroundImage;
    data['background_image_original'] = backgroundImageOriginal;
    data['small_cover_image'] = smallCoverImage;
    data['medium_cover_image'] = mediumCoverImage;
    data['large_cover_image'] = largeCoverImage;
    data['state'] = state;
    data['date_uploaded'] = dateUploaded;
    data['date_uploaded_unix'] = dateUploadedUnix;
    return data;
  }
}
