import 'package:get/get.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/travel/bindings/travel_binding.dart';
import '../modules/travel/views/travel_details_view.dart';
import '../modules/inspection/bindings/inspection_binding.dart';
import '../modules/inspection/views/car_inspection_view.dart';
import '../modules/inspection/views/transfer_protocol_view.dart';

class AppPages {
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.TRAVEL_DETAILS,
      page: () => const TravelDetailsView(),
      binding: TravelBinding(),
    ),
    GetPage(
      name: Routes.TRANSFER_PROTOCOL,
      page: () => const TransferProtocolView(),
      binding: InspectionBinding(),
    ),
    GetPage(
      name: Routes.CAR_INSPECTION,
      page: () => const CarInspectionView(),
      binding: InspectionBinding(),
    ),
  ];
}

abstract class Routes {
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const TRAVEL_DETAILS = '/travel-details';
  static const TRANSFER_PROTOCOL = '/transfer-protocol';
  static const CAR_INSPECTION = '/car-inspection';
}
