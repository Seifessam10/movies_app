

import 'package:flutter/material.dart';
import 'package:movies_app/config/theme/app_styles.dart';
import 'package:movies_app/core/colors_manger.dart';
import 'package:movies_app/data/api_manger/api_manger.dart';
import 'package:movies_app/data/model/genres/genre.dart';
import 'package:movies_app/presentaion/screens/category_details/category_details.dart';
import 'package:movies_app/presentaion/tabs/browse_tab/widgets/movie_category_model.dart';
class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:  Text('Browse Category',style: AppStyle.browseCategory,),
      ),
      body: FutureBuilder(
          future: ApiManger.getGenre(),
          builder: (context, snapshot) {
            if(snapshot.hasError){
              return Center(child: Text(snapshot.error.toString()),);
            }
            if(snapshot.hasData){
              List<Genre> data = snapshot.data!;
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: (context, index) =>
                      InkWell(
                          onTap : () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => CategoryDetailsScreen(genreId: data[index].id,genreName: data[index].name,)) );
                          },
                        child: MovieCM(categoryName: data[index].name.toString())),
                  itemCount: data.length,

              );
            }
            else{
              return const Center(child: CircularProgressIndicator(color: ColorsManger.yellow,));
            }
          }
          ,

      )

    );
  }
}

// GridView.builder(
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 ),
// itemBuilder: (context, index) => MovieCM(),
// itemCount: 19,
//
// )
