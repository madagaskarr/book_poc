import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:manuscript_reader_flutter/screens/bloc/book_screen_bloc.dart';
import 'package:manuscript_reader_flutter/screens/bloc/book_screen_states.dart';

import '../chapter_selector/chapter_selector.dart';
import '../model/chapter_pojo.dart';
import '../reader/chapter_reader.dart';
import 'bloc/book_screen_events.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  List<ChapterParagraphModel> _chapters = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => BookScreenBloc()),
      child: BlocBuilder<BookScreenBloc, BookScreenState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<BookScreenBloc>(context, listen: false);

          if (state is NewChapterDidSelected) {
            _chapters = state.paragraphs;
          }

          return Scaffold(
            body: Row(
              children: [
                ChapterSelector(
                  chapters: [
                    ChapterModel(id: 1, title: "В Древнем Котле"),
                    ChapterModel(id: 2, title: "Восхождение"),
                  ],
                  onChapterSelected: ((chapterId) {
                    bloc.add(SelectNewChapterEvent(id: chapterId));
                  }),
                ),
                Expanded(child: ChapterReader(paragraphs: _chapters))
              ],
            ),
          );
        },
      ),
    );
  }

  void _onChapterSelected(int chapterId) {
    print(chapterId);
  }
}
