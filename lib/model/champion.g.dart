// GENERATED CODE - DO NOT MODIFY BY HAND

part of champion;

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Champion _$ChampionFromJson(Map<String, dynamic> json) => new Champion(
    json['name'] as String,
    json['id'] as int,
    json['image'] as String,
    (json['tags'] as List)?.map((e) => e as String)?.toList(),
    (json['roles'] as List)?.map((e) => e as String)?.toList(),
    json['key'] as String);

abstract class _$ChampionSerializerMixin {
  String get name;
  int get id;
  String get image;
  List<String> get tags;
  List<String> get roles;
  String get key;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'id': id,
        'image': image,
        'tags': tags,
        'roles': roles,
        'key': key
      };
}
