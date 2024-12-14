import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_theme.dart';
import 'package:movies_app/core/routes_manger.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(412, 892),
       builder :(context,child)=> MaterialApp(
        onGenerateRoute: RoutesManger.router,
        initialRoute: RoutesManger.splash,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
      ),
    );
  }
}