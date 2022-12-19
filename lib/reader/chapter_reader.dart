import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:logger/logger.dart';

import '../utils.dart';

class ChapterReader extends StatefulWidget {
  final List<ChapterParagraphModel> paragraphs;
  const ChapterReader({super.key, required this.paragraphs});

  @override
  State<ChapterReader> createState() => _ChapterReaderState();
}

class _ChapterReaderState extends State<ChapterReader> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();



    _scrollController.addListener(() {
      if (_scrollController.position.pixels == 0) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(
              duration: Duration(milliseconds: 300),
              content: Text("reach the top")));
      } else if (_scrollController.position.maxScrollExtent == _scrollController.position.pixels) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(
              duration: Duration(milliseconds: 300),
              content: Text("reach the bottom")));
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MColor.darkGray,
      child: Scrollbar(
        controller: _scrollController,
        child: ListView.builder(
            controller: _scrollController,
            itemCount: widget.paragraphs.length,
            itemBuilder: ((context, index) {
              double fontSize = 0;
              FontWeight fontWeight = FontWeight.normal;

              switch (widget.paragraphs[index].style) {
                case ParagraphStyle.Heading:
                  {
                    fontSize = 32;
                    fontWeight = FontWeight.bold;
                    break;
                  }
                case ParagraphStyle.SubHeading:
                  {
                    fontSize = 20;
                    fontWeight = FontWeight.w400;
                    break;
                  }
                case ParagraphStyle.Paragraph:
                  {
                    fontSize = 13;
                    fontWeight = FontWeight.w700;
                    break;
                  }
              }

              return Padding(
                padding: const EdgeInsets.only(
                    left: 32, right: 32, top: 8, bottom: 8),
                child: Text(
                  widget.paragraphs[index].text,
                  style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                      color: MColor.offWhite),
                ),
              );
            })),
      ),
    );
  }
}

class ChapterParagraphModel {
  final String id;
  final ParagraphStyle style;
  final String text;

  ChapterParagraphModel(
      {required this.id, required this.style, required this.text});
}

enum ParagraphStyle { Heading, SubHeading, Paragraph }
