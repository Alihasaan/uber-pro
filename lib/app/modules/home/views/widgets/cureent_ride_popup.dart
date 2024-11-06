import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/widgets/custom_button.dart';

class CurrentRidePopup extends StatelessWidget {
  const CurrentRidePopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ride in progress',
                  style: AppTextTheme.headline2.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 24),
                _buildLocationInfo(
                  title: 'Pickup',
                  time: '10:00 Uhr - 12:00 Uhr',
                  location: 'Nurenberg Truck Center (ab 31.5)',
                  address: 'Leyherstabe\n90431 Nürenberg',
                  isPickup: true,
                ),
                const SizedBox(height: 20),
                _buildLocationInfo(
                  title: 'Dropoff',
                  time: '10:00 Uhr - 12:00 Uhr',
                  location: 'Nurenberg Truck Center (ab 31.5)',
                  address: 'Leyherstabe\n90431 Nürenberg',
                  isPickup: false,
                ),
                const SizedBox(height: 24),
                CustomButton(
                  text: 'End Ride',
                  onPressed: () {
                    Get.back();
                    Get.toNamed('/transfer-protocol');
                  },
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
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
            color: isPickup ? AppColors.primary : Colors.grey[300],
          ),
          child: Icon(
            isPickup ? Icons.arrow_upward : Icons.arrow_downward,
            size: 16,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  time,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
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
