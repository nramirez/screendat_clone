import 'package:flutter/material.dart';
import 'package:flutter_slideshow/img_card.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({
    required this.images,
    super.key,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        return Center(
          child: ImgCard(
            imgUrl: images[index],
          ),
        );
      },
    );
  }
}
