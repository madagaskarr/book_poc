import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:manuscript_reader_flutter/reader/chapter_reader.dart';

import '../utils.dart';

class ChapterSelector extends StatefulWidget {
  final List<ChapterModel> chapters;
  final void Function(int) onChapterSelected;
  const ChapterSelector(
      {super.key, required this.chapters, required this.onChapterSelected});

  @override
  State<ChapterSelector> createState() => _ChapterSelectorState();
}

class _ChapterSelectorState extends State<ChapterSelector> {
  double _menuBarWidth = 350;
  IconData _menuBarIcon = Icons.cached_outlined;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      AnimatedContainer(
        color: MColor.darkBlack,
        width: _menuBarWidth,
        duration: const Duration(milliseconds: 300),
        child: ListView.builder(
            itemCount: widget.chapters.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 120,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MColor.blue)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 4, right: 4, top: 4, bottom: 4),
                      child: Text(
                        widget.chapters[index].title,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onPressed: () {
                      widget.onChapterSelected(widget.chapters[index].id);
                    },
                  ),
                ),
              );
            })),
      ),
      Positioned(
          bottom: 64,
          width: 64,
          height: 64,
          left: 16,
          child: Container(
              color: Colors.black,
              child: TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(MColor.offWhite)),
                  onPressed: () {
                    setState(() {
                      if (_menuBarWidth == 350) {
                        _menuBarWidth = 170;
                        _menuBarIcon = Icons.aspect_ratio;
                      } else {
                        _menuBarWidth = 350;
                        _menuBarIcon = Icons.cached_outlined;
                      }
                    });
                  },
                  child: Icon(_menuBarIcon))))
    ]);
  }
}

class ChapterModel {
  final int id;
  final String title;

  ChapterModel({required this.id, required this.title});
}
