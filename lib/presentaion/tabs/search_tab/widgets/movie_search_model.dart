import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_styles.dart';
import 'package:movies_app/core/colors_manger.dart';
import 'package:movies_app/core/const_manger.dart';
import 'package:movies_app/data/model/movie/movies.dart';
import 'package:movies_app/presentaion/screens/movie_details_screen/movie_details_screen.dart';


class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  REdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context,  MaterialPageRoute(builder: (context) => MovieDetailsScreen(movie: movie)));

        },
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 160.w,
                    height: 130.h,
                    child: Image.network(
                      '${ConstManger.imagePath}${movie.posterPath}',
                      fit: BoxFit.fill,
                    )),
                SizedBox(
                  width: 15.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title ?? '',
                        style: AppStyle.movieTitle,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        movie.releaseDate?.split('-')[0] ?? '',
                        style: AppStyle.searchData,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Divider(
              color: ColorsManger.lightGrey,
            )
          ],
        ),
      ),
    );
  }
}
