import 'package:bloc/bloc.dart';
import 'package:midjourney_api/midjourney_api.dart';

part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
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
}
