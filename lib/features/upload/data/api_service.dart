import 'dart:io';

import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();
  Future<String> uploadResume(File file) async {
    try {
      final formData = FormData.fromMap({
        'resume': await MultipartFile.fromFile(file.path, filename: file.path.split('/').last),
      });

      Response response = await _dio.post(
        'http://localhost:3000/upload',
        data: formData,
      );
      return response.data['message'];
    } catch (e) {
      print(e);
      return 'upload failed';
    }
  }
  }