import 'package:image_picker/image_picker.dart';

class PickerImageManager {
  Future<XFile?> pickImage(ImageSource source) async {
    try {
      final file = await ImagePicker().pickImage(source: source, imageQuality: 50);
      return file;
    } catch (e) {
      return null;
    }
  }
}

// do the bloc and inject this class
