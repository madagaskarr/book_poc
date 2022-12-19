import 'package:equatable/equatable.dart';

import '../../reader/chapter_reader.dart';

abstract class BookScreenState extends Equatable {}

class BookScreenInitialState extends BookScreenState {

  @override
  List<Object?> get props => [];
}

class NewChapterDidSelected extends BookScreenState {
  final List<ChapterParagraphModel> paragraphs;

  NewChapterDidSelected({required this.paragraphs});

  @override
  List<Object?> get props => [paragraphs];
}
