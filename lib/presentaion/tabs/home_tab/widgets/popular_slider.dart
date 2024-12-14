import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_styles.dart';
import 'package:movies_app/core/colors_manger.dart';
import 'package:movies_app/core/const_manger.dart';
import 'package:movies_app/core/routes_manger.dart';
import 'package:movies_app/data/model/movie/movie_response.dart';
import 'package:movies_app/presentaion/screens/movie_details_screen/movie_details_screen.dart';


class PopularSlider extends StatelessWidget {
  const PopularSlider({super.key, required this.movies});

  final MovieResponse movies;

  @override
  Widget build(BuildContext context) {
      return CarouselSlider.builder(
        itemCount: movies.results!.length,
        itemBuilder: (context, index, realIndex) {
          final movie = movies.results?[index];
          return Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 300.h,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,  MaterialPageRoute(builder: (context) => MovieDetailsScreen(movie: movie)));
                      },
                      child: CachedNetworkImage(
                        imageUrl: "${ConstManger.imagePath}${movie?.posterPath}",
                        placeholder: (context, url) => const Center(child: CircularProgressIndicator(color: ColorsManger.yellow,)),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              Align(
                alignment: Alignment.bottomRight,
                child: Row(children: [
                  const Icon(Icons.star,color: ColorsManger.yellow,size: 15,),
                  Text('${movie!.voteAverage.toString()}/10',style: AppStyle.voteAverage,),
                ],),
              ),
              const Align(alignment : Alignment.center ,child: Icon(Icons.play_circle_filled_outlined,size: 35,color: Colors.white,))

            ],
          );
        },
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          pageSnapping: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          height: 300.h,
          autoPlayAnimationDuration: const Duration(seconds: 2),
        ),
      );
    }
  }
