import 'package:flutter/material.dart';
import '../models/image_model.dart';
import '../screens/image_detail_screen.dart';

class ImageGrid extends StatelessWidget {
  final List<ImageModel> images;

  ImageGrid({required this.images});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: images.length,
      itemBuilder: (context, index) {
        final image = images[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImageDetailScreen(image: image),
            ),
          ),
          child: Image.network(image.url, fit: BoxFit.cover),
        );
      },
    );
  }
}