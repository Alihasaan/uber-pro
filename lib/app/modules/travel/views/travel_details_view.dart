import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_theme.dart';
import '../../../core/widgets/custom_button.dart';
import '../controllers/travel_controller.dart';

class TravelDetailsView extends GetView<TravelController> {
  const TravelDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Travel Details'.tr,
          style: AppTextTheme.subtitle1.copyWith(color: AppColors.textPrimary),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order ID #${controller.ride.value['id'] ?? 'ABCDEF-GHIJK8'}'
                    .tr,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Travel Details'.tr,
                style: AppTextTheme.headline2.copyWith(
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Text(
                      'Travel Time: ${controller.ride.value['travelTime'] ?? '3H : 15M'}'
                          .tr,
                      style: AppTextTheme.subtitle1,
                    ),
                    const Spacer(),
                    Text(
                      'Date: ${controller.ride.value['date'] ?? '23 OCT 2024'}'
                          .tr,
                      style: AppTextTheme.subtitle1,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _buildLocationInfo(
                title: 'Pickup'.tr,
                time: controller.ride.value['pickupTime'] ??
                    '10:00 Uhr - 12:00 Uhr'.tr,
                location: controller.ride.value['from'] ??
                    'Nurenberg Truck Center (ab 31.5)'.tr,
                address: 'Leyherstabe\n90431 Nürenberg'.tr,
                isPickup: true,
              ),
              const SizedBox(height: 24),
              _buildLocationInfo(
                title: 'Dropoff'.tr,
                time: controller.ride.value['dropoffTime'] ??
                    '10:00 Uhr - 12:00 Uhr'.tr,
                location: controller.ride.value['to'] ??
                    'Nurenberg Truck Center (ab 31.5)'.tr,
                address: 'Leyherstabe\n90431 Nürenberg'.tr,
                isPickup: false,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(
          text: 'Start Transfer Protocol'.tr,
          onPressed: () => Get.toNamed('/transfer-protocol'),
        ),
      ),
    );
  }

  Widget _buildLocationInfo({
    required String title,
    required String time,
    required String location,
    required String address,
    required bool isPickup,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.background,
            border: Border.all(
              color: AppColors.primary,
              width: 2,
            ),
          ),
          child: Icon(
            isPickup ? Icons.arrow_upward : Icons.arrow_downward,
            size: 16,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  time,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                location,
                style: AppTextTheme.subtitle1.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                address,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
