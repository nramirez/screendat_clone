part of 'gallery_cubit.dart';

class GalleryState {
  GalleryState({
    this.top = const [],
    this.recent = const [],
    this.favorites = const {},
    this.isListView = true,
  });

  final List<String> top;
  final List<String> recent;
  final Map<String, int> favorites;
  final bool isListView;

  GalleryState copyWith({
    List<String>? top,
    List<String>? recent,
    Map<String, int>? favorites,
    bool? isListView,
  }) {
    return GalleryState(
      top: top ?? this.top,
      recent: recent ?? this.recent,
      favorites: favorites ?? this.favorites,
      isListView: isListView ?? this.isListView,
    );
  }
}
