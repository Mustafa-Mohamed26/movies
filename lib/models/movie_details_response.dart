class MovieDetails {
  String? status;
  String? statusMessage;
  Data? data;
  Meta? meta;

  MovieDetails({this.status, this.statusMessage, this.data, this.meta});

  MovieDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusMessage = json['status_message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    meta = json['@meta'] != null ? Meta.fromJson(json['@meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['status_message'] = statusMessage;
    if (this.data != null) data['data'] = this.data!.toJson();
    if (meta != null) data['@meta'] = meta!.toJson();
    return data;
  }
}

class Data {
  Movie? movie;

  Data({this.movie});

  Data.fromJson(Map<String, dynamic> json) {
    movie = json['movie'] != null ? Movie.fromJson(json['movie']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (movie != null) data['movie'] = movie!.toJson();
    return data;
  }
}

class Movie {
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
  int? likeCount;
  String? descriptionIntro;
  String? descriptionFull;
  String? ytTrailerCode;
  String? language;
  String? mpaRating;

  Movie({
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
    this.likeCount,
    this.descriptionIntro,
    this.descriptionFull,
    this.ytTrailerCode,
    this.language,
    this.mpaRating,
  });

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    imdbCode = json['imdb_code'];
    title = json['title'];
    titleEnglish = json['title_english'];
    titleLong = json['title_long'];
    slug = json['slug'];
    year = json['year'];
    rating = (json['rating'] as num?)?.toDouble();
    runtime = json['runtime'];
    genres = (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList();
    likeCount = json['like_count'];
    descriptionIntro = json['description_intro'];
    descriptionFull = json['description_full'];
    ytTrailerCode = json['yt_trailer_code'];
    language = json['language'];
    mpaRating = json['mpa_rating'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
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
    data['like_count'] = likeCount;
    data['description_intro'] = descriptionIntro;
    data['description_full'] = descriptionFull;
    data['yt_trailer_code'] = ytTrailerCode;
    data['language'] = language;
    data['mpa_rating'] = mpaRating;
    return data;
  }
}

class Meta {
  int? serverTime;
  String? serverTimezone;
  int? apiVersion;
  String? executionTime;

  Meta({this.serverTime, this.serverTimezone, this.apiVersion, this.executionTime});

  Meta.fromJson(Map<String, dynamic> json) {
    serverTime = json['server_time'];
    serverTimezone = json['server_timezone'];
    apiVersion = json['api_version'];
    executionTime = json['execution_time'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['server_time'] = serverTime;
    data['server_timezone'] = serverTimezone;
    data['api_version'] = apiVersion;
    data['execution_time'] = executionTime;
    return data;
  }
}
