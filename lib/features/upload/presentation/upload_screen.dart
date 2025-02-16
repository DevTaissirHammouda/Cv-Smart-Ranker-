import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/api_provider.dart';
import '../../../providers/file_provider.dart';

class UploadScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFile = ref.watch(fileProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Resume'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Button to select PDF file
            ElevatedButton(
              onPressed: () async {
                // Open file picker for PDF files only
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf'],
                );

                if (result != null) {
                  // Store selected file in Riverpod provider
                  ref.read(fileProvider.notifier).state = result.files.first;
                }
              },
              child: Text("Select PDF"),
            ),
            SizedBox(height: 20),

            // Display the selected file name


            // Upload button is enabled only if a file is selected
            ElevatedButton(
              onPressed: selectedFile != null
                  ? () async {
                final file = File(selectedFile.path!);
                final apiService = ref.read(apiProvider);
                String message = await apiService.uploadResume(file);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(message),
                ));
              }
                  : null,  // Disable button if no file is selected
              child: Text("Upload Resume"),
            ),
            if (selectedFile != null)
              Column(
                children: [
                  Text("Selected File: ${selectedFile.name}"),  // Show file name
                  SizedBox(height: 10),
                  // Button to remove the selected file
                  ElevatedButton(
                    onPressed: () {
                      // Clear the selected file
                      ref.read(fileProvider.notifier).state = null;
                    },
                    child: Text("Clear File"),
                  ),
                ],
              ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
