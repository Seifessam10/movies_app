
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_styles.dart';
import 'package:movies_app/core/colors_manger.dart';
import 'package:movies_app/data/api_manger/api_manger.dart';
import 'package:movies_app/presentaion/tabs/home_tab/widgets/movies_slider.dart';
import 'package:movies_app/presentaion/tabs/home_tab/widgets/popular_slider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  @override

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      const Spacer(),
      FutureBuilder(future: ApiManger.getPopularMovies(), builder: (context, snapshot) {
        if(snapshot.hasError){
          return Center(child: Text(snapshot.error.toString()));
        }else if(snapshot.hasData){
          final data = snapshot.data!;
          return PopularSlider(movies: data);
        }else{
          return const Center(child: CircularProgressIndicator(color: ColorsManger.yellow,));
        }

      },),
      const Spacer(),
      Container(
        padding: REdgeInsets.all(8),
        color: ColorsManger.darkGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('New Releases',style: AppStyle.movieSectionName),
            SizedBox(
              height: 190.h,
              width: double.infinity,
              child:  FutureBuilder(future: ApiManger.getUpComingMovies(), builder: (context, snapshot) {
                if(snapshot.hasError){
                  return Center(child: Text(snapshot.error.toString()));
                }else if(snapshot.hasData){
                  final data = snapshot.data!;
                  return MoviesSlider(movies: data);
                }else{
                  return const Center(child: CircularProgressIndicator(color: ColorsManger.yellow,));
                }

              },),


            ),
          ],
        ),
      ),
      const Spacer(),
      Container(
        padding: REdgeInsets.all(8),
        color: ColorsManger.darkGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Recommended',style: AppStyle.movieSectionName),
            SizedBox(
              height: 190.h,
              width: double.infinity,
              child:  FutureBuilder(future: ApiManger.getTopRated(), builder: (context, snapshot) {
                if(snapshot.hasError){
                  return Center(child: Text(snapshot.error.toString()));
                }else if(snapshot.hasData){
                  final data = snapshot.data!;
                  return MoviesSlider(movies: data);
                }else{
                  return const Center(child: CircularProgressIndicator(color: ColorsManger.yellow,));
                }

              },),


            ),
          ],
        ),
      ),



    ],
    );
  }
}
