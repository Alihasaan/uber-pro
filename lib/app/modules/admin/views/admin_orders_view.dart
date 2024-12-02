import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/admin_controller.dart';
import 'widgets/price_offer_card.dart';
import 'widgets/completed_order_card.dart';
import 'widgets/current_order_card.dart';

class AdminOrdersView extends GetView<AdminController> {
  const AdminOrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            // appBar: AppBar(
            //   leading: null,
            //   backgroundColor: AppColors.primary,
            //   bottom: const TabBar(
            //     indicatorColor: Colors.white,
            //     labelColor: Colors.white,
            //     tabs: [
            //       Tab(text: 'Price \noffers'),
            //       Tab(text: 'Current \norders'),
            //       Tab(text: 'Completed \norders'),
            //     ],
            //   ),
            // ),
            backgroundColor: AppColors.background,
            body: Column(
              children: [
                Container(
                  color: AppColors.primary,
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.1,
                    child: const TabBar(
                      indicatorColor: Colors.white,
                      labelColor: Colors.white,
                      unselectedLabelColor: AppColors.textPrimary,
                      labelStyle: TextStyle(fontSize: 16),
                      tabs: [
                        Tab(text: 'Price \noffers'),
                        Tab(text: 'Current \norders'),
                        Tab(text: 'Completed \norders'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.69,
                  child: TabBarView(
                    children: [
                      // Price Offers Tab
                      Obx(() => ListView.builder(
                            padding: const EdgeInsets.all(16),
                            itemCount: controller.priceOffers.length,
                            itemBuilder: (context, index) => PriceOfferCard(
                              offer: controller.priceOffers[index],
                              onRemoveOffer: () => controller.removeOffer(
                                  controller.priceOffers[index]['id']),
                              onBuyNow: () => controller.buyOrder(
                                  controller.priceOffers[index]['id']),
                            ),
                          )),

                      // Current Orders Tab
                      Obx(() => ListView.builder(
                            padding: const EdgeInsets.all(16),
                            itemCount: controller.currentOrders.length,
                            itemBuilder: (context, index) => CurrentOrderCard(
                              order: controller.currentOrders[index],
                            ),
                          )),

                      // Completed Orders Tab
                      Obx(() => ListView.builder(
                            padding: const EdgeInsets.all(16),
                            itemCount: controller.completedOrders.length,
                            itemBuilder: (context, index) => CompletedOrderCard(
                              order: controller.completedOrders[index],
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            )));
  }
}
