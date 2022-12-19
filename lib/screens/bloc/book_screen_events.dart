import 'package:equatable/equatable.dart';

abstract class BookScreenEvent extends Equatable {}

class SelectNewChapterEvent extends BookScreenEvent {
  final int id;
  SelectNewChapterEvent({required this.id});
  
  @override
  List<Object?> get props => [id];
}
