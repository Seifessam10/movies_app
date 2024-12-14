

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_styles.dart';
import 'package:movies_app/core/assets_manger.dart';

class MovieCM extends StatelessWidget{

  String categoryName;

   MovieCM({required this.categoryName});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Padding(
              padding:  REdgeInsets.all(10.0),
              child: SizedBox(
                height: 130.h,
                width: 180.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                    child: Image.asset(AssetsManger.category,fit: BoxFit.fill,)),
              ),
            ),
            Positioned.fill( child : Center(child: Text(categoryName,style: AppStyle.categoryName,)))
          ],
        ),
      ],
    );
  }


}