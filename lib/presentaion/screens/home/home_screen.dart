

import 'package:flutter/material.dart';
import 'package:movies_app/core/assets_manger.dart';
import 'package:movies_app/presentaion/tabs/browse_tab/browse_tab.dart';
import 'package:movies_app/presentaion/tabs/home_tab/home_tab.dart';
import 'package:movies_app/presentaion/tabs/search_tab/search_tab.dart';
import 'package:movies_app/presentaion/tabs/watch_list_tab/watch_list_tab.dart';

class HomeScreen extends StatefulWidget{
   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex = 0;
  List<Widget> tabs =[
    const HomeTab(),
    const SearchTab(),
    const BrowseTab(),
    const WatchList(),
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
       bottomNavigationBar: BottomNavigationBar(
         type: BottomNavigationBarType.fixed,
           onTap: (value) {
           setState(() {
             selectedIndex = value;
           });
           },
           currentIndex : selectedIndex,
         items: const [
         BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
         BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
         BottomNavigationBarItem(icon: Icon(Icons.movie_creation_rounded),label: 'Browse'),
        // BottomNavigationBarItem(icon: Icon(Icons.bookmarks_outlined),label: 'WatchList'),

       ],),
      body: tabs[selectedIndex],
    );
  }
}