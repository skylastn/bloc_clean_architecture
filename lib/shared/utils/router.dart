import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import '../../feature/auth/presentation/login/login_page.dart';
import '../../feature/auth/presentation/splash/splash_page.dart';

final router = GoRouter(
  initialLocation: SplashPage.routeName,
  observers: [FlutterSmartDialog.observer],
  debugLogDiagnostics: kDebugMode,
  routes: [
    GoRoute(
      path: SplashPage.routeName,
      name: SplashPage.routeName,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: LoginPage.routeName,
      name: LoginPage.routeName,
      builder: (context, state) => const LoginPage(),
    ),
    // GoRoute(
    //   path: OnboardingPage.routeName,
    //   name: OnboardingPage.routeName,
    //   builder: (context, state) => render(const OnboardingPage()),
    // ),
    // GoRoute(
    //   path: LoginPage.routeName,
    //   name: LoginPage.routeName,
    //   builder: (context, state) => render(const LoginPage()),
    // ),
    // GoRoute(
    //   path: LoginWithGooglePage.routeName,
    //   name: LoginWithGooglePage.routeName,
    //   builder: (context, state) => render(const LoginWithGooglePage()),
    // ),
    // GoRoute(
    //   path: LoginWithPhonePage.routeName,
    //   name: LoginWithPhonePage.routeName,
    //   builder: (context, state) => render(const LoginWithPhonePage()),
    // ),
    // GoRoute(
    //     name: OTPVerificationPage.routeName,
    //     path: OTPVerificationPage.routeName,
    //     builder: (context, state) {
    //       final param = state.uri.queryParameters;
    //       String phone = param["phone"] ?? '';
    //       return render(OTPVerificationPage(phone: phone));
    //     }),
    // GoRoute(
    //   path: LoginWithEmailPage.routeName,
    //   name: LoginWithEmailPage.routeName,
    //   builder: (context, state) => render(const LoginWithEmailPage()),
    // ),
    // GoRoute(
    //   path: HomePage.routeName,
    //   name: HomePage.routeName,
    //   builder: (context, state) => render(const HomePage()),
    // ),
    // GoRoute(
    //   path: ProfilePage.routeName,
    //   name: ProfilePage.routeName,
    //   builder: (context, state) => render(const ProfilePage()),
    // ),
    // // GoRoute(
    // //   path: OrderPage.routeName,
    // //   builder: (context, state) => render(const OrderPage()),
    // // ),
    // GoRoute(
    //   path: RegisterPage.routeName,
    //   name: RegisterPage.routeName,
    //   builder: (context, state) => render(RegisterPage()),
    // ),
    // GoRoute(
    //   path: SlidebarPage.routeName,
    //   name: SlidebarPage.routeName,
    //   builder: (context, state) => render(const SlidebarPage()),
    // ),
    // GoRoute(
    //   path: SearchPage.routeName,
    //   name: SearchPage.routeName,
    //   builder: (context, state) {
    //     // final isMenu = state.extra as bool? ??
    //     //     true; // Set to true by default if not provided
    //     // return SearchPage(isMenu: isMenu);
    //     return SearchPage();
    //   },
    // ),
    // GoRoute(
    //   path: SearchCategoryPage.routeName,
    //   name: SearchCategoryPage.routeName,
    //   builder: (context, state) {
    //     final param = state.uri.queryParameters;
    //     final categoryId = param['categoryId'] ?? '';
    //     final categoryName = param['categoryName'] ?? '';
    //     return SearchCategoryPage(
    //       categoryId: categoryId,
    //       categoryName: categoryName,
    //     );
    //   },
    // ),
    // GoRoute(
    //   path: PaymentMethodsPage.routeName,
    //   name: PaymentMethodsPage.routeName,
    //   builder: (context, state) => render(const PaymentMethodsPage()),
    // ),
    // GoRoute(
    //   path: ActivityPage.routeName,
    //   name: ActivityPage.routeName,
    //   builder: (context, state) {
    //     return render(ActivityPage());
    //   },
    // ),
    // GoRoute(
    //   path: TrackingOrderPage.routeName,
    //   name: TrackingOrderPage.routeName,
    //   builder: (context, state) {
    //     final param = state.uri.queryParameters;
    //     final code = param['code'] ?? '';
    //     return render(TrackingOrderPage(code: code));
    //   },
    // ),
    // GoRoute(
    //   path: QueuePage.routeName,
    //   name: QueuePage.routeName,
    //   builder: (context, state) => render(const QueuePage()),
    // ),
    // GoRoute(
    //   path: InboxPage.routeName,
    //   name: InboxPage.routeName,
    //   builder: (context, state) => render(const InboxPage()),
    // ),
    // GoRoute(
    //   path: ChatPage.routeName,
    //   name: ChatPage.routeName,
    //   builder: (context, state) => render(const ChatPage()),
    // ),
    // GoRoute(
    //   path: RestaurantPage.routeName,
    //   name: RestaurantPage.routeName,
    //   builder: (context, state) {
    //     final param = state.uri.queryParameters;
    //     final tenantId = param['id'] ?? '';
    //     return render(RestaurantPage(tenantId: tenantId));
    //   },
    // ),
    // GoRoute(
    //   path: RestaurantDetailPage.routeName,
    //   name: RestaurantDetailPage.routeName,
    //   builder: (context, state) {
    //     final param = state.uri.queryParameters;
    //     final tenantId = param['id'] ?? '';
    //     return render(RestaurantDetailPage(tenantId: tenantId));
    //   },
    // ),
    // GoRoute(
    //   path: FoodDetailPage.routeName,
    //   name: FoodDetailPage.routeName,
    //   builder: (context, state) {
    //     final param = state.uri.queryParameters;
    //     final menuId = param['id'] ?? '';
    //     return render(FoodDetailPage(menuId: menuId));
    //   },
    // ),
    // GoRoute(
    //   path: ScanQRCodePage.routeName,
    //   name: ScanQRCodePage.routeName,
    //   builder: (context, state) => render(const ScanQRCodePage()),
    // ),
    // GoRoute(
    //   path: VoucherPage.routeName,
    //   name: VoucherPage.routeName,
    //   builder: (context, state) => render(const VoucherPage()),
    // ),
    // GoRoute(
    //   path: CartPage.routeName,
    //   name: CartPage.routeName,
    //   builder: (context, state) => render(CartPage()),
    // ),
    // GoRoute(
    //   path: CartMenuEditPage.routeName,
    //   name: CartMenuEditPage.routeName,
    //   builder: (context, state) {
    //     final param = state.uri.queryParameters;
    //     final menuId = param['menuId'] ?? '';
    //     final qty = param['qty'] ?? '0';
    //     final tenantId = param['tenantId'] ?? '';
    //     return CartMenuEditPage(menuId: menuId, qty: qty, tenantId: tenantId);
    //   },
    // ),
    // GoRoute(
    //   path: TermsPageA.routeName,
    //   name: TermsPageA.routeName,
    //   builder: (context, state) => TermsPageA(),
    // ),
    // GoRoute(
    //   path: TermsPageB.routeName,
    //   name: TermsPageB.routeName,
    //   builder: (context, state) => TermsPageB(),
    // ),
    // GoRoute(
    //   path: ValidateForgotOtpPage.routeName,
    //   name: ValidateForgotOtpPage.routeName,
    //   builder: (context, state) {
    //     final param = state.uri.queryParameters;
    //     final username = param['username'] ?? '';
    //     final token = param['token'] ?? '';
    //     return ValidateForgotOtpPage(username: username, token: token);
    //   },
    // ),
  ],
);
