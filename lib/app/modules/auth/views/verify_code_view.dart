// TODO Implement this library.import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_theme.dart';
import '../../../core/widgets/custom_button.dart';

class VerifyCodeView extends GetView<AuthController> {
  const VerifyCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final email = Get.arguments['email'] as String;
    final codeController = TextEditingController();
    final focusNodes = List.generate(8, (index) => FocusNode());
    final controllers = List.generate(8, (index) => TextEditingController());

    void onCodeChanged(String value, int index) {
      if (value.length == 1 && index < 7) {
        focusNodes[index + 1].requestFocus();
      }
      String code = controllers.map((c) => c.text).join();
      if (code.length == 8) {
        controller.verifyCode(email, code);
      }
    }

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
                'Verify Code',
                style: AppTextTheme.headline1.copyWith(
                  color: AppColors.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Enter the 8-digit code sent to your email',
                style: AppTextTheme.subtitle1.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  8,
                  (index) => SizedBox(
                    width: 40,
                    child: TextField(
                      controller: controllers[index],
                      focusNode: focusNodes[index],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counterText: '',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: AppColors.textSecondary.withOpacity(0.2),
                          ),
                        ),
                      ),
                      onChanged: (value) => onCodeChanged(value, index),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Obx(() => CustomButton(
                    text: 'Verify Code',
                    onPressed: () {
                      String code = controllers.map((c) => c.text).join();
                      controller.verifyCode(email, code);
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
