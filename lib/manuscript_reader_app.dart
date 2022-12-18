import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'screens/book_screen.dart';

class ManuscriptReaderApp extends StatelessWidget {
  const ManuscriptReaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BookScreen(),
    );
  }
}