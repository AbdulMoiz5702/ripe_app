import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ChatProvider extends ChangeNotifier {


  String imagePath = '';

  Future<void> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imagePath = image.path;
    }
  }


}