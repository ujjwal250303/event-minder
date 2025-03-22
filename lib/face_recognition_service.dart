import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class FaceRecognitionService {
  final FaceDetector _faceDetector = FaceDetector(options: FaceDetectorOptions());

  Future<bool> verifyFace(XFile image) async {
    try {
      final inputImage = InputImage.fromFilePath(image.path);
      final faces = await _faceDetector.processImage(inputImage);
      return faces.isNotEmpty; // Simple check; enhance with actual verification logic
    } catch (e) {
      print('Error detecting face: $e');
      return false;
    }
  }
}