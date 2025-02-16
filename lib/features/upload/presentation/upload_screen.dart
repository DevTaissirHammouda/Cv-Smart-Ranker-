


import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
                final file = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf'],
                );
                if (file != null) {
                  ref.read(fileProvider.notifier).state = file.files.first;
                }
              },
              child: Text('Select pdf'),
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