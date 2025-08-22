class MovieSuggestions {
  String? status;
  String? statusMessage;
  Data? data;
  Meta? meta;

  MovieSuggestions({this.status, this.statusMessage, this.data, this.meta});

  MovieSuggestions.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusMessage = json['status_message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    meta = json['@meta'] != null ? Meta.fromJson(json['@meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['status_message'] = statusMessage;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (meta != null) {
      data['@meta'] = meta!.toJson();
    }
    return data;
  }
}

class Data {
  int? movieCount;
  List<Movies>? movies;

  Data({this.movieCount, this.movies});

  Data.fromJson(Map<String, dynamic> json) {
    movieCount = json['movie_count'];
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
  String? state;
  List<Torrents>? torrents;
  String? dateUploaded;
  int? dateUploadedUnix;

  Movies(
      {this.id,
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
      this.state,
      this.torrents,
      this.dateUploaded,
      this.dateUploadedUnix});

  Movies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    imdbCode = json['imdb_code'];
    title = json['title'];
    titleEnglish = json['title_english'];
    titleLong = json['title_long'];
    slug = json['slug'];
    year = json['year'];
    rating = json['rating'];
    runtime = json['runtime'];
    genres = json['genres'].cast<String>();
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
    state = json['state'];
    if (json['torrents'] != null) {
      torrents = <Torrents>[];
      json['torrents'].forEach((v) {
        torrents!.add(Torrents.fromJson(v));
      });
    }
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
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
    data['state'] = state;
    if (torrents != null) {
      data['torrents'] = torrents!.map((v) => v.toJson()).toList();
    }
    data['date_uploaded'] = dateUploaded;
    data['date_uploaded_unix'] = dateUploadedUnix;
    return data;
  }
}

class Torrents {
  String? url;
  String? hash;
  String? quality;
  String? isRepack;
  String? videoCodec;
  String? bitDepth;
  String? audioChannels;
  int? seeds;
  int? peers;
  String? size;
  int? sizeBytes;
  String? dateUploaded;
  int? dateUploadedUnix;

  Torrents(
      {this.url,
      this.hash,
      this.quality,
      this.isRepack,
      this.videoCodec,
      this.bitDepth,
      this.audioChannels,
      this.seeds,
      this.peers,
      this.size,
      this.sizeBytes,
      this.dateUploaded,
      this.dateUploadedUnix});

  Torrents.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    hash = json['hash'];
    quality = json['quality'];
    isRepack = json['is_repack'];
    videoCodec = json['video_codec'];
    bitDepth = json['bit_depth'];
    audioChannels = json['audio_channels'];
    seeds = json['seeds'];
    peers = json['peers'];
    size = json['size'];
    sizeBytes = json['size_bytes'];
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['hash'] = hash;
    data['quality'] = quality;
    data['is_repack'] = isRepack;
    data['video_codec'] = videoCodec;
    data['bit_depth'] = bitDepth;
    data['audio_channels'] = audioChannels;
    data['seeds'] = seeds;
    data['peers'] = peers;
    data['size'] = size;
    data['size_bytes'] = sizeBytes;
    data['date_uploaded'] = dateUploaded;
    data['date_uploaded_unix'] = dateUploadedUnix;
    return data;
  }
}

class Meta {
  int? serverTime;
  String? serverTimezone;
  int? apiVersion;
  String? executionTime;

  Meta(
      {this.serverTime,
      this.serverTimezone,
      this.apiVersion,
      this.executionTime});

  Meta.fromJson(Map<String, dynamic> json) {
    serverTime = json['server_time'];
    serverTimezone = json['server_timezone'];
    apiVersion = json['api_version'];
    executionTime = json['execution_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['server_time'] = serverTime;
    data['server_timezone'] = serverTimezone;
    data['api_version'] = apiVersion;
    data['execution_time'] = executionTime;
    return data;
  }
}
