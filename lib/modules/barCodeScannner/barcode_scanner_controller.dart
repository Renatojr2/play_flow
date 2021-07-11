import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payflow/modules/barCodeScannner/barcode_scanner_status.dart';

class BarcodeScannerController {
  var status = BarcodeScannerStatus();
  void getAvailableCamera() async {
    try {
      var response = await availableCameras();
      final camera = response.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.back);
      final cameraController = CameraController(
        camera,
        ResolutionPreset.max,
        enableAudio: false,
      );
      status = BarcodeScannerStatus.available(cameraController);
    } catch (e) {
      status = BarcodeScannerStatus.error(e.toString());
    }
  }

  // void scanWithImagePicker() async {
  //   final response = await ImagePicker().getImage(source: ImageSource.gallery);
  //   final inputImage = InputImage.fromFilePath(response.path);
  //   scannerBarCode(inputImage);
  // }

  // void scanWithCamera() {
  //   status = BarcodeScannerStatus.available();
  //   Future.delayed(Duration(seconds: 20)).then((value) {
  //     if (status.hasBarcode == false)
  //       status = BarcodeScannerStatus.error("Timeout de leitura de boleto");
  //   });
  // }

  void listenCamera() {
    if (status.cameraController.value.isStreamingImages == false)
      status.cameraController.startImageStream((cameraImage) async {
        if (status.stopScanner == false) {
          try {
            final WriteBuffer allBytes = WriteBuffer();
            for (Plane plane in cameraImage.planes) {
              allBytes.putUint8List(plane.bytes);
            }
            final bytes = allBytes.done().buffer.asUint8List();
            final Size imageSize = Size(
                cameraImage.width.toDouble(), cameraImage.height.toDouble());
            final InputImageRotation imageRotation =
                InputImageRotation.Rotation_0deg;
            final InputImageFormat inputImageFormat =
                InputImageFormatMethods.fromRawValue(cameraImage.format.raw) ??
                    InputImageFormat.NV21;
            final planeData = cameraImage.planes.map(
              (Plane plane) {
                return InputImagePlaneMetadata(
                  bytesPerRow: plane.bytesPerRow,
                  height: plane.height,
                  width: plane.width,
                );
              },
            ).toList();

            final inputImageData = InputImageData(
                size: imageSize,
                imageRotation: imageRotation,
                inputImageFormat: inputImageFormat,
                planeData: planeData);
            final inputImageCamera = InputImage.fromBytes(
                bytes: bytes, inputImageData: inputImageData);
            scannerBarCode(inputImageCamera);
          } catch (e) {
            print(e);
          }
        }
      });
  }

  void dispose() {
    statusNotifier.dispose();
    barcodeScanner.close();
    if (status.showCamera) {
      cameraController!.dispose();
    }
  }
}
