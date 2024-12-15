

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/colors_manger.dart';

class AppStyle {

  static TextStyle title = TextStyle(
      fontWeight: FontWeight.w400, fontSize: 16.sp, color: Colors.white);
  static TextStyle voteAverage = TextStyle(
      fontWeight: FontWeight.bold, fontSize: 12.sp, color: Colors.white);
  static TextStyle movieSectionName = TextStyle(
      color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14.sp);
  static TextStyle movieDetails = TextStyle(
      fontSize: 12.sp, fontWeight: FontWeight.w400, color: ColorsManger.lightGrey);
  static TextStyle browseCategory = TextStyle(
      fontSize: 20.sp, fontWeight: FontWeight.w300, color: Colors.white);
  static TextStyle categoryName = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static TextStyle releaseYear = TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w400,color: Colors.white);
  static TextStyle noMovie =  TextStyle(color: Colors.white70,fontSize: 14.sp,fontWeight: FontWeight.w400);
  static TextStyle movieTitle =TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400,color: Colors.white);
  static TextStyle searchData =  TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w300,color: Colors.white70);

}