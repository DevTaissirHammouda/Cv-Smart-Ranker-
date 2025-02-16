import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fileProvider = StateProvider<PlatformFile?>((ref) => null);