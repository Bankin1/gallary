import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/image_model.dart';
import '../repositories/image_repository.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImageRepository repository;

  ImageBloc({required this.repository}) : super(ImageLoading()) {
    on<LoadImages>((event, emit) async {
      emit(ImageLoading());
      try {
        final images = await repository.fetchImages(event.category);
        emit(ImageLoaded(images: images));
      } catch (e) {
        emit(ImageError(message: e.toString()));
      }
    });
  }
}
