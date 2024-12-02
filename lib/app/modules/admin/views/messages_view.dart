import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_theme.dart';
import '../controllers/admin_controller.dart';

class MessagesView extends GetView<AdminController> {
  const MessagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      // appBar: AppBar(
      //   backgroundColor: AppColors.primary,
      //   elevation: 0,
      //   title: Text(
      //     'Messages',
      //     style: AppTextTheme.headline2.copyWith(color: Colors.white),
      //   ),
      // ),
      body: Center(
        child: Text(
          'Messages Coming Soon',
          style: AppTextTheme.subtitle1,
        ),
      ),
    );
  }
}
