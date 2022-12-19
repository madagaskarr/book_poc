import 'paragraph_pojo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chapter_pojo.g.dart';

@JsonSerializable(explicitToJson: true)
class ChapterPOJO {
  final String? id;
  final String? title;
  final String? imageSrc;
  final List<ParagraphPOJO>? paragraphs;

  ChapterPOJO({required this.id, required this.title, required this.imageSrc, required this.paragraphs});

  factory ChapterPOJO.fromJson(Map<String, dynamic> json) => _$ChapterPOJOFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterPOJOToJson(this);
}
