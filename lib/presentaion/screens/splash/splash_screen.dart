
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/assets_manger.dart';
import 'package:movies_app/core/colors_manger.dart';
import 'package:movies_app/core/routes_manger.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3),(){
    Navigator.pushReplacementNamed(context, RoutesManger.home);
      });
    return Container(
      color: ColorsManger.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AssetsManger.moviesLogo,width: 168.w,height: 187.h,)
        ],
      )
    );
  }
}
