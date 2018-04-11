// GENERATED CODE - DO NOT MODIFY BY HAND

part of champion_response;

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

ChampionResponse _$ChampionResponseFromJson(Map<String, dynamic> json) =>
    new ChampionResponse(
        (json['champions'] as List)
            ?.map((e) => e == null
                ? null
                : new Champion.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        json['version'] as String);

abstract class _$ChampionResponseSerializerMixin {
  List<Champion> get champions;
  String get version;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'champions': champions, 'version': version};
}
