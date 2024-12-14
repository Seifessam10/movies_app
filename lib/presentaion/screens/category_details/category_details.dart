

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_styles.dart';
import 'package:movies_app/core/colors_manger.dart';
import 'package:movies_app/core/const_manger.dart';
import 'package:movies_app/data/api_manger/api_manger.dart';
import 'package:movies_app/data/model/movie/movies.dart';
import 'package:movies_app/presentaion/screens/movie_details_screen/movie_details_screen.dart';


class CategoryDetailsScreen extends StatelessWidget{

  int? genreId;
  String? genreName;

  CategoryDetailsScreen({super.key,required this.genreId,required this.genreName});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(genreName ?? 'movies',style: AppStyle.browseCategory,),
        backgroundColor: Colors.transparent,
        elevation: 0,

      ),
      body: FutureBuilder(
        future: ApiManger.getMovieByGenre(genreId ?? 0),
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()));
          }
          if(snapshot.hasData){
            List<Movie> movieList = snapshot.data!;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  REdgeInsets.all(10.0),
                    child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                            child: 
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder:(context) => MovieDetailsScreen(movie: movieList[index])));
                              },
                              child: SizedBox(
                                  height: 100.h,
                                  width: 50.w,
                                  child:
                                  Image.network('${ConstManger.imagePath}${movieList[index].posterPath}',fit: BoxFit.fill,)),
                            ))
                  );
                },
              itemCount: movieList.length,

            );
          }
          else{
            return const Center(child: CircularProgressIndicator(color: ColorsManger.yellow,));
          }
        },


      ),
    );
  }


}