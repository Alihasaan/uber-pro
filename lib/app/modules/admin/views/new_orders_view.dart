import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_theme.dart';
import '../controllers/admin_controller.dart';
import 'widgets/new_order_card.dart';

class NewOrdersView extends GetView<AdminController> {
  const NewOrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.background,
      // appBar: AppBar(
      //   backgroundColor: AppColors.primary,
      //   elevation: 0,
      //   title: Text(
      //     'New Orders',
      //     style: AppTextTheme.headline2.copyWith(color: Colors.white),
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.filter_list),
      //       onPressed: () {},
      //     ),
      //     IconButton(
      //       icon: const Icon(Icons.search),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.trips.isEmpty) {
          return Center(
            child: Text(
              'No new orders available',
              style: AppTextTheme.subtitle1,
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: controller.fetchNewTrips,
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: controller.trips.length,
            itemBuilder: (context, index) {
              final trip = controller.trips[index];
              return NewOrderCard(
                trip: trip,
                onMakeOffer: controller.makeOffer,
              );
            },
          ),
        );
      }),
    );
  }
}
