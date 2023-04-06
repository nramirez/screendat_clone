import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screendat_clone/gallery/cubit/gallery_cubit.dart';
import 'package:screendat_clone/gallery/views/gallery_page.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _ = context.select((GalleryCubit cubit) => cubit.state.favorites);
    final sortedFavorite = context.read<GalleryCubit>().sortedFavorites();

    return GalleryPage(title: 'favorites', images: sortedFavorite.toList());
  }
}
