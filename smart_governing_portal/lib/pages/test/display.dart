import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';

class UploadImageToFirebasea extends StatefulWidget {
  const UploadImageToFirebasea({Key? key}) : super(key: key);

  @override
  State<UploadImageToFirebasea> createState() => _UploadImageToFirebaseaState();
}

class _UploadImageToFirebaseaState extends State<UploadImageToFirebasea> {
  String _imageFile = '';
  Uint8List? selectedImageInBytes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Image"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_imageFile.isNotEmpty && _imageFile != '')
                Image.memory(selectedImageInBytes!),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  pickImage();
                },
                child: const Text('Pick Image'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  String downloadUrl = await uploadImage(selectedImageInBytes!);

                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Image Uploaded"),
                  ));

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ImageDisplayPage(imageUrl: downloadUrl),
                    ),
                  );
                },
                child: const Text('Upload Image To Firebase Storage'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    try {
      FilePickerResult? fileResult = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      if (fileResult != null) {
        setState(() {
          _imageFile = fileResult.files.first.name!;
          selectedImageInBytes = fileResult.files.first.bytes;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  Future<String> uploadImage(Uint8List selectedImageInBytes) async {
    try {
      Reference ref = FirebaseStorage.instance.ref().child('Images');
      final metadata = SettableMetadata(contentType: 'image/jpeg');
      UploadTask uploadTask = ref.putData(selectedImageInBytes, metadata);
      await uploadTask.whenComplete(() => ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Image Uploaded"))));
      return await ref.getDownloadURL();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
    return '';
  }
}

class ImageDisplayPage extends StatelessWidget {
  final String imageUrl;

  ImageDisplayPage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Display'),
      ),
      body: Center(
        child: Image.network(imageUrl),
      ),
    );
  }
}
