// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'info_model.dart';

class EpisodesModel {
  InfoModel info;
  final List<EpisodeModel> episodes;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'info': info.toMap(),
      'episodes': episodes.map((x) => x.toMap()).toList(),
    };
  }

  factory EpisodesModel.fromMap(Map<String, dynamic> map) {
    return EpisodesModel(
      info: InfoModel.fromMap(map['info'] as Map<String, dynamic>),
      episodes: List<EpisodeModel>.from(
        (map['results'] as List).map<EpisodeModel>(
          (x) => EpisodeModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory EpisodesModel.fromJson(String source) =>
      EpisodesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  EpisodesModel({required this.info, required this.episodes});
}

class EpisodeModel {
  final int id;
  final String name;
  final String episode;
  final List<String> characters;
  final String url;
  EpisodeModel({
    required this.id,
    required this.name,
    required this.episode,
    required this.characters,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'episode': episode,
      'characters': characters,
      'url': url,
    };
  }

  factory EpisodeModel.fromMap(Map<String, dynamic> map) {
    final episodeString = map['episode'] as String;
    final episodeList = episodeString.replaceAll('S', '').split('E');
    return EpisodeModel(
      id: map['id'] as int,
      name: map['name'] as String,
      episode:
          'Sezon ${int.parse(episodeList.first)} Bölüm ${int.parse(episodeList.last)}',
      characters: List<String>.from(
        (map['characters'] as List),
      ),
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EpisodeModel.fromJson(String source) =>
      EpisodeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
