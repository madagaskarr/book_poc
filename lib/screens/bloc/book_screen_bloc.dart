import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:collection/collection.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:manuscript_reader_flutter/model/chapter_pojo.dart';
import 'package:manuscript_reader_flutter/reader/chapter_reader.dart';
import 'package:manuscript_reader_flutter/screens/bloc/book_screen_states.dart';

import 'book_screen_events.dart';

class BookScreenBloc extends Bloc<BookScreenEvent, BookScreenState> {
  BookScreenBloc() : super(BookScreenInitialState()) {
    on((event, emit) async {
      if (event is SelectNewChapterEvent) {
        String data =
            await rootBundle.loadString("assets/mocks/beseda-${event.id}.json");
        final jsonResult = await jsonDecode(data);
        ChapterPOJO chapterPOJO = ChapterPOJO.fromJson(jsonResult);

        if (chapterPOJO.paragraphs != null) {
          var chaptersUi = chapterPOJO.paragraphs!
              .map((json) => ChapterParagraphModel(
                  id: json.id ?? "",
                  style: _getStyle(json.templateId ?? ""),
                  text: json.text ?? ""))
              .toList();
          emit(NewChapterDidSelected(paragraphs: chaptersUi));
        }
      }
    });
  }

  ParagraphStyle _getStyle(String templateId) {
    if (templateId == "BANNER_PARAGRAPH") {
      return ParagraphStyle.Heading;
    }
    return ParagraphStyle.Paragraph;
  }
}
