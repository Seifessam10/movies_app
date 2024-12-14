

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/config/theme/app_styles.dart';
import 'package:movies_app/core/colors_manger.dart';
import 'package:movies_app/core/const_manger.dart';
import 'package:movies_app/data/api_manger/api_manger.dart';
import 'package:movies_app/data/model/movie/movie_response.dart';
import 'package:movies_app/data/model/movie/movies.dart';
import 'package:movies_app/presentaion/tabs/home_tab/widgets/movies_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieDetailsScreen extends StatelessWidget{
  Movie? movie;

  MovieDetailsScreen({super.key,required this.movie});
  @override
  Widget build(BuildContext context) {
    final releaseYear = movie!.releaseDate?.split('-')[0] ?? '';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManger.lightBlack,
        title: Text(movie!.title.toString()),
        elevation: 10,
        titleTextStyle: AppStyle.title,
      ),
      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
            children: [
              CachedNetworkImage(
                imageUrl: "${ConstManger.imagePath}${movie?.backdropPath}",
                placeholder: (context, url) => const Center(child: CircularProgressIndicator(color: ColorsManger.yellow,)),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,

              ),
              const Positioned.fill(child: Center(child: Icon(Icons.play_circle_filled_outlined,size: 45,color: Colors.white,)))
            ],
          ),
            Padding(
              padding:  REdgeInsets.all(8.0),
              child: Text(movie!.title!,style: AppStyle.title,),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:  REdgeInsets.all(10.0),
                  child: ClipRRect(borderRadius : BorderRadius.circular(5),child: CachedNetworkImage(imageUrl: '${ConstManger.imagePath}${movie?.posterPath}',height: 160.h,)),
                ),
                Expanded(child:
                Column(
                  children: [
                    Container(
                        padding :  REdgeInsets.all(10),
                        child: Text(movie!.overview!,maxLines: 4,
                          style: AppStyle.movieDetails.copyWith(fontSize: 16.sp,),)),
                    Row(children: [
                      SizedBox(width: 10.w),
                      const Icon(Icons.star,color: ColorsManger.yellow,size: 20,),
                      Text(movie!.voteAverage.toString(),style: AppStyle.voteAverage,),
                       SizedBox(width: 20.w,),
                      Container(
                          padding:  REdgeInsets.all(2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(color: Colors.white)),
                          child:Text('Release Year : $releaseYear', style: AppStyle.releaseYear,)),
                    ],),
                  ],
                )),
              ],
            ),
            Container(
              padding: REdgeInsets.all(5),
              color: ColorsManger.darkGrey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('More Like This',style: AppStyle.movieSectionName),
                  SizedBox(
                    height: 150,
                    width: double.infinity,
                    child:  FutureBuilder(future: ApiManger.getLikeThis(movie?.id ?? 1), builder: (context, snapshot) {
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

        ],),
      ),
    );

  }
  // String formatRuntime(int? runtime) {
  //   if (runtime == null || runtime == 0) return 'N/A';
  //   final hours = runtime ~/ 60; // Divide by 60 to get hours
  //   final minutes = runtime % 60; // Get the remainder for minutes
  //   return '${hours}h ${minutes}m';
  // }


}