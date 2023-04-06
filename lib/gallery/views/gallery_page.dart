import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slideshow/img_card.dart';
import 'package:screendat_clone/gallery/cubit/gallery_cubit.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({
    required this.title,
    required this.images,
    super.key,
  });

  final List<String> images;
  final String title;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GalleryCubit>();
    if (images.isEmpty) {
      return Center(
        child: Text('No $title yet.'),
      );
    }
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        return Center(
          child: ImgCard(
            imgUrl: images[index],
            isFavorite: cubit.isFavorite,
            toggleFavorite: cubit.toggleFavorite,
          ),
        );
      },
    );
  }
}
