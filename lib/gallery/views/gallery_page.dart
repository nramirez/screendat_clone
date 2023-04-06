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

  Widget itemBuilder(BuildContext context, int index) {
    return Center(
      child: ImgCard(
        imgUrl: images[index],
        isFavorite: context.read<GalleryCubit>().isFavorite,
        toggleFavorite: context.read<GalleryCubit>().toggleFavorite,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return Center(
        child: Text('No $title yet.'),
      );
    }
    final isListView = context.select<GalleryCubit, bool>(
      (cubit) => cubit.state.isListView,
    );

    if (!isListView) {
      return GridView.builder(
        itemCount: images.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: itemBuilder,
      );
    }

    return ListView.builder(
      itemCount: images.length,
      itemBuilder: itemBuilder,
    );
  }
}
