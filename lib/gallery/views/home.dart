import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slideshow/slideshow.dart';

import 'package:screendat_clone/gallery/cubit/gallery_cubit.dart';
import 'package:screendat_clone/gallery/views/favorite_page.dart';
import 'package:screendat_clone/gallery/views/gallery_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<GalleryCubit>();
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          GalleryPage(
            title: 'top',
            images: cubit.state.top,
          ),
          GalleryPage(
            title: 'recent',
            images: cubit.state.recent,
          ),
          const FavoritePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Top',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Recent',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var images = cubit.state.top;
          if (pageController.page == 1) {
            images = cubit.state.recent;
          } else if (pageController.page == 2) {
            images = cubit.sortedFavorites();
          }

          Navigator.of(context).push(MaterialPageRoute<void>(
            builder: (context) => SlideShow(
              urls: images,
            ),
          ));
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
