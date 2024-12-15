
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/assets_manger.dart';
import 'package:movies_app/core/colors_manger.dart';
import 'package:movies_app/core/routes_manger.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigating to the next screen after a delay
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RoutesManger.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.black,
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween(begin: 0.5, end: 1.0), // Scale animation range
          duration: const Duration(seconds: 3),
          builder: (context, double scale, child) {
            return Transform.scale(
              scale: scale,
              child: child,
            );
          },
          child: Image.asset(
            AssetsManger.moviesLogo,
            width: 168.w,
            height: 187.h,
          ),
        ),
      ),
    );
  }
}
