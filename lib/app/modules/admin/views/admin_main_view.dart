import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_pro/app/modules/admin/views/admin_orders_view.dart';
import 'package:uber_pro/app/modules/admin/views/messages_view.dart';
import 'package:uber_pro/app/modules/admin/views/more_view.dart';
import 'package:uber_pro/app/modules/admin/views/new_orders_view.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_theme.dart';
import '../controllers/admin_controller.dart';
import 'widgets/order_card.dart';
import 'widgets/price_offer_card.dart';
import 'widgets/completed_order_card.dart';
import 'widgets/current_order_card.dart';

class AdminMainView extends GetView<AdminController> {
  const AdminMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: Text(
          'app_name'.tr,
          style: AppTextTheme.headline2.copyWith(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: Obx(() => IndexedStack(
            index: controller.currentIndex.value,
            children: const [
              AdminOrdersView(),
              NewOrdersView(),
              MessagesView(),
              MoreView(),
            ],
          )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.textSecondary,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'My orders',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'New orders',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: 'Messages',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: 'More',
              ),
            ],
            onTap: controller.changePage,
          )),
    );
  }
}
