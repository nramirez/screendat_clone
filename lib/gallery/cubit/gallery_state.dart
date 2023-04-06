part of 'gallery_cubit.dart';

class GalleryState {
  GalleryState({
    this.top = const [],
    this.recent = const [],
  });

  final List<String> top;
  final List<String> recent;

  GalleryState copyWith({
    List<String>? top,
    List<String>? recent,
  }) {
    return GalleryState(
      top: top ?? this.top,
      recent: recent ?? this.recent,
    );
  }
}
