import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_theme.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';

class ResetPasswordView extends GetView<AuthController> {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, String>;
    final email = args['email']!;
    final code = args['code']!;
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'New Password',
                style: AppTextTheme.headline1.copyWith(
                  color: AppColors.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Enter your new password',
                style: AppTextTheme.subtitle1.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              CustomTextField(
                label: 'New Password',
                hint: 'Enter new password',
                controller: newPasswordController,
                obscureText: true,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Confirm Password',
                hint: 'Confirm new password',
                controller: confirmPasswordController,
                obscureText: true,
              ),
              const SizedBox(height: 32),
              Obx(() => CustomButton(
                    text: 'Reset Password',
                    onPressed: () {
                      if (newPasswordController.text ==
                          confirmPasswordController.text) {
                        controller.resetPassword(
                          email,
                          code,
                          newPasswordController.text,
                        );
                      } else {
                        Get.snackbar(
                          'Error',
                          'Passwords do not match',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                    },
                    isLoading: controller.isLoading,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
