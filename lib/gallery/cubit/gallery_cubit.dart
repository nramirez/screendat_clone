import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:midjourney_api/midjourney_api.dart';

part 'gallery_state.dart';

class GalleryCubit extends HydratedCubit<GalleryState> {
  GalleryCubit({
    required this.api,
  }) : super(GalleryState());

  final MidJourneyApi api;

  /// Fetch top and recent images from the API.
  Future<void> fetch() async {
    final top = await api.fetchTop();
    final recent = await api.fetchRecent();

    emit(state.copyWith(top: top, recent: recent));
  }

  /// Toggle the view between list and grid.
  void toggleView() {
    emit(state.copyWith(isListView: !state.isListView));
  }

  bool isFavorite(String url) {
    return state.favorites.containsKey(url);
  }

  /// Toggle the favorite status of an image.
  void toggleFavorite(String url) {
    final favorites = Map<String, int>.from(state.favorites);

    if (favorites.containsKey(url)) {
      favorites.remove(url);
    } else {
      favorites[url] = DateTime.now().millisecondsSinceEpoch;
    }

    emit(state.copyWith(favorites: favorites));
  }

  List<String> sortedFavorites() {
    return (state.favorites.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value)))
        .map((e) => e.key)
        .toList();
  }

  @override
  GalleryState? fromJson(Map<String, dynamic> json) {
    final favorites = json['favorites'] as Map<String, dynamic>;
    return GalleryState(
      favorites: favorites.cast<String, int>(),
      isListView: json['isListView'] as bool? ?? true,
    );
  }

  @override
  Map<String, dynamic>? toJson(GalleryState state) {
    return {
      'favorites': state.favorites,
      'isListView': state.isListView,
    };
  }
}
