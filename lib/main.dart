
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/upload/presentation/upload_screen.dart';

void main() {
  runApp(ProviderScope(child :MyApp()));
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Smart Resume Ranker",
      home:UploadScreen(),
    );
    throw UnimplementedError();
  }
}