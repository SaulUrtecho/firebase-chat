import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageOptionsDialog extends StatelessWidget {
  const ImageOptionsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: const Text(
              'Seleccionar imagen',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            onTap: () => Navigator.pop(context, ImageSource.camera),
            leading: const Icon(Icons.camera_alt),
            title: const Text('Cámara'),
          ),
          ListTile(
            onTap: () => Navigator.pop(context, ImageSource.gallery),
            leading: const Icon(Icons.image),
            title: const Text('Galería'),
          ),
        ],
      ),
    );
  }
}
