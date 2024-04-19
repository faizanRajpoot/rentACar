import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_a_car_skeleton/src/services/auth_service.dart';
import 'package:rent_a_car_skeleton/src/services/restclient.dart';
import 'package:rent_a_car_skeleton/src/services/settings.dart';
import 'package:get/get.dart';
import 'src/app.dart';

void main() async {
  // // Set up the SettingsController, which will glue user settings to multiple
  // // Flutter Widgets.
  // final settingsController = SettingsController(SettingsService());

  // // Load the user's preferred theme while the splash screen is displayed.
  // // This prevents a sudden theme change when the app is first displayed.
  // await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      // systemNavigationBarColor: UIData.commonColor, // navigation bar color
      statusBarColor: Colors.blue, // status bar color
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize services here
  await initializeServices();

  runApp(MyApp());
}

Future<void> initializeServices() async {
  // await Firebase.initializeApp();

  SettingsService settings = SettingsService();
  Get.putAsync(() => settings.init());
  RestClient rest = RestClient();
  await Get.putAsync(() => rest.init());
  AuthService auth = AuthService();
  await Get.putAsync(() => auth.init());

  WidgetsFlutterBinding.ensureInitialized();
}
