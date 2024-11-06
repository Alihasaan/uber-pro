import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_pro/app/modules/home/views/widgets/cureent_ride_popup.dart';
import '../controllers/home_controller.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_theme.dart';
import 'widgets/ride_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'app_name'.tr,
          style: AppTextTheme.headline2.copyWith(color: AppColors.primary),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: controller.changeLanguage,
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                value: 'en',
                child: Text('English'),
              ),
              const PopupMenuItem(
                value: 'de',
                child: Text('Deutsch'),
              ),
              const PopupMenuItem(
                value: 'fr',
                child: Text('Français'),
              ),
            ],
            icon: const Icon(Icons.language, color: AppColors.primary),
          ),
        ],
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () => _showCurrentRidePopup(context),
            child: Container(
              color: AppColors.accent,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Current ride in progress'.tr,
                    style: AppTextTheme.subtitle1.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Obx(() => TextButton(
                        onPressed: () => controller.toggleStatus(true),
                        style: TextButton.styleFrom(
                          backgroundColor: controller.isActive.value
                              ? AppColors.primary
                              : Colors.transparent,
                        ),
                        child: Text(
                          'Active'.tr,
                          style: TextStyle(
                            color: controller.isActive.value
                                ? Colors.white
                                : AppColors.textSecondary,
                          ),
                        ),
                      )),
                ),
                Expanded(
                  child: Obx(() => TextButton(
                        onPressed: () => controller.toggleStatus(false),
                        style: TextButton.styleFrom(
                          backgroundColor: !controller.isActive.value
                              ? AppColors.primary
                              : Colors.transparent,
                        ),
                        child: Text(
                          'Delivered'.tr,
                          style: TextStyle(
                            color: !controller.isActive.value
                                ? Colors.white
                                : AppColors.textSecondary,
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: controller.rides.length,
                  itemBuilder: (context, index) {
                    final ride = controller.rides[index];
                    if ((ride['status'] == 'active') ==
                        controller.isActive.value) {
                      return RideCard(ride: ride);
                    }
                    return const SizedBox.shrink();
                  },
                )),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Home'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.history),
            label: 'History'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: 'Profile'.tr,
          ),
        ],
      ),
    );
  }

  void _showCurrentRidePopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => const CurrentRidePopup(),
    );
  }
}
