part of 'image_bloc.dart';

abstract class ImageState extends Equatable {
  const ImageState();

  @override
  List<Object> get props => [];
}

class ImageLoading extends ImageState {}

class ImageLoaded extends ImageState {
  final List<ImageModel> images;

  const ImageLoaded({required this.images});

  @override
  List<Object> get props => [images];
}

class ImageError extends ImageState {
  final String message;

  const ImageError({required this.message});

  @override
  List<Object> get props => [message];
}