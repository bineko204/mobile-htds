import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/bindings/initial_binding.dart';
import '/app/core/values/app_colors.dart';
import '/app/routes/app_pages.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import 'core/base/orientation_controller.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final EnvConfig _envConfig = BuildConfig.instance.config;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: _envConfig.appName,
        initialRoute: AppPages.INITIAL,
        initialBinding: InitialBinding(),
        getPages: AppPages.routes,
        theme: ThemeData(
          primarySwatch: AppColors.colorPrimarySwatch,
          visualDensity: VisualDensity.compact,
          brightness: Brightness.light,
          primaryColor: AppColors.colorPrimary,
          textTheme: const TextTheme(
            button: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            ),
          ),
          fontFamily: 'Roboto',
        ),
        debugShowCheckedModeBanner: false,
        navigatorObservers: [NavigatorObserverWithOrientation()],
        routingCallback: (routing) {
          print(routing.toString());
        }
    );
  }


}
