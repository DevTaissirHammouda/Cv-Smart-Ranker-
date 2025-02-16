


import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/api_provider.dart';
import '../../../providers/file_provider.dart';

class UploadScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final selectedFile = ref.watch(fileProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Resume'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                if (selectedFile != null) {
                  final file = File(selectedFile.path!);
                  final apiService = ref.read(apiProvider);
                  String message = await apiService.uploadResume(file);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(message),
                  )
                  );
                }

              },
              child: Text("Upload Resume"),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed:() {ref.read(fileProvider.notifier).state=null;},
                child: Text('Clear')
            ),
          ],
        ),

      ),

    );
  }
}