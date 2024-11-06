import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/inspection_controller.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_theme.dart';
import '../../../core/widgets/custom_button.dart';

class CarInspectionView extends GetView<InspectionController> {
  const CarInspectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: Obx(() => Text(
              controller.currentPart.value.title,
              style: AppTextTheme.subtitle1.copyWith(color: Colors.white),
            )),
      ),
      body: Stack(
        children: [
          // Camera Preview
          Positioned.fill(
            child: Obx(() => controller.isCameraInitialized.value
                ? controller.cameraController?.buildPreview() ?? Container()
                : const Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  )),
          ),

          // Reference Image
          Positioned(
            top: 16,
            right: 16,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Obx(() => ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      'assets/images/${controller.currentPart.value.referenceImage}',
                      fit: BoxFit.contain,
                    ),
                  )),
            ),
          ),

          // Capture Guide
          Positioned(
            left: 16,
            right: 16,
            bottom: 100,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Obx(() => Text(
                    controller.currentPart.value.instructions,
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  )),
            ),
          ),

          // Progress Indicator
          Positioned(
            top: 16,
            left: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Obx(() => Text(
                    '${controller.currentPartIndex.value + 1}/${controller.carParts.length}',
                    style: const TextStyle(color: Colors.white),
                  )),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => controller.toggleFlash(),
                icon: Obx(() => Icon(
                      controller.isFlashOn.value
                          ? Icons.flash_on
                          : Icons.flash_off,
                      color: Colors.white,
                      size: 28,
                    )),
              ),
              GestureDetector(
                onTap: () => controller.takePicture(),
                child: Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4),
                  ),
                  child: Obx(
                    () => controller.isCapturing.value
                        ? const CircularProgressIndicator(
                            color: AppColors.primary)
                        : Container(),
                  ),
                ),
              ),
              IconButton(
                onPressed: () => controller.switchCamera(),
                icon: const Icon(
                  Icons.flip_camera_ios,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
