import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:signature/signature.dart';
import '../models/car_part.dart';

class InspectionController extends GetxController {
  CameraController? cameraController;
  final signatureController = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
  );
  final isFlashOn = false.obs;
  final isCameraInitialized = false.obs;
  final isCapturing = false.obs;
  final currentPartIndex = 0.obs;
  final currentPart = CarPart(
    title: 'Front View'.tr,
    referenceImage: 'car_front.jpg',
    instructions: 'Capture the entire front view of the car'.tr,
  ).obs;

  final carParts = [
    CarPart(
      title: 'Front View'.tr,
      referenceImage: 'car_front.jpg',
      instructions: 'Capture the entire front view of the car'.tr,
    ),
    CarPart(
      title: 'Driver Side'.tr,
      referenceImage: 'car_driver_side.jpg',
      instructions: 'Capture the entire driver side of the car'.tr,
    ),
    CarPart(
      title: 'Passenger Side'.tr,
      referenceImage: 'car_passenger_side.jpg',
      instructions: 'Capture the entire passenger side of the car'.tr,
    ),
    CarPart(
      title: 'Rear View'.tr,
      referenceImage: 'car_rear.jpg',
      instructions: 'Capture the entire rear view of the car'.tr,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    initializeCamera();
  }

  @override
  void onClose() {
    cameraController?.dispose();
    signatureController.dispose();
    super.onClose();
  }

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) return;

    cameraController = CameraController(
      cameras.first,
      ResolutionPreset.high,
      enableAudio: false,
    );

    try {
      await cameraController?.initialize();
      isCameraInitialized.value = true;
    } catch (e) {
      Get.snackbar('Error', 'Failed to initialize camera');
    }
  }

  Future<void> toggleFlash() async {
    if (cameraController?.value.isInitialized ?? false) {
      final newValue = !isFlashOn.value;
      await cameraController?.setFlashMode(
        newValue ? FlashMode.torch : FlashMode.off,
      );
      isFlashOn.value = newValue;
    }
  }

  Future<void> switchCamera() async {
    final cameras = await availableCameras();
    if (cameras.length <= 1) return;

    final currentCameraIndex = cameras.indexOf(cameraController!.description);
    final newCameraIndex = (currentCameraIndex + 1) % cameras.length;

    await cameraController?.dispose();

    cameraController = CameraController(
      cameras[newCameraIndex],
      ResolutionPreset.high,
      enableAudio: false,
    );

    try {
      await cameraController?.initialize();
      isCameraInitialized.value = true;
    } catch (e) {
      Get.snackbar('Error', 'Failed to switch camera');
    }
  }

  Future<void> takePicture() async {
    if (isCapturing.value || !isCameraInitialized.value) return;

    try {
      isCapturing.value = true;
      final image = await cameraController?.takePicture();

      if (image != null) {
        // Process the captured image
        // You can save it to local storage or upload it to a server

        // Move to next part
        if (currentPartIndex.value < carParts.length - 1) {
          currentPartIndex.value++;
          currentPart.value = carParts[currentPartIndex.value];
        } else {
          // All parts captured
          Get.back(result: true);
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to capture image');
    } finally {
      isCapturing.value = false;
    }
  }

  Future<void> submitProtocol() async {
    try {
      final signature = await signatureController.toPngBytes();
      // Here you would typically upload the signature and other data
      // to your backend server

      Get.snackbar(
        'Success',
        'Protocol submitted successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.back();
    } catch (e) {
      Get.snackbar('Error', 'Failed to submit protocol');
    }
  }
}
