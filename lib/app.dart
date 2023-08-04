import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
          builder: (context, child) {
            return Container(
              child: child,
            );
          },
        );
      }),
    );
  }
}
