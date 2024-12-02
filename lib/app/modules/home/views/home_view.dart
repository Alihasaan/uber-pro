import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uber_pro/app/modules/home/views/widgets/cureent_ride_popup.dart';
import '../../../data/providers/api_provider.dart';
import '../controllers/home_controller.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_theme.dart';
import 'widgets/ride_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  Future<void> _handleLanguageChange(String langCode) async {
    controller.changeLanguage(langCode);
    // Save language preference
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', langCode);
  }

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
          IconButton(
            onPressed: () {
              Get.toNamed('/admin/orders');
            },
            icon: const Icon(Icons.security, color: AppColors.primary),
          ),
          IconButton(
            onPressed: () async {
              final ApiProvider apiProvider = Get.find<ApiProvider>();
              await apiProvider.logout();
            },
            icon: const Icon(Icons.logout, color: AppColors.primary),
          ),
          PopupMenuButton<String>(
            onSelected: _handleLanguageChange,
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: 'en',
                child: Row(
                  children: [
                    Obx(() => controller.currentLanguage.value == 'en'
                        ? const Icon(Icons.check, color: AppColors.primary)
                        : const SizedBox(width: 24)),
                    const SizedBox(width: 8),
                    const Text('English'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'de',
                child: Row(
                  children: [
                    Obx(() => controller.currentLanguage.value == 'de'
                        ? const Icon(Icons.check, color: AppColors.primary)
                        : const SizedBox(width: 24)),
                    const SizedBox(width: 8),
                    const Text('Deutsch'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'fr',
                child: Row(
                  children: [
                    Obx(() => controller.currentLanguage.value == 'fr'
                        ? const Icon(Icons.check, color: AppColors.primary)
                        : const SizedBox(width: 24)),
                    const SizedBox(width: 8),
                    const Text('Français'),
                  ],
                ),
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
                    'current_ride_progress'.tr,
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
                          'active'.tr,
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
                          'delivered'.tr,
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
            label: 'home'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.history),
            label: 'history'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: 'profile'.tr,
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
