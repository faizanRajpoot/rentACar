import 'package:get/get.dart';
import 'package:rent_a_car_skeleton/src/bindings/LikedCard_binding.dart';
import 'package:rent_a_car_skeleton/src/bindings/carDetail_binding.dart';
import 'package:rent_a_car_skeleton/src/bindings/bookin_binding.dart';
import 'package:rent_a_car_skeleton/src/bindings/brandItem_binding.dart';
import 'package:rent_a_car_skeleton/src/bindings/dashboard_binding.dart';
import 'package:rent_a_car_skeleton/src/bindings/editProfile_binding.dart';

// bindings
import 'package:rent_a_car_skeleton/src/bindings/intro_bindings.dart';
import 'package:rent_a_car_skeleton/src/bindings/login_binding.dart';
import 'package:rent_a_car_skeleton/src/bindings/profile_binding.dart';
import 'package:rent_a_car_skeleton/src/bindings/register_binding.dart';
import 'package:rent_a_car_skeleton/src/bindings/settings_bindings.dart';
import 'package:rent_a_car_skeleton/src/middlewares/auth.dart';
import 'package:rent_a_car_skeleton/src/ui/views/SignIn.dart';
import 'package:rent_a_car_skeleton/src/ui/views/carDetail.dart';
import 'package:rent_a_car_skeleton/src/ui/views/booking.dart';
import 'package:rent_a_car_skeleton/src/ui/views/brandItem.dart';
import 'package:rent_a_car_skeleton/src/ui/views/dashboard.dart';
import 'package:rent_a_car_skeleton/src/ui/views/editprofile.dart';
import 'package:rent_a_car_skeleton/src/ui/views/intro2.dart';
import 'package:rent_a_car_skeleton/src/ui/views/itemDetail.dart';
import 'package:rent_a_car_skeleton/src/ui/views/likedCArd.dart';
import 'package:rent_a_car_skeleton/src/ui/views/login.dart';
import 'package:rent_a_car_skeleton/src/ui/views/profile.dart';
import 'package:rent_a_car_skeleton/src/ui/views/register.dart';

// routes
import '../../bindings/SignIn_Binding.dart';
import '../../bindings/SignUp_Binding.dart';
import '../../bindings/itemDetail_binding.dart';
import '../../ui/views/intro3.dart';
import '../../ui/views/signUp.dart';
import './app_routes.dart';

// views
import 'package:rent_a_car_skeleton/src/ui/views/intro.dart';
import 'package:rent_a_car_skeleton/src/ui/views/error.dart';
import 'package:rent_a_car_skeleton/src/ui/views/settings.dart';

class AppPages {
  static const String INITIAL = Routes.DashboardRoute;
  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: Routes.introRoute,
      binding: IntroBindings(),
      page: () => IntroScreen(),
      // middlewares: [

      // ],
    ),
    GetPage(
      name: Routes.intro2Route,
      binding: IntroBindings(),
      page: () => Intro2Screen(),
      // middlewares: [

      // ],
    ),
    GetPage(
      name: Routes.intro3Route,
      binding: IntroBindings(),
      page: () => Intro3Screen(),
      // middlewares: [

      // ],
    ),
    GetPage(
      name: Routes.loginRoute,
      page: () => LoginScreen(),
      binding: LoginBindings(),
      // middlewares: [

      // ],
    ),
    GetPage(
      name: Routes.SignInRoute,
      page: () => SignInScreen(),
      binding: SignInBindings(),
    ),
    GetPage(
      name: Routes.SignUpRoute,
      page: () => SignUpScreen(),
      binding: SignUpBindings(),
    ),
    GetPage(
      name: Routes.RegisterRoute,
      page: () => RegisterScreen(),
      binding: RegisterBindings(),
      // middlewares: [

      // ],
    ),
    GetPage(
        name: Routes.DashboardRoute,
        binding: DashboardBindings(),
        page: () => Dashboard(),
        middlewares: [
          AuthMiddleware()
        ],
        children: [
          GetPage(
            name: Routes.ItemDetailRoute,
            binding: ItemDetailBindings(),
            page: () => ItemDetail(),
            middlewares: [AuthMiddleware()],
          ),
          GetPage(
            name: Routes.BrandDetailRoute,
            binding: BrandItemBindings(),
            page: () => BrandItem(),
            middlewares: [AuthMiddleware()],
          ),
          GetPage(
            name: Routes.carDetailRoute,
            binding: AboutCarBindings(),
            page: () => CarDetail(),
            middlewares: [AuthMiddleware()],
          ),
          GetPage(
            name: Routes.BookingRoute,
            binding: BookingBindings(),
            page: () => Booking(),
            middlewares: [AuthMiddleware()],
          ),
          GetPage(
            name: Routes.LikedCardRoutes,
            binding: LikedCardBindings(),
            page: () => LikedCard(),
            middlewares: [AuthMiddleware()],
          ),
        ]),
          GetPage(
              name: Routes.ProfileRoute,
              binding: ProfileBindings(),
              page: () => Profile(),
              children: [
                GetPage(
                  name: Routes.EditProfileRoute,
                  binding: EditProfileBindings(),
                  page: () => EditProfile(),
                ),
              ]),
    GetPage(
      name: Routes.settingsRoute,
      page: () => SettingsView(),
      binding: SettingsBindings(),
    ),
    GetPage(
      name: Routes.errorRoute,
      page: () => ErrorView(),
    ),
  ];
}
