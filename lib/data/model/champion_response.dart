library champion_response;

import 'package:flutternw/data/model/champion.dart';
import 'package:json_annotation/json_annotation.dart';

part 'champion_response.g.dart';


@JsonSerializable()
class ChampionResponse extends Object with _$ChampionResponseSerializerMixin{

  ChampionResponse(this.champions, this.version);

  @JsonKey(name: 'champions')
  final List<Champion> champions;
  @JsonKey(name: 'version')
  final String version;

  // A necessary factory constructor for creating a new User instance
  /// from a map. We pass the map to the generated _$UserFromJson constructor.
  /// The constructor is named after the source class, in this case User.
  factory ChampionResponse.fromJson(Map<String, dynamic> json) =>
      _$ChampionResponseFromJson(json);
}