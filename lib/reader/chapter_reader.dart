import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChapterReader extends StatelessWidget {
  final List<ChapterParagraphModel> paragraphs;
  const ChapterReader({super.key, required this.paragraphs});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: ListView.builder(
          itemCount: paragraphs.length,
          itemBuilder: ((context, index) {
            double fontSize = 0;
            FontWeight fontWeight = FontWeight.normal;

            switch (paragraphs[index].style) {
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
              padding: const EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 8),
              child: Text(
                paragraphs[index].text,
                style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
              ),
            );
          })),
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
