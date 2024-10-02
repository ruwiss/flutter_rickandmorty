// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:rickandmorty/models/info_model.dart';

class LocationModel {
  InfoModel info;
  final List<LocationItem> locations;

  LocationModel({
    required this.info,
    required this.locations,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'info': info.toMap(),
      'locations': locations.map((x) => x.toMap()).toList(),
    };
  }

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      info: InfoModel.fromMap(map['info'] as Map<String, dynamic>),
      locations: List<LocationItem>.from(
        (map['results'] as List).map<LocationItem>(
          (x) => LocationItem.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationModel.fromJson(String source) =>
      LocationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class LocationItem {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List residents;
  final String url;

  LocationItem({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type,
      'dimension': dimension,
      'residents': residents,
      'url': url,
    };
  }

  factory LocationItem.fromMap(Map<String, dynamic> map) {
    return LocationItem(
      id: map['id'] as int,
      name: map['name'] as String,
      type: map['type'] as String,
      dimension: map['dimension'] as String,
      residents: List.from((map['residents'] as List)),
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationItem.fromJson(String source) =>
      LocationItem.fromMap(json.decode(source) as Map<String, dynamic>);
}
