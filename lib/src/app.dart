// ignore_for_file: empty_constructor_bodies

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// views
import 'package:rent_a_car_skeleton/src/services/logger.dart';
import 'package:rent_a_car_skeleton/src/services/settings.dart';

import 'ui/views/error.dart';
import 'utils/config/uidata.dart';
import 'utils/routes/app_pages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  final SettingsService settings = Get.find<SettingsService>();

  MyApp({super.key}) {}

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settings,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,
          // Custom Logging
          enableLog: true,
          logWriterCallback: Logger.write,
          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: ThemeData(
            colorScheme: ColorScheme.dark(),
            primaryColor: Colors.black,
            fontFamily: UIDataFonts.quickFont,
            primarySwatch: Colors.green,
          ),
          darkTheme: ThemeData.dark(),
          themeMode: settings.getThemeMode,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          onUnknownRoute: (RouteSettings rs) => MaterialPageRoute(
            builder: (context) {
              return ErrorView(
                // icon: UIDataVector.vectorSadSmiley,
                message: 'Coming Soon!',
              );
            },
          ),
        );
      },
    );
  }
}
