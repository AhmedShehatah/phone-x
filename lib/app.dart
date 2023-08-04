import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:phone_x/core/constants/app_style.dart';
import 'package:phone_x/core/di/di_manager.dart';
import 'package:phone_x/core/navigation/route_generator.dart';
import 'package:phone_x/core/utils/screen_utils/device_utils.dart';
import 'package:phone_x/ui/parent/page/parent_page.dart';
import 'core/constants/app_consts.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: ScreenUtilInit(builder: (context, _) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          enableLog: true,
          onGenerateRoute: RouteGenerator.generateRoutes,
          builder: (context, child) {
            ScreenHelper(context);
            return Container(
              child: child,
            );
          },
          theme: ThemeData.dark(
            useMaterial3: true,
          ).copyWith(
            primaryColor: DIManager.findCC().primaryColor,
            colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: DIManager.findCC().lightBlack,
            ),
            textTheme: TextTheme(
              headlineMedium: AppStyle.bigTitleStyle,
              bodyLarge: AppStyle.defaultStyle,
            ),
          ),
          title: AppConsts.appName,
          initialRoute: ParentPage.routeName,
        );
      }),
    );
  }
}
