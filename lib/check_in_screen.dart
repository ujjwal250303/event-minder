import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'face_recognition_service.dart';

class CheckInScreen extends StatelessWidget {
  final FaceRecognitionService _faceService = FaceRecognitionService();
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Check-In')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final XFile? image = await _picker.pickImage(source: ImageSource.camera);
            if (image != null) {
              bool verified = await _faceService.verifyFace(image);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(verified ? 'Check-in successful!' : 'Verification failed')),
              );
            }
          },
          child: Text('Check In with Face'),
        ),
      ),
    );
  }
}