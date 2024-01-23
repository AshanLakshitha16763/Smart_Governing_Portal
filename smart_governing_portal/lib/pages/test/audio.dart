import 'dart:math';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UploadAudioToFirebase extends StatefulWidget {
  const UploadAudioToFirebase({Key? key}) : super(key: key);

  @override
  _UploadAudioToFirebaseState createState() => _UploadAudioToFirebaseState();
}

class _UploadAudioToFirebaseState extends State<UploadAudioToFirebase> {
  String _audioFileName = '';
  Uint8List? selectedAudioBytes;
  double uploadProgress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Audio"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_audioFileName.isNotEmpty || _audioFileName != '')
                Text(_audioFileName),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  pickAudio();
                },
                child: const Text('Pick Audio'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  await uploadAudio(selectedAudioBytes!);
                },
                child: const Text('Upload Audio To Firebase Storage'),
              ),
              const SizedBox(height: 20),
              if (uploadProgress > 0 && uploadProgress < 1)
                LinearProgressIndicator(value: uploadProgress),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pickAudio() async {
    try {
      FilePickerResult? fileResult = await FilePicker.platform.pickFiles(
        type: FileType.audio,
      );

      if (fileResult != null) {
        setState(() {
          _audioFileName = fileResult.files.first.name;
          selectedAudioBytes = fileResult.files.first.bytes;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  Future<String> uploadAudio(Uint8List selectedAudioBytes) async {
    try {
      Reference ref = FirebaseStorage.instance.ref().child('Audio/${_generateRandomString(8)}.mp3');

      final metadata = SettableMetadata(contentType: 'audio/mpeg');

      UploadTask uploadTask = ref.putData(
        selectedAudioBytes,
        metadata,
      );

      // Listen for state changes, errors, and completion of the upload.
      uploadTask.snapshotEvents.listen(
        (TaskSnapshot snapshot) {
          setState(() {
            uploadProgress = snapshot.bytesTransferred / snapshot.totalBytes;
          });
        },
        onError: (Object e) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Error: $e")));
        },
        onDone: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Audio Uploaded")));
          setState(() {
            uploadProgress = 0.0; // Reset progress after completion
          });
        },
      );

      return await ref.getDownloadURL();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
    return '';
  }

  String _generateRandomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    Random rnd = Random();
    return String.fromCharCodes(
      List.generate(length, (index) => chars.codeUnitAt(rnd.nextInt(chars.length))),
    );
  }
}
