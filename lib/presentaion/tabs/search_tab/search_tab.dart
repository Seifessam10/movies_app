

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_styles.dart';
import 'package:movies_app/core/assets_manger.dart';
import 'package:movies_app/core/colors_manger.dart';
import 'package:movies_app/data/api_manger/api_manger.dart';
import 'package:movies_app/data/model/movie/movies.dart';
import 'package:movies_app/presentaion/tabs/search_tab/widgets/movie_search_model.dart';// Import the MovieItem widget

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  late Future<List<Movie>> movies = Future.value([]); // Initialize with an empty list

  onSearch(String query) {
    setState(() {
      movies = ApiManger.getMovieBySearch(query);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          SizedBox(height: 25.h,),
          Padding(
            padding:  REdgeInsets.all(30.0),
            child: SizedBox(
              width: 450.w,
              height: 60.h,
              child: TextField(
                onChanged: (value) => onSearch(value),
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Search Movies',
                  hintStyle: TextStyle(color: Colors.white,fontSize: 14.sp,fontWeight: FontWeight.w300),
                  fillColor: ColorsManger.darkGrey,
                  filled: true,
                  prefixIcon: const Icon(Icons.search,color: Colors.white,),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color :Colors.white70),
                      borderRadius: BorderRadius.circular(50)
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: movies,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator(color: ColorsManger.yellow,));
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  final movieList = snapshot.data!;
                  return ListView.builder(
                    itemCount: movieList.length,
                    itemBuilder: (context, index) {
                      final movie = movieList[index];
                      return MovieItem(movie: movie);  // Using the MovieItem widget
                    },
                  );
                }
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: REdgeInsets.all(10.0),
                        child: Image.asset(AssetsManger.local,fit: BoxFit.fill,height: 90.h,),
                      ),
                       Text('No movies found', style: AppStyle.noMovie),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      )

      ,
    );
  }
}
