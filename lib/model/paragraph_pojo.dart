import 'package:json_annotation/json_annotation.dart';

part 'paragraph_pojo.g.dart';

@JsonSerializable()
class ParagraphPOJO {
  final String? id;
  final String? templateId;
  final String? text;

  ParagraphPOJO(
      {required this.id, required this.templateId, required this.text});

  factory ParagraphPOJO.fromJson(Map<String, dynamic> json) => _$ParagraphPOJOFromJson(json);

  Map<String, dynamic> toJson() => _$ParagraphPOJOToJson(this);
}
