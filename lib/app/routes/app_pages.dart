import 'package:get/get.dart';
import 'package:uber_pro/app/modules/admin/bindings/admin_binding.dart';
import '../modules/admin/views/admin_main_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/auth/views/register_view.dart';
import '../modules/auth/views/forgot_password_view.dart';
import '../modules/auth/views/verify_code_view.dart';
import '../modules/auth/views/reset_password_view.dart';
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
      name: Routes.REGISTER,
      page: () => const RegisterView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.VERIFY_CODE,
      page: () => const VerifyCodeView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
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
    GetPage(
      name: Routes.ADMIN_ORDERS,
      page: () => const AdminMainView(),
      binding: AdminBinding(),
    ),
  ];
}

abstract class Routes {
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const FORGOT_PASSWORD = '/forgot-password';
  static const VERIFY_CODE = '/verify-code';
  static const RESET_PASSWORD = '/reset-password';
  static const HOME = '/home';
  static const TRAVEL_DETAILS = '/travel-details';
  static const TRANSFER_PROTOCOL = '/transfer-protocol';
  static const CAR_INSPECTION = '/car-inspection';
  static const ADMIN_ORDERS = '/admin';
}
