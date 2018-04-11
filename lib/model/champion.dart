library champion;

import 'package:json_annotation/json_annotation.dart';

part 'champion.g.dart';

@JsonSerializable()
class Champion extends Object with _$ChampionSerializerMixin {
  Champion(this.name, this.id, this.image, this.tags, this.roles, this.key);

  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'image')
  String image;
  @JsonKey(name: 'tags')
  List<String> tags;
  @JsonKey(name: 'roles')
  List<String> roles;
  @JsonKey(name: 'key')
  String key;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. We pass the map to the generated _$UserFromJson constructor.
  /// The constructor is named after the source class, in this case User.
  factory Champion.fromJson(Map<String, dynamic> json) =>
      _$ChampionFromJson(json);
}
