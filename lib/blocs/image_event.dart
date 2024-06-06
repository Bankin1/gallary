part of 'image_bloc.dart';

abstract class ImageEvent extends Equatable {
  const ImageEvent();

  @override
  List<Object> get props => [];
}

class LoadImages extends ImageEvent {
  final String category;

  const LoadImages({required this.category});

  @override
  List<Object> get props => [category];
}