
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/colors_manger.dart';
import 'package:movies_app/core/const_manger.dart';
import 'package:movies_app/core/routes_manger.dart';
import 'package:movies_app/data/model/movie/movie_response.dart';
import 'package:movies_app/presentaion/screens/movie_details_screen/movie_details_screen.dart';



class MoviesSlider extends StatelessWidget {
   const MoviesSlider({super.key,required this.movies});

   final MovieResponse  movies;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 250.h,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection : Axis.horizontal,
        itemCount :movies.results?.length,
        itemBuilder: (context, index) {
          final movie = movies.results![index];
          return Padding(
            padding:  REdgeInsets.all(10.0),
            child: Column(
              children: [
                ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  onTap: () {
                  Navigator.push(context,  MaterialPageRoute(builder: (context) => MovieDetailsScreen(movie: movies.results![index])));
                  },
                  child:  CachedNetworkImage(
                    imageUrl: "${ConstManger.imagePath}${movie.posterPath}",
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator(color: ColorsManger.yellow,)),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    fit: BoxFit.cover,
                    height: 160.h,
                  ),
                ),
                  ),
              ],
            )
          );

        },),
    );
}}
