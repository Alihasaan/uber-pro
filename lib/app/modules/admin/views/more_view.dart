import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_theme.dart';
import '../controllers/admin_controller.dart';

class MoreView extends GetView<AdminController> {
  const MoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      // appBar: AppBar(
      //   backgroundColor: AppColors.primary,
      //   elevation: 0,
      //   title: Text(
      //     'More',
      //     style: AppTextTheme.headline2.copyWith(color: Colors.white),
      //   ),
      // ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildMenuItem(
            icon: Icons.person,
            title: 'Profile',
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.settings,
            title: 'Settings',
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.help,
            title: 'Help & Support',
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.logout,
            title: 'Logout',
            onTap: () => (),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
