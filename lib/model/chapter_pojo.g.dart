// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_pojo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChapterPOJO _$ChapterPOJOFromJson(Map<String, dynamic> json) => ChapterPOJO(
      id: json['id'] as String?,
      title: json['title'] as String?,
      imageSrc: json['imageSrc'] as String?,
      paragraphs: (json['paragraphs'] as List<dynamic>?)
          ?.map((e) => ParagraphPOJO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChapterPOJOToJson(ChapterPOJO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imageSrc': instance.imageSrc,
      'paragraphs': instance.paragraphs?.map((e) => e.toJson()).toList(),
    };
